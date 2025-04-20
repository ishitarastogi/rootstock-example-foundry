// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/RootToken.sol";

contract RootTokenTest is Test {
    RootToken token;

    address alice = address(0xA1CE);
    address bob = address(0xB0B);

    uint256 constant CLAIM_AMOUNT = 100 * 10 ** 18;
    uint256 constant COOLDOWN = 1 days;

    function setUp() public {
        token = new RootToken("Root Token", "ROOT");
    }

    function testMetadata() public {
        assertEq(token.name(), "Root Token");
        assertEq(token.symbol(), "ROOT");
        assertEq(token.decimals(), 18);
    }

    function testClaimToMintsTokens() public {
        // Warp forward so block.timestamp >= COOLDOWN
        vm.warp(block.timestamp + COOLDOWN);

        vm.prank(alice);
        token.claimTo(alice);

        assertEq(token.balanceOf(alice), CLAIM_AMOUNT);
    }

    function testCannotClaimBeforeCooldown() public {
        vm.warp(block.timestamp + COOLDOWN);
        vm.prank(alice);
        token.claimTo(alice);

        // Immediately try again → should revert
        vm.prank(alice);
        vm.expectRevert("Faucet: cooldown not passed");
        token.claimTo(alice);
    }

    function testClaimAfterCooldown() public {
        vm.warp(block.timestamp + COOLDOWN);
        vm.prank(bob);
        token.claimTo(bob);

        // Advance by one full cooldown
        vm.warp(block.timestamp + COOLDOWN);

        vm.prank(bob);
        token.claimTo(bob);

        assertEq(token.balanceOf(bob), CLAIM_AMOUNT * 2);
    }

    function testDifferentUsersHaveIndependentCooldowns() public {
        vm.warp(block.timestamp + COOLDOWN);

        vm.prank(alice);
        token.claimTo(alice);

        // Bob can claim immediately after warp without waiting for Alice’s cooldown
        vm.prank(bob);
        token.claimTo(bob);

        assertEq(token.balanceOf(alice), CLAIM_AMOUNT);
        assertEq(token.balanceOf(bob), CLAIM_AMOUNT);
    }
}

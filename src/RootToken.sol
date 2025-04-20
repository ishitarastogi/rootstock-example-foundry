// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title RootToken
/// @notice A simple ERC‑20 “faucet” where anyone can claim a fixed amount of tokens to any address, once per cooldown period.
/// @dev Inherits from OpenZeppelin’s ERC20; uses on‑demand minting.
contract RootToken is ERC20 {
    /// @notice How many tokens a caller receives per claim (100 ROOT)
    uint256 public constant CLAIM_AMOUNT = 100 * 10 ** 18;

    /// @notice Minimum time between claims for the same address (24 hours)
    uint256 public constant COOLDOWN = 1 days;

    /// @notice Timestamp of the last successful claim for each address
    mapping(address => uint256) public lastClaimed;

    /// @param name The ERC20 token name
    /// @param symbol The ERC20 token symbol
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Tokens are minted on demand via claimTo()
    }

    /// @notice Claim `CLAIM_AMOUNT` tokens for `recipient`, but only if `COOLDOWN` has elapsed since their last claim.
    /// @param recipient The address to receive the tokens
    function claimTo(address recipient) external {
        require(
            block.timestamp >= lastClaimed[recipient] + COOLDOWN,
            "Faucet: cooldown not passed"
        );

        lastClaimed[recipient] = block.timestamp;
        _mint(recipient, CLAIM_AMOUNT);
    }
}

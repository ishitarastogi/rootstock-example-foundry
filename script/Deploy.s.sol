// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/RootToken.sol";

contract DeployRootToken is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy with custom name and symbol
        new RootToken("Root Token", "ROOT");

        vm.stopBroadcast();
    }
}

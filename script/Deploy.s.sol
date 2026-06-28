// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/DexxLauncher.sol";

contract Deploy is Script {
    address constant FACTORY =
        0xE85A59c628F7d27878ACeB4bf3b35733630083a9;

    function run() external {
        vm.startBroadcast();

        new DexxLauncher(FACTORY);

        vm.stopBroadcast();
    }
}


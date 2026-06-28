// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/DexxLauncher.sol";

contract Deploy {

    address constant FACTORY =
        0xE85A59c628F7d27878ACeB4bf3b35733630083a9;

    function run() public returns (DexxLauncher launcher) {
        launcher = new DexxLauncher(FACTORY);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/DexxLauncher.sol";

contract Deploy {
    DexxLauncher public launcher;

    function run() public {
        launcher = new DexxLauncher();
    }
}

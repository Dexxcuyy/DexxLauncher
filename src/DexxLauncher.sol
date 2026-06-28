// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./interfaces/IClankerFactory.sol";

contract DexxLauncher {

    address public owner;

    IClankerFactory public factory;

    constructor(address _factory) {
        owner = msg.sender;
        factory = IClankerFactory(_factory);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

}

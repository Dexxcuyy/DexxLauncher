// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../interfaces/IClankerFactory.sol";

library ConfigBuilder {

    function buildTokenConfig(
        address admin,
        string memory name,
        string memory symbol,
        string memory image,
        string memory metadata,
        string memory context
    )
        internal
        view
        returns (IClankerFactory.TokenConfig memory config)
    {
        config.tokenAdmin = admin;
        config.name = name;
        config.symbol = symbol;
        config.salt = bytes32(0);
        config.image = image;
        config.metadata = metadata;
        config.context = context;
        config.originatingChainId = block.chainid;
    }

}

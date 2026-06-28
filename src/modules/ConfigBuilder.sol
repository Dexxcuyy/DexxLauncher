// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../interfaces/IClankerFactory.sol";

library ConfigBuilder {
    address constant HOOK =
        0xb429d62f8f3bFFb98CdB9569533eA23bF0Ba28CC;

    address constant LOCKER =
        0x63D2DfEA64b3433F4071A98665bcD7Ca14d93496;

    address constant MEV_MODULE =
        0xebB25BB797D82CB78E1bc70406b13233c0854413;

    address constant WETH =
        0x4200000000000000000000000000000000000006;

    int24 constant STARTING_TICK = -230400;
    int24 constant TICK_SPACING = 200;

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

    function buildPoolConfig()
        internal
        pure
        returns (IClankerFactory.PoolConfig memory config)
    {
        config.hook = HOOK;
        config.pairedToken = WETH;
        config.tickIfToken0IsClanker = STARTING_TICK;
        config.tickSpacing = TICK_SPACING;
        config.poolData = "";
    }
}

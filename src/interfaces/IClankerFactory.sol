// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IClankerFactory {

    struct TokenConfig {
        string name;
        string symbol;
        string image;
        string metadata;
    }

    struct PoolConfig {
        uint24 fee;
        int24 tickSpacing;
    }

    struct DeploymentConfig {
        TokenConfig tokenConfig;
        PoolConfig poolConfig;
    }

    function deployToken(
        DeploymentConfig calldata config
    ) external payable returns (address token);
}

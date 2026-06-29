// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./interfaces/IClankerFactory.sol";
import "./modules/ConfigBuilder.sol";

error NotOwner();

contract DexxLauncher {
    using ConfigBuilder for *;

    address public immutable owner;
    IClankerFactory public immutable factory;

    modifier onlyOwner() {
       if (msg.sender != owner) revert NotOwner();
       _;
    }

    constructor(address factoryAddress) {
        owner = msg.sender;
        factory = IClankerFactory(factoryAddress);
    }

    function launch(
        IClankerFactory.DeploymentConfig calldata config
    )
        external
        payable
        onlyOwner
        returns (address token)
    {
        token = factory.deployToken{value: msg.value}(config);
    }

    function launchSimple(
        string calldata name,
        string calldata symbol,
        string calldata image,
        string calldata metadata,
        string calldata context
    )
        external
        payable
        onlyOwner
        returns (address token)
    {
        IClankerFactory.TokenConfig memory tokenConfig =
            ConfigBuilder.buildTokenConfig(
                owner,
                name,
                symbol,
                image,
                metadata,
                context
            );

        IClankerFactory.DeploymentConfig memory deployment =
            ConfigBuilder.buildDeployment(tokenConfig);

        token = factory.deployToken{value: msg.value}(deployment);
    }

    function launchZeroSupply(
        IClankerFactory.TokenConfig calldata config
    )
        external
        onlyOwner
        returns (address token)
    {
        token = factory.deployTokenZeroSupply(config);
    }

    function claimFees(address token) external onlyOwner {
        factory.claimTeamFees(token);
    }

    function deploymentInfo(
        address token
    )
        external
        view
        returns (IClankerFactory.DeploymentInfo memory)
    {
        return factory.tokenDeploymentInfo(token);
    }
}

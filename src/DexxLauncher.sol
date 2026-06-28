// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./interfaces/IClankerFactory.sol";

contract DexxLauncher {

    address public owner;
    IClankerFactory public factory;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
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

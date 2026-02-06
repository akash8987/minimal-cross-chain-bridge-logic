// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./BridgeToken.sol";

contract BridgeVault {
    BridgeToken public token;
    address public relayer;

    event TeleportInitiated(address indexed user, uint256 amount, uint256 targetChainId);
    event TeleportCompleted(address indexed user, uint256 amount);

    constructor(address _token) {
        token = BridgeToken(_token);
        relayer = msg.sender;
    }

    modifier onlyRelayer() {
        require(msg.sender == relayer, "Unauthorized");
        _;
    }

    function teleport(uint256 amount, uint256 targetChainId) external {
        token.burn(msg.sender, amount);
        emit TeleportInitiated(msg.sender, amount, targetChainId);
    }

    function completeTeleport(address user, uint256 amount) external onlyRelayer {
        token.mint(user, amount);
        emit TeleportCompleted(user, amount);
    }
}

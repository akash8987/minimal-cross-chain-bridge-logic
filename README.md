# Minimal Cross-Chain Bridge Logic

This repository contains a professional-grade, "flat" structure implementation of a Cross-Chain Token Bridge. It utilizes the **Burn-and-Mint** model, ensuring that the total supply remains constant across multiple networks.

## Features
* **Burn & Mint Mechanism:** Securely handles asset transfers between chains.
* **Access Control:** Restricts minting capabilities to authorized bridge relayers.
* **Event Logging:** Standardized events for easy off-chain indexing.

## Tech Stack
* **Solidity:** ^0.8.20
* **OpenZeppelin:** Standard ERC20 and Access Control modules.

## Getting Started
1. Deploy the `BridgeToken.sol` on both Chain A and Chain B.
2. Configure the `BridgeVault.sol` with the authorized relayer address.
3. Use the `teleport` function to move assets.

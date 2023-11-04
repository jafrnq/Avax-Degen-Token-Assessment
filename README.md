# DegenToken Smart Contract

This README provides an overview of the DegenToken smart contract, its features, and how to use it.

## Introduction

DegenToken is an Ethereum-based ERC-20 token and smart contract that allows users to buy and trade virtual sneakers. It extends the functionalities of the ERC-20 standard and adds custom features to represent ownership of virtual sneakers within the Ethereum blockchain.

## Features

### ERC-20 Token

DegenToken is an ERC-20 token, which means it follows the standard Ethereum token interface. Users can transfer, mint, and burn Degen (DGN) tokens.

### Sneaker Ownership

DegenToken allows users to purchase virtual sneakers with DGN tokens and track ownership of these sneakers. The contract maintains a mapping of owned sneakers for each user.

### Ownership Management

The contract inherits from the `Ownable` contract, meaning that the contract creator has exclusive privileges to mint new tokens.

### Sneaker Types

The contract supports the following sneaker types, each with a unique purchase price:
1. "AF1" - Air Force 1
2. "J1" - Jordan 1
3. "PandaDunks" - Panda Dunks
4. "Onitsuka" - Onitsuka Tiger

### Events

The contract emits events to notify users of sneaker purchases. The `SneakerPurchased` event is triggered when a user buys a sneaker.

### Available Sneakers

You can use the `listAvailableSneakers` function to retrieve a list of available sneaker types.

## Usage

### Installation

To deploy the DegenToken smart contract, you need to compile it and deploy it to the Ethereum network using a tool like Remix or Truffle.

### Interacting with the Contract

Once the contract is deployed, users can interact with it by connecting to it from a web3-enabled application or using a tool like MetaMask.

#### Functions

- `buySneaker(string memory sneakerType)`: Users can buy virtual sneakers by specifying the sneaker type. The function checks the user's DGN balance and transfers the required amount to the contract.

- `getOwnedSneakers(address owner, string memory sneakerType)`: This function allows users to query the number of a specific sneaker type they own.

- `mint(address to, uint256 amount)`: This function is reserved for the contract owner and allows the creation of new DGN tokens.

- `burn(uint256 amount)`: Users can burn their DGN tokens to reduce their balance.

- `transfer(address to, uint256 amount)`: This function allows users to transfer DGN tokens to another address.

- `listAvailableSneakers()`: This function returns an array of available sneaker types.

## License

The DegenToken smart contract is open-source and follows the MIT License.

```solidity
// SPDX-License-Identifier: MIT
```

## Version

The contract uses Solidity version 0.8.18 and the OpenZeppelin 4.9.0 library for ERC-20 and Ownable functionality.

```solidity
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";
```

## Note

Make sure to review and adapt the contract and its functionality to your specific requirements and deployment needs.

For any questions or issues, please refer to the [OpenZeppelin documentation](https://docs.openzeppelin.com/contracts/4.x/).

Feel free to contribute to the contract's development and open issues or pull requests on the project's repository.

[Link to the DegenToken Repository](https://github.com/your/repo)

## Disclaimer

This README provides a high-level overview of the DegenToken smart contract. It is essential to thoroughly understand the contract and its implications before deployment. Use this contract responsibly and consider potential security risks and vulnerabilities in a real-world scenario.

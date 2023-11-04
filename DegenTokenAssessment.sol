// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(string => uint256) public sneakerPrices;
    mapping(address => mapping(string => uint256)) public ownedSneakers;

    event SneakerPurchased(address indexed buyer, string sneakerType);

    constructor() ERC20("Degen", "DGN") {
        // Initialize sneaker prices
        sneakerPrices["AF1"] = 2500;
        sneakerPrices["J1"] = 7000;
        sneakerPrices["PandaDunks"] = 12000;
        sneakerPrices["Onitsuka"] = 1200;
    }

       function buySneaker(string memory sneakerType) public payable {
        require(sneakerPrices[sneakerType] > 0, "Invalid sneaker type");
        require(balanceOf(msg.sender) >= sneakerPrices[sneakerType], "Insufficient DGN balance");

        _transfer(msg.sender, address(this), sneakerPrices[sneakerType]);
        ownedSneakers[msg.sender][sneakerType] += 1; // Increment owned sneakers
        _burn(msg.sender, sneakerPrices[sneakerType]);
        emit SneakerPurchased(msg.sender, sneakerType);
    }

    function getOwnedSneakers(address owner, string memory sneakerType) public view returns (uint256) {
        return ownedSneakers[owner][sneakerType];
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

  function listAvailableSneakers() public pure  returns (string[] memory) {
        string[] memory sneakerList = new string[](4); // Assuming 4 types of sneakers

        sneakerList[0] = "AF1";
        sneakerList[1] = "J1";
        sneakerList[2] = "PandaDunks";
        sneakerList[3] = "Onitsuka";

        return sneakerList;
    }
}
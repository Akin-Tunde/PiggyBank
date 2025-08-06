// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PiggyBank {
    address public owner;

    // Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to receive Ether. msg.value is the amount sent.
    receive() external payable {}

    // Function to check the contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Only the owner can withdraw the funds
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}

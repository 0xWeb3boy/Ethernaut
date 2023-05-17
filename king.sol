// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {
    // State variables declaring king, prize, owner of the contract.
    address king;
    uint public prize;
    address public owner;

    // Constructor function setting up the owner, king and prize of the game.
    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    // whatever the prize money is currently the amount sent must be greater than that
    // if the require statement is met transfer the funds to king
    // set new king as msg.sender and new prize as msg.value
    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}

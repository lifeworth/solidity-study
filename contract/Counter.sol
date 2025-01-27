// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Counter{
    uint public count;

    function inc() external {
        count+=1;
    }

    function dec() external {
        count-=1;
    }

}
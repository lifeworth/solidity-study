// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract ConstructorDemo {
    address public owner;
    uint256 public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
    
}

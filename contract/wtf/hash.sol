// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract HashDemo {
    function keccak256Demo(string calldata _x) internal pure returns (bytes32) {
        return keccak256(abi.encode(_x));
    }

    function keccak256Demo2(uint _x) ex pure returns (uint) {
        return _x;
    }

    constructor (){
        keccak256Demo2(123);
    }
}

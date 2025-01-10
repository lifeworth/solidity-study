// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract StructDemo {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;



    //初始化结构体
}

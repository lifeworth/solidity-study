// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract DefaultVal{
    uint256 public u;  //0
    int256 public i; //0
    bool public b; //false
    string public s; //''
    address public a;//0x00000
    mapping (address=>uint) public amap; 
    bytes32 public bts;//000000000
    int[3] public arrint;// [0,0,0]
}
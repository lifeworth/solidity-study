// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract LocalVar{
    //状态变量存在于区块链中

    //局部变量随函数执行二销毁

    uint public num = 1;

    function add() external returns (uint _z){
        uint _x = 10;
        _z = 10 + _x;
    }

}
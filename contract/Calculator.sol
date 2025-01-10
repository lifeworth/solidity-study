// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract Calculator{
    function multipy(uint _a,uint _b) external pure returns (uint){
        return _a*_b;
    }

    function divide(uint _a,uint _b) external pure returns (uint){
        require(_b !=0,"can not zero!");
        return _a / _b;
    }
}
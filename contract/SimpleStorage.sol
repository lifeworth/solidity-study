// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;


contract SimpleStorage{
    uint public storedData;


    function set(uint _x) external {
        storedData = _x;
    }
    
    function get() external view returns (uint){
        return storedData;
    }

}
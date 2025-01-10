// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract GobalVar{
    function viewGlobalInfo() external view returns (address,uint,uint){
        address _sender = msg.sender;
        uint _time = block.timestamp;
        uint _number = block.number;
        return (_sender,_time,_number);
    }
}
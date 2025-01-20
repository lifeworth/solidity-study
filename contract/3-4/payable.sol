// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    address public Owner;

    constructor() {
        Owner = msg.sender;
    }

    function deposi() external payable{}

    function getBalance() external  view returns (uint256){
        return address(this).balance;
    }
}

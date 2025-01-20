// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    address public Owner;

    event LOG(address indexed, string);

    constructor() {
        Owner = msg.sender;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function deposi() external payable {}

    fallback() external payable {
        emit LOG(msg.sender, "fallback");
    }

    receive() external payable {
        emit LOG(msg.sender, "receive");
    }
}

contract B {
    address payable public Owner;

    constructor() {
        Owner = payable(msg.sender);
    }

    function deposi() external payable {}

    function callMe(address payable _addr, uint256 _amount) external payable {
        _addr.transfer(_amount);
    }

    function callMe2(address payable _addr, uint256 _amount) external payable {
        abi.encodeWithSelector(A.deposi().selector,1);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

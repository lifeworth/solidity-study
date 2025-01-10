// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract ArrayDemo {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function setOp() external {
        balances[msg.sender] = 123;
    }

    function delOp() external {
        delete balances[msg.sender];
    }
}

contract SimpleBank {
    mapping(address => uint256) public balances;

    function deposit(uint256 _x) external {
        balances[msg.sender] += _x;
    }

    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "Not enough balance!");
        balances[msg.sender] -= amount;
    }

    function checkBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}

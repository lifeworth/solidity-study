// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Account {
    address public owner;

    constructor(address _owner) payable {
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public  accounts;

    function createAccount(address _addr) external payable {
        require(msg.value >= 111, "Too low");
        Account newAccount = new Account{value: 111}(_addr);
        accounts.push(newAccount);
    }
}

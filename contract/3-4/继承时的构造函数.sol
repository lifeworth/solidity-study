// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    string public nameA;

    constructor(string memory _name) {
        nameA = _name;
    }
}

contract B {
    string public nameB;

    constructor(string memory _name) {
        nameB = _name;
    }
}

contract C is A, B {
    string public nameC;
    constructor(string memory _nameA,string memory _nameB) A(_nameA) B(_nameB) {
        nameC = _nameA;
    }
   
}

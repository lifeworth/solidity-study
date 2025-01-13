// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract StorageDemo {
    struct StorageDemoStruct {
        string index;
        uint8[3] nums;
    }

    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) myStructs;

    StorageDemoStruct public storageDemo = StorageDemoStruct("123", [1, 2, 3]);

    function updateStr(string calldata _index) external {
        storageDemo.index = _index;
    }

    function readStr(string calldata _index) private{
        
    }
}

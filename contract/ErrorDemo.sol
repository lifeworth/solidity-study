// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ErrorDemo {
    uint256 public u = 456;

    error MyError(address caller, uint256 i);

    function testRequire(uint256 i) external pure returns (uint256) {
        require(i == 123, "u is not 123!");
        return i;
    }

    function testRevert(uint256 i) external pure returns (uint256) {
        if (i >10){
            revert ("i is too high!");
        }
        return i;
    }

    function testAssert(uint256 i) external pure {
        assert(i == 123);
    }

    function testCustomerError(uint256 i) external view{
        if (i >10){
            revert MyError(msg.sender,i);
        }
    }
}

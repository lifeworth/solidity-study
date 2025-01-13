// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract A {
    function foo() external pure virtual returns (string memory) {
        return "A foo";
    }

    function bar() external pure returns (string memory) {
        return "A bar";
    }
}

contract B is A {
    function foo() external pure virtual override returns (string memory) {
        return "B foo";
    }
}

contract C is B {
    function foo() external pure override returns (string memory) {
        return "C foo";
    }
}

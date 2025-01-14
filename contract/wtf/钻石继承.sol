// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/**
 *        A
 *     B     C
 *    
 *        E
 */

contract A {
    event Log(string);

    function foo() public virtual {
        emit Log("Log A");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("Log B");
        super.foo();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("Log C");
        super.foo();
    }
}

contract E is C, B {
    function foo() public override(C, B) {
        super.foo();
    }

    function dCall() external {
        B.foo();
        A.foo();
        C.foo();
    }

    function dCallSuper() external {
        super.foo();
    }
}

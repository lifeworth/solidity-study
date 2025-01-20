// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    event LOG(string);

    function foo() public virtual {
        emit LOG("A foo");
    }
}

contract B is A {
    function foo() public virtual override {
        super.foo();
        emit LOG("B foo");
    }
}

contract C is A {
    function foo() public virtual override {
        super.foo();
        emit LOG("C foo");
    }
}

contract D is C, B {
    function foo() public virtual override(B, C) {
        emit LOG("D foo");
    }

    function directCall() public {
        B.foo();
    }

    function superCall() public {
        super.foo();
    }
}

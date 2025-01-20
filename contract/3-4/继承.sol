// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract A {
    function foo() external pure virtual returns (string memory _result) {
        _result = "A";
    }

    function bar() external pure virtual returns (string memory _result) {
        _result = "A";
    }
}

contract B is A {
    function foo()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "B";
    }

    function bar()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "B";
    }
}

contract C is A {
    function foo()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "C";
    }

    function bar()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "C";
    }
}

contract D is C {
    function foo()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "D";
    }

    function bar()
        external
        pure
        virtual
        override
        returns (string memory _result)
    {
        _result = "D";
    }
}

contract Z is A, C, D, B {
    function foo()
        external
        pure
        override(A, B, C, D)
        returns (string memory _result)
    {
        _result = "Z";
    }

    function bar()
        external
        pure
        override(A, B, C, D)
        returns (string memory _result)
    {
        _result = "Z";
    }
}

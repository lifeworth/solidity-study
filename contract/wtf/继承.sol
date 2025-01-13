// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Yeye {
    event Log(string);

    function hip() external virtual myModifier {
        emit Log("yeye");
    }

    function pop() external virtual myModifier {
        emit Log("yeye");
    }

    function yeye() external myModifier {
        emit Log("yeye");
    }

    modifier myModifier() virtual {
        emit Log("modifierYeye");
        _;
    }
}

contract Baba is Yeye {
    function hip() external virtual override myModifier {
        emit Log("baba");
    }

    function pop() external virtual override myModifier {
        emit Log("baba");
    }

    function baba() external myModifier {
        emit Log("baba");
    }

    modifier myModifier() virtual override {
        emit Log("modifierBaba");
        _;
    }
}

contract Erzi is Yeye, Baba {
    function hip() external override(Yeye, Baba) myModifier {
        emit Log("erzi");
    }

    function pop() external override(Baba, Yeye) myModifier {
        emit Log("erzi");
    }

    function erzi() external myModifier {
        emit Log("erzi");
    }

    modifier myModifier() override(Baba, Yeye) {
        emit Log("modifierErzi");
        _;
    }
}

contract A {
    string public a;

    constructor(string memory _a) {
        a = _a;
    }
}

contract B is A("contract B") {}

contract C is A {
    constructor(string memory _c) A(_a * _c) {}
}

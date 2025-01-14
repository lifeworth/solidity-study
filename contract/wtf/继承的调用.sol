// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Yeye {
    event Log(string);

    function hip() public virtual myModifier {
        emit Log("yeye");
    }

    function pop() public virtual myModifier {
        emit Log("yeye");
    }

    function yeye() public myModifier {
        emit Log("yeye");
    }

    modifier myModifier() virtual {
        emit Log("modifierYeye");
        _;
    }
}

contract Baba is Yeye {
    function hip() public virtual override myModifier {
        emit Log("baba");
    }

    function pop() public virtual override myModifier {
        emit Log("baba");
    }

    function baba() public myModifier {
        emit Log("baba");
    }

    modifier myModifier() virtual override {
        emit Log("modifierBaba");
        _;
    }
}

//子合约有两种方式调用父合约的函数，直接调用和利用super关键字
contract Erzi is Yeye, Baba {
    function hip() public override(Yeye, Baba) myModifier {
        emit Log("erzi");
    }

    function pop() public override(Baba, Yeye) myModifier {
        emit Log("erzi");
    }

    function erzi() public myModifier {
        emit Log("erzi");
    }

    modifier myModifier() override(Baba, Yeye) {
        emit Log("modifierErzi");
        _;
    }

    //直接通过合约名称调用 注意，会调用儿子的modifier
    function callParent() external {
        Yeye.hip();
    }

    //通过super关键字调用 注意，会调用儿子的modifier,按照继承顺序，从右到左调用父合约
    function callParentSuper() external {
        super.hip();
    }
}

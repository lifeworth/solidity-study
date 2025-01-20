// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Caller {
    uint256 public num;

    function myDelegateCall(address _addr, uint256 _num) external {
        (bool success, ) = _addr.delegatecall(
            abi.encodeWithSelector(Callee.setNum.selector, _num)
        );
        require(success,"delegate call failed");
    }
}

contract Callee {
    uint256 public num;

    function setNum(uint256 _num) external {
        num = _num;
    }
}

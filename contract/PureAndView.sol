// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract PureAndViewFun {
    uint public pureVariable;

    constructor(uint _initVal){
        pureVariable = _initVal;
    }

    function mutily(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x * _y;
    }

    function viewFun() external view returns (uint x) {
        return pureVariable;
    }
}

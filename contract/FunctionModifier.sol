// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract FunctionModifier {
    uint256 public number = 1;
    uint256 public number2 = 1;
    uint256 public count = 1;
    bool public paused = false;

    modifier nonZero() {
        require(number != 0, "number must not be zero");
        _;
    }

    function doubleNumber() external nonZero {
        number *= 2;
    }

    function resetNumber() external nonZero {
        number = 0;
    }

    function incr(uint256 _x) external cap(_x) {
        number2 += _x;
    }

    modifier cap(uint256 _x) {
        require(_x <= 100, "can not more than 100!");
        _;
    }

    modifier whenNotPaused(uint256 _x) {
        if (!paused) _;
        else {
            revert("Already paused");
        }
    }

    modifier sandwich() {
        count += 1;
        _;
        count *= 2;
    }

    function bySandwich(uint256 _x) external sandwich {
        count += _x;
    }
}

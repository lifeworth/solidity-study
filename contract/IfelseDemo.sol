// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract IfElseDemo {
    function processNumber(uint256 x) external pure returns (uint256) {
        if (x < 10) {
            return 1;
        } else if (x >= 10 && x <= 20) {
            return 2;
        } else {
            return 3;
        }
    }

    function processNumber2(uint256 _x) external pure returns (uint256) {
        // if (_x < 50) return 1;
        // return 2;

        return _x <50?1:2;

    }
}

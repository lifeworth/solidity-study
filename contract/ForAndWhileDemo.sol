// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ForAndLoopDemo {
    function forLoop(uint256 n) external pure returns (uint256) {
        uint256 j = 0;
        for (uint256 i = 1; i <= n; ++i) {
            j = j + i;
        }
        return j;
    }
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    uint256 public count = 0;

    function increament() external {
        count++;
    }

    function getCount() external  view returns (uint256) {
        return count;
    }
}

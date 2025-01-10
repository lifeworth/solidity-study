// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract IterableMapping {
    mapping(address => uint256) public balances;
    address[] public keys;
    mapping(address => bool) public inserted;

    function set(address _k, uint256 _v) external {
        balances[_k] = _v;

        if (!inserted[_k]) {
            keys.push(_k);
            inserted[_k] = true;
        }
    }

    function getSize() external view returns (uint256) {
        return keys.length;
    }

    function readFromKeysAndbalances(uint256 _index)
        external
        view
        returns (uint256)
    {
        return balances[keys[_index]];
    }

    function first() external view returns (uint256) {
        return balances[keys[0]];
    }

    function last() external view returns (uint256) {
        return balances[keys[keys.length - 1]];
    }
}

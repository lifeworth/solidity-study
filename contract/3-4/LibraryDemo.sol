// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

library Math {
    function max(uint256 _x, uint256 _y) internal pure returns (uint256) {
        return _x <= _y ? _y : _x;
    }
}

contract Test {
    function testMax(uint256 _x, uint256 _y) external pure returns (uint256) {
        return Math.max(_x, _y);
    }
}

library ArrayLibrary {
    function find(uint256[] memory array, uint256 _val)
        internal
        pure
        returns (uint256)
    {
        for (uint256 i; i < array.length; i++) {
            if (array[i] == _val) {
                return i;
            }
        }
        revert();
    }
}

contract TestAtrray {
    using ArrayLibrary for uint256[];
    uint256[] public arr = [3, 2, 1];

    function testFind(uint256[] memory array, uint256 _val)
        external
        pure
        returns (uint256)
    {
        // return ArrayLibrary.find(array, _val);
        return array.find(_val);
    }
}

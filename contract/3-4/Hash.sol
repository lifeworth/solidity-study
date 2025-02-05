// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

library Hash {
    function testHash(string memory _s) external pure returns (bytes32) {
        bytes memory encode = getEncode(_s);
        bytes32 hash = keccak256(encode);
        return hash;
    }

    function getEncode(string memory _s) internal pure returns (bytes memory) {
        return abi.encode(_s);
    }
}

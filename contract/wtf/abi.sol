// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

// ABI编码有4个函数：abi.encode, abi.encodePacked, abi.encodeWithSignature, abi.encodeWithSelector
// ABI解码有1个函数：abi.decode，用于解码abi.encode的数据
contract AbiDemo {
    uint256 x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint256[2] array = [5, 6];

    function abiEncode() external view returns (bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }

    function abiEncodePacked() external view returns (bytes memory result) {
        result = abi.encodePacked(x, addr, name, array);
    }

    function abiEncodeWithSignature()
        external
        view
        returns (bytes memory result)
    {
        result = abi.encodeWithSignature(
            "foo(uint256,address,string,uint256[2])",
            x,
            addr,
            name,
            array
        );
    }

    function abiEncodeWithSelector()
        external
        view
        returns (bytes memory result)
    {
        result = abi.encodeWithSelector(
            bytes4(keccak256("foo(uint256,address,string,uint256[2])")),
            x,
            addr,
            name,
            array
        );
    }

    function abiDecode(bytes memory data)
        external pure 
        returns (
            uint256 dx,
            address daddr,
            string memory dname,
            uint256[2] memory darray
        )
    {
        (dx, daddr, dname, darray) = abi.decode(
            data,
            (uint256, address, string, uint256[2])
        );
    }
}

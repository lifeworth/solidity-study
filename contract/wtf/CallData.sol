// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract CallDateDemo {
    event LOG(string);

    function callDataDdemo(string calldata _x) external returns (bytes memory) {
        emit LOG("callDataDdemo log");
        return msg.data;
    }

    // 0x46bc8173
    function look(string calldata _x) external returns (bytes4) {
        emit LOG("look log");
        return bytes4(keccak256("callDataDdemo(string)"));
    }

    //调用
    function callByAbi() external returns (bool success1, bytes memory data1) {
        (bool success1, bytes memory data1) = address(this).call(
            abi.encodeWithSelector(0x46bc8173, "abc")
        );
    }
}

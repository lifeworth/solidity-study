// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract LogMessage {
    event MyEvent(address indexed sender, address indexed revicer, string msg);

    function sendMessage(address _to, string calldata _msg) external {
        emit MyEvent(msg.sender, _to, _msg);
    }
}

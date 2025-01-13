// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SimpleStorage1 {
    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}

contract MessageStore {
    string public message;

    function setMessage(string calldata _message) external {
        message = _message;
    }

    function getMessage() external view returns (string memory) {
        return message;
    }
}

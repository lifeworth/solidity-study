// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ReceiveETH {
    //收到的eth数量 剩余gas
    event Log(uint256 amount, uint256 gas);

    //收到eth后触发
    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    //返回合约Eth余额
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

//三种发送方式 call,send,transfer
contract SendETH {
    constructor() payable {} //部署时调用

    receive() external payable {}

    error sendFailed();
    error callFailed();

    //transfer  失败会revert
    function transferDemo(address payable _to, uint256 amount)
        external
        payable
    {
        _to.transfer(amount);
    }

    // send 失败不会revert，返回值是bool 需要根据返回值做逻辑处理
    function sendDemo(address payable _to, uint256 amount) external payable {
        bool success = _to.send(amount);
        if (!success) {
            revert sendFailed();
        }
    }

    // call没有gas限制，最为灵活，是最提倡的方法
    function callDemo(address payable _to, uint256 amount) external payable {
        (bool success, ) = _to.call{value: amount}("");
        if (!success) {
            revert callFailed();
        }
    }
}

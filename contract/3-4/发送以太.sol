// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract D {
    address public Owner;

    event LOG(address indexed, string);

    constructor() {
        Owner = msg.sender;
    }

    fallback() external payable {
        emit LOG(msg.sender, "fallback");
    }

    receive() external payable {
        emit LOG(msg.sender, "receive");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function deposi() external payable {}

    function mySend(address payable _addr) external payable{
        (bool success) = _addr.send(msg.value);
        require(success,"my send failed");
    }


    function myTransfer(address payable _addr) external payable {
        _addr.transfer(msg.value);
    }

    function myCall(address payable _addr) external payable {
        (bool success,) = _addr.call{value: msg.value}("");
        require(success,"my call failed");
    }
}
/**
*   transfer: 无返回值，gas限制在2300，不会重入攻击，失败会回滚
*   send: 有布尔返回值，相比transfer，可以通过返回值自行处理成功/失败逻辑
*   call: 不限制gas，允许控制转账的 gas 数量，返回布尔
*   
*   transfer()：简单且安全，限制 gas 使用，自动回滚失败的交易。
*   send()：与 transfer() 类似，但返回布尔值以供手动检查成功与否。
*   call()：最灵活的方式，允许设置特定的 gas 和处理返回值，但需要小心使用。
*
**/


contract E{
    receive() external payable { }
    function getBalance() public view returns(uint256 result){
        result = address(this).balance;
    }
}


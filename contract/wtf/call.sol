// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/**
 *   目标合约地址.call(字节码);
 *   其中字节码利用结构化编码函数abi.encodeWithSignature获得：
 *      abi.encodeWithSignature("函数签名", 逗号分隔的具体参数)
 *    函数签名为"函数名（逗号分隔的参数类型）"。例如
 *      abi.encodeWithSignature("f(uint256,address)", _x, _addr)。
 *    另外call在调用合约时可以指定交易发送的ETH数额和gas数额：
 *   目标合约地址.call{value:发送数额, gas:gas数额}(字节码);
 *
 *
 *
 *
 *
 *
 */
contract OtherContract {
    uint256 private _x = 0; // 状态变量x
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    fallback() external payable {}

    // 返回合约ETH余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable {
        _x = x;
        // 如果转入ETH，则释放Log事件
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    // 读取x
    function getX() external view returns (uint256 x) {
        x = _x;
    }
}

contract MyCall {
    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);

    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX()，同时可以发送ETH
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setXX(uint256)", x)
        );

        emit Response(success, data); //释放事件
    }

    function getX(address payable _addr) external returns (uint256) {
        (bool success,bytes memory data) = _addr.call(abi.encodeWithSignature("getX()"));
        emit Response(success, data);
        return abi.decode(data, (uint256));
    }

}

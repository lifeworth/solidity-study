// SPDX-License-Identifier: MIT
// WTF Solidity by 0xAA

pragma solidity ^0.8.7;

import "./IERC20.sol";

contract Faucet {
    //     状态变量
    // 我们在水龙头合约中定义3个状态变量
    // amountAllowed设定每次能领取代币数量（默认为100，不是一百枚，因为代币有小数位数）。
    // tokenContract记录发放的ERC20代币合约地址。
    // requestedAddress记录领取过代币的地址。

    uint256 public amountAllowed = 100; // 每次领 100 单位代币
    address public tokenContract;
    mapping(address => bool) public requestedAddress;

    //     事件
    // 水龙头合约中定义了1个SendToken事件，记录了每次领取代币的地址和数量，在requestTokens()函数被调用时释放。
    event SendToken(address indexed Receiver, uint256 indexed Amount);

    // 函数
    // 合约中只有两个函数：
    // 构造函数：初始化tokenContract状态变量，确定发放的ERC20代币地址。
    // requestTokens()函数，用户调用它可以领取ERC20代币。

    constructor(address _tokenContract) {
        tokenContract = _tokenContract;
    }

    function requestTokens() external {
        require(!requestedAddress[msg.sender], "Can't Request Multiple Times!"); // 判断是否领取代币数量
        IERC20 ierc20 = IERC20(tokenContract);
        require(ierc20.balanceOf(tokenContract) < amountAllowed, "no left");
        ierc20.transfer(msg.sender, amountAllowed);
        requestedAddress[msg.sender] = true;

        emit SendToken(msg.sender, amountAllowed);
    }
}

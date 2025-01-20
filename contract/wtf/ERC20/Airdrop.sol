// SPDX-License-Identifier: MIT
// WTF Solidity by 0xAA

pragma solidity ^0.8.7;

import "./IERC20.sol";

contract AirDrop {
    mapping(address => uint256) failTransferList;

    // Airdrop空投合约逻辑非常简单：利用循环，一笔交易将ERC20代币发送给多个地址。合约中包含两个函数
    // getSum()函数：返回uint数组的和。

    function getSum(uint256[] calldata _arr)
        internal
        pure
        returns (uint256 result)
    {
        for (uint256 i = 0; i < _arr.length; i++) {
            result += _arr[i];
        }
    }

    // multiTransferToken()函数：发送ERC20代币空投，包含3个参数：
    // _token：代币合约地址（address类型）
    // _addresses：接收空投的用户地址数组（address[]类型）
    // _amounts：空投数量数组，对应_addresses里每个地址的数量（uint[]类型）
    // 该函数有两个检查：第一个require检查了_addresses和_amounts两个数组长度是否相等；
    // 第二个require检查了空投合约的授权额度大于要空投的代币数量总和。

    function multiTransferToken(
        address _token,
        address[] calldata _addresses,
        uint256[] calldata _amounts
    ) external {
        require(_addresses.length == _amounts.length, "not equal");
        IERC20 ierc20 = IERC20(_token);
        require(
            ierc20.allowance(msg.sender, address(this)) < getSum(_amounts),
            "no left"
        );

        for (uint256 i = 0; i < _addresses.length; i++) {
            ierc20.transferFrom(msg.sender, _addresses[i], _amounts[i]);
        }
    }

    //     multiTransferETH()函数：发送ETH空投，包含2个参数：
    // _addresses：接收空投的用户地址数组（address[]类型）
    // _amounts：空投数量数组，对应_addresses里每个地址的数量（uint[]类型）

    /// 向多个地址转账ETH
    function multiTransferETH(
        address payable[] calldata _addresses,
        uint256[] calldata _amounts
    ) public payable {
        // 检查：_addresses和_amounts数组的长度相等
        require(
            _addresses.length == _amounts.length,
            "Lengths of Addresses and Amounts NOT EQUAL"
        );
        uint256 _amountSum = getSum(_amounts); // 计算空投ETH总量
        // 检查转入ETH等于空投总量
        require(msg.value == _amountSum, "Transfer amount error");
        // for循环，利用transfer函数发送ETH
        for (uint256 i = 0; i < _addresses.length; i++) {
            // 注释代码有Dos攻击风险, 并且transfer 也是不推荐写法
            // Dos攻击 具体参考 https://github.com/AmazingAng/WTF-Solidity/blob/main/S09_DoS/readme.md
            // _addresses[i].transfer(_amounts[i]);
            (bool success, ) = _addresses[i].call{value: _amounts[i]}("");
            if (!success) {
                failTransferList[_addresses[i]] = _amounts[i];
            }
        }
    }
}

// ERC20代币合约
contract ERC20 is IERC20 {
    mapping(address => uint256) public override balanceOf;

    mapping(address => mapping(address => uint256)) public override allowance;

    uint256 public override totalSupply; // 代币总供给

    string public name; // 名称
    string public symbol; // 符号

    uint8 public decimals = 18; // 小数位数

    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
    }

    // @dev 实现`transfer`函数，代币转账逻辑
    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // @dev 实现 `approve` 函数, 代币授权逻辑
    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // @dev 实现`transferFrom`函数，代币授权转账逻辑
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    // @dev 铸造代币，从 `0` 地址转账给 调用者地址
    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // @dev 销毁代币，从 调用者地址 转账给  `0` 地址
    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}

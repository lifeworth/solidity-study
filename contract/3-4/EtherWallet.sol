// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract EtherWallet {
    address public owner;
    event LOG(address indexed, string, uint256);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit LOG(msg.sender, "hava send", msg.value);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function despose() external payable {}

    function getBalanceOfEtherWallet() public view returns (uint256) {
        return address(this).balance;
    }

    function tiqu(uint256 _amount) external payable onlyOwner {
        payable(msg.sender).transfer(_amount);
        emit LOG(msg.sender, "hava tiqu", _amount);
    }
}

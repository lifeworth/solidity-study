// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract MyOwner {
    address public owner;
    uint256 public count;

    constructor() {
        owner = msg.sender; // current contract caller is the owner
    }

    modifier onlyOwner(address addr) {
        require(msg.sender == owner, "You do not have authority");
        _;
    }

    function setOwner(address _addr) external onlyOwner(_addr) {
        require(_addr != address(0), "Address cannot be null");
        owner = _addr;
    }

    function transferOwnership(address _addr) external onlyOwner(_addr) {
        require(_addr != address(0), "Address cannot be null");
        owner = _addr;
    }

    function anyOneCall() external {
        count += 1;
    }

    function resetCount() external {
        require(owner == msg.sender, "Address must be owner");
        count = 0;
    }
}

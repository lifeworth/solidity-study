// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

interface ICounter {
    function increament() external;

    function getCount() external view returns (uint256);
}

contract MyCounterCaller {
    function callIncreament(address _addr) external {
        ICounter counter = ICounter(_addr);
        counter.increament();
    }

     function callGetCount(address _addr) external view  returns (uint256){
        ICounter counter = ICounter(_addr);
        return counter.getCount();
    }
}

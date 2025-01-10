// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract fuctionOutDemo {
    function returnMenu() public pure returns (uint256, bool) {
        return (100, true);
    }

    function returnNamed() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
        x = 2;
    }

    function destructuringAssignment() public pure returns (uint   ,bool,uint  ) {
        uint a;        
        bool b;
        uint c;
        (a, b) = returnMenu();
        (c,) = returnMenu();
        return (a,b,c);

    }
}

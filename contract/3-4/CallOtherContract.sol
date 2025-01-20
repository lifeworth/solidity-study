// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract MyTargetContract {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256 result) {
        result = x;
    }

    function setXAndReceiveEther(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXAndValue() external payable returns (uint ,uint256) {
        return (x,value);
    }
}

contract MyCallerContract {
    event Log(string, uint256);
    event Log2(string, uint256, uint256);
    
    receive() external payable {}

    function setTargetX(address _target,uint _x) external {
        // MyTargetContract xx = new MyTargetContract();
        // xx.setX(123);
        MyTargetContract xx = MyTargetContract(_target);
        xx.setX(_x);
    }

    function getTargetX(address _target) external view returns (uint result){
        MyTargetContract xx = MyTargetContract(_target);
        return xx.getX();
    }

    function setXWithEther(address _target) external payable {
        MyTargetContract xx = MyTargetContract(_target);
        xx.setXAndReceiveEther{value: msg.value}(666);
    }

    function getXAndValueFromTarget(address _target) external  payable returns (uint ,uint256){
        MyTargetContract xx = MyTargetContract(_target);
        return xx.getXAndValue();
    }
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    string public message;
    uint256 public num;
    uint256 public num2;

    event Log(string);

    function foo(string memory _msg, uint256 _num) external {
        message = _msg;
        num = _num;
    }

    
}

contract Caller {
    function callFoo(
        address _testContract,
        string memory _msg,
        uint256 _num
    ) external {
        (bool success, bytes memory result) = _testContract.call(
            abi.encodeWithSignature("foo(string,uint256)", _msg, _num)
        );
        require(success, "Caller callFoo call failed");
    }

    function callNonExistentFunction(address _testContract) external {
        (bool success, bytes memory result) = _testContract.call(
            abi.encodeWithSignature("abc()")
        );
    }
}

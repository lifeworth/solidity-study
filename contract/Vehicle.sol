// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract VehicleDemo {
    struct Vehicle {
        string make;
        uint16 year;
        address owner;
    }

    Vehicle[] public vehicleArr;

    //添加车辆
    function addToArrays() external {
        vehicleArr.push(
            Vehicle({make: "Toyota", year: 2000, owner: msg.sender})
        );
        vehicleArr.push(Vehicle("Toyota", 2001, msg.sender));
        Vehicle memory single;
        single.make = "byd";
        single.year = 2002;
        single.owner = msg.sender;
        vehicleArr.push(single);
    }

    //访问和修改特定车辆
    function readAndModify() external {
        Vehicle storage _index0 = vehicleArr[0];
        uint year = _index0.year;
        _index0.year = 1000;
    }

    //删除车辆
    function deleteCar() external {
        delete vehicleArr;
    }
}

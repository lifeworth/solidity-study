// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract StructDemo {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car = Car("Ford", 2015, msg.sender);
    Car public car2 = Car({owner: msg.sender, year: 2020, model: "Tesla"});
    Car public car3;

    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    //初始化结构体
    function initCar3() external {
        car3.model = "Toyota";
        car3.year = 2000;
        car3.owner = msg.sender;
    }

    //初始化结构体数组
    function initCarArrays() external {
        cars.push(Car("byd", 2025, msg.sender));
    }

    //访问和修改Structs
    function readAndModify() external {
        Car storage _car = cars[0];
        uint _year = _car.year;
        _car.year = 1111;
    }

    //删除属性和对象
    function deleteProtitiesAndObj() external {
        delete car.year;
        delete car;
    }
}

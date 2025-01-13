// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract VehicleDemo {
    enum OrderStatus {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    Order[] public  orders;

    struct Order {
        address ownerAddr;
        OrderStatus orderStatus;
    }

    //添加新订单到数组
    function addOrder() external {
        orders.push(Order(msg.sender, OrderStatus.None));
    }

    //更新订单状态
    function updateOrderStatus() external {
        Order storage order0 = orders[0];
        order0.orderStatus = OrderStatus.Pending;
    }

    //获取订单状态
    function getOrderStatus() external view returns (OrderStatus) {
        Order storage order0 = orders[0];
        return order0.orderStatus;
    }

    //重置订单状态到默认值
    function resetOrderStatus() external {
        Order storage order0 = orders[0];
        delete order0.orderStatus;
    }


}

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.18 <0.9.0;

contract MyNewContract {
    uint public orderCount;
    
    struct Order {
        address client;
        uint pizzaSelection;
        bool delivered;
    }

    mapping(uint => Order) public orders;

    function placeOrderOld(uint pizzaSelection) public payable returns (uint){
        if(msg.value >= 1 ether) {
            Order memory newOrder = Order(msg.sender, pizzaSelection, false);
            orderCount++;
            orders [orderCount] = newOrder;
        }
        else{
            revert("the required payment amount is not met.");
        }
        return orderCount;
    }
    
    function placeOrder(uint pizzaSelection) public payable returns (uint){
        require(msg.value >= 1 ether,"the required payment amount is not met.");
        Order memory newOrder = Order(msg.sender, pizzaSelection, false);
        orderCount++;
        orders [orderCount] = newOrder;
        return orderCount;
    }

    function delivered(uint orderNumber) public {
        orders [orderNumber].delivered = true;
        assert(orders [orderNumber].delivered == true);
    }
    
}

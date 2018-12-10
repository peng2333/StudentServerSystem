package com.sss.service.order;

import com.sss.bean.FoodOrders;

import java.util.List;

public interface OrderService {
    public List<FoodOrders> findAllOrder();

    public void editOrder(FoodOrders foodOrders);

    public void deleteOrder(String ordersNumber);

//    public void addOrder(FoodOrders foodOrders);
}

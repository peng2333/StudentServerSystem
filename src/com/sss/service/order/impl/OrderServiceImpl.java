package com.sss.service.order.impl;

import com.sss.bean.FoodOrders;
import com.sss.mapper.order.OrderMapper;
import com.sss.service.order.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Resource
    private OrderMapper orderMapper;

    @Override
    public List<FoodOrders> findAllOrder() {
        return orderMapper.selectAll();
    }

    @Override
    public void editOrder(FoodOrders foodOrders) {
        orderMapper.editOrder(foodOrders);
    }

    @Override
    public void deleteOrder(String ordersNumber) {
        orderMapper.deleteByOrdersNumber(ordersNumber);
    }

  /*  @Override
    public void addOrder(FoodOrders foodOrders) {
        orderMapper.addOrder(foodOrders);
    }*/
}

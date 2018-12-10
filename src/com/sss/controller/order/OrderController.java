package com.sss.controller.order;

import com.sss.bean.FoodOrders;
import com.sss.bean.Order;
import com.sss.service.order.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @RequestMapping("findAllOrders")
    public @ResponseBody Order findAllOrder(@RequestParam("page")Integer page, @RequestParam("limit")Integer limit){
        List<FoodOrders> list = orderService.findAllOrder();
        Order order = new Order();
        order.setCode(0);
        order.setMsg("");
        order.setCount(list.size());
        order.setData(list);
        return order;
    }

    @RequestMapping("editOrder")
    public String editOrder(@ModelAttribute FoodOrders foodOrders){
        orderService.editOrder(foodOrders);
        return "/admin/admin_dingdan";
    }

    @RequestMapping("deleteOrder")
    public void deleteOrder(@RequestParam String ordersNumber){
        orderService.deleteOrder(ordersNumber);
    }

 /*   @RequestMapping("addOrder")
    public String addOrder(@ModelAttribute FoodOrders foodOrders){
        orderService.addOrder(foodOrders);
        return "/admin/admin_dingdan";
    }*/
}

package com.sss.service.breakfast;


import com.sss.bean.Food;
import com.sss.bean.FoodFoodOrder;
import com.sss.bean.FoodOrders;

import java.util.List;

public interface TodayOrderService {
    List<FoodOrders> findByDate(Integer uid, String sdate);

    List<FoodFoodOrder> findByOrdersNum(String ordersNumber);

    Food findByFid(Integer fid);
}

package com.sss.service.breakfast;

import com.sss.bean.FoodOrders;

/**
 * @author 李金发666
 * @date 2018/6/8 20:25
 */
public interface FoodOrderService {

	void addFoodOrder(FoodOrders foodOrders,Integer uid);


	public double[][] findAllFoodOrder();

}

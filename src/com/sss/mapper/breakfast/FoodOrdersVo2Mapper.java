package com.sss.mapper.breakfast;

import com.sss.bean.FoodOrdersVo2;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/12 18:13
 */
public interface FoodOrdersVo2Mapper extends Mapper<FoodOrdersVo2> {

	@Insert("INSERT INTO food_food_orders (orders_number, fid, food_number, price_sum) VALUES (#{uuid}, #{vo2.food.fid}, #{vo2.foodNumber}, #{vo2.priceSum})")
	public void insertOrdersVo(@Param("vo2") FoodOrdersVo2 vo2, @Param("uuid") String uuid);


	@Select("select * from food_food_orders where orders_number=#{ordersNumber}")
	public List<FoodOrdersVo2> findAllFoodOrdersVo2(@Param("ordersNumber") String ordersNumber);



}

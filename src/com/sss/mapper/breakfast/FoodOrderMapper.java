package com.sss.mapper.breakfast;

import com.sss.bean.Food;
import com.sss.bean.FoodFoodOrder;
import com.sss.bean.FoodOrders;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/8 20:29
 */
public interface FoodOrderMapper extends Mapper<FoodOrders> {

    @Select("SELECT * FROM `food_food_orders` WHERE orders_number = #{ordersNumber}")
    @Results ({
        @Result(property = "ordersNmuber" ,column = "orders_number"),
        @Result(property = "fid" ,column = "fid"),
        @Result(property = "foodNumber" ,column = "food_number"),
        @Result(property = "priceSum" ,column = "price_sum")
    })

    public List<FoodFoodOrder> findByOrderNum(@Param("ordersNumber") String ordersNumber);


    @Select("select * from food where fid = #{fid}")
    public Food findByFid(@Param("fid") Integer fid);





    @Select("select * from food_orders")
    @Results({
		    @Result(property = "ordersNumber",column = "orders_number"),
		    @Result(property = "ordersPrice",column = "orders_price"),
		    @Result(property = "foodVoList",many = @Many(select = "com.sss.mapper.breakfast.FoodOrdersVo2Mapper.findAllFoodOrdersVo2"),column = "orders_number")
    })
	public List<FoodOrders> selectAllFoodOrder();





}

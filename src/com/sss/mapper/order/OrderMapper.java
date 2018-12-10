package com.sss.mapper.order;

import com.sss.bean.FoodOrders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

public interface OrderMapper extends Mapper<FoodOrders>{
    @Update("UPDATE food_orders SET create_time=#{createTime},orders_price=#{ordersPrice},orders_remark=#{ordersRemark},orders_state=#{ordersState},sid=#{sid},uid=#{uid} WHERE orders_number = #{ordersNumber}")
    public void editOrder(FoodOrders foodOrders);

    @Delete("delete from food_orders where orders_number = #{ordersNumber}")
    public void deleteByOrdersNumber(@Param("ordersNumber") String ordersNumber);

}

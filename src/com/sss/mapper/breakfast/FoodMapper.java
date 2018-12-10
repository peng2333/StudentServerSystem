package com.sss.mapper.breakfast;

import com.sss.bean.Food;
import com.sss.bean.FoodSort;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface FoodMapper extends Mapper<Food> {

	/**
	 * @author: 朱元浩
	 * @date: 2018/6/11 10:07
	 * @Param: [sid]
	 * @return: java.util.List<com.sss.bean.FoodSort>
	 *
	 *     查询当前商家所有食物分类
	 */
	@Select("select * from food_sort where shop_id = #{sid}")
	@Results({
			@Result(property = "sortId" ,column = "sort_id"),
			@Result(property = "foodList" ,many = @Many(select="com.sss.mapper.breakfast.FoodMapper.selectBySortId"),column = "sort_id"),
			@Result(property = "sortName" ,column = "sort_name"),
			@Result(property = "shopId" ,column = "shop_id")
	})
	List<FoodSort> selectBySid(@Param("sid") Integer sid);

	/**
	 * @author: 朱元浩
	 * @date: 2018/6/11 11:13
	 * @Param: [sortId]
	 * @return: java.util.List<com.sss.bean.Food>
	 *     查询对应分类的食物
	 */

	@Select("select * from food where sort_id = #{sortId}")
	@ResultMap("foodResult")
	List<Food> selectBySortId(@Param("sortId") Integer sortId);

	/**
	 * @author: 朱元浩
	 * @date: 2018/6/19 10:53
	 * @Param: [number]
	 * @return: java.util.List<com.sss.bean.Food>
	 * @Description: 通过传入数量查询（降序）
	 */
	@Select("select * from food order by food_sales desc limit #{number}")
	@Results( id = "foodResult" , value = {
			@Result(property = "fid" ,column = "fid"),
			@Result(property = "fname" ,column = "fname"),
			@Result(property = "fprice" ,column = "fprice"),
			@Result(property = "imageUrl" ,column = "image_url"),
			@Result(property = "sortId" ,column = "sort_id"),
			@Result(property = "foodSales" , column = "food_sales")
	})
	List<Food> selectByNumber(@Param("number")Integer number);
}
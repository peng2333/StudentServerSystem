package com.sss.service.breakfast;

import com.sss.bean.Food;
import com.sss.bean.FoodSort;

import java.util.List;

public interface FoodService {

    /**
     * 查询当前商家所有食物分类
     * @return
     */
    public List<FoodSort> selectBySid(Integer sid);


	/**
	 * 根据食品id查询食品
	 * @return
	 */
	public Food selectFoodById(Integer fid);

	/**
	 * 通过传入数量查询（降序）
	 * @param number
	 * @return
	 */
	public List<Food> selectByNumber(Integer number);
}

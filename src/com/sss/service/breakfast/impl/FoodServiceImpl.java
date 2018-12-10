package com.sss.service.breakfast.impl;

import com.sss.bean.Food;
import com.sss.bean.FoodSort;
import com.sss.mapper.breakfast.FoodMapper;
import com.sss.service.breakfast.FoodService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class FoodServiceImpl implements FoodService {

    @Resource
    private FoodMapper foodMapper;

    /**
	 * @author: 朱元浩
	 * @date: 2018/6/11 10:00
	 * @Param: [sid]
	 * @return: java.util.List<com.sss.bean.FoodSort>
	 *     查询当前商家所有食物分类
	 */
    @Override
    public List<FoodSort> selectBySid(Integer sid) {
        return foodMapper.selectBySid(sid);
    }

	@Override
	public Food selectFoodById(Integer fid) {
		return foodMapper.selectByPrimaryKey(fid);
	}

	/**
	 * @author: 朱元浩
	 * @date: 2018/6/19 10:52
	 * @Param: [number]
	 * @return: java.util.List<com.sss.bean.Food>
	 * @Description: 通过传入数量查询（降序）
	 */
    @Override
    public List<Food> selectByNumber(Integer number) {
        return foodMapper.selectByNumber(number);
    }


}

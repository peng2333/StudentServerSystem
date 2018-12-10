package com.sss.service.breakfast.impl;

import com.sss.bean.Food;
import com.sss.bean.FoodFoodOrder;
import com.sss.bean.FoodOrders;
import com.sss.mapper.breakfast.FoodOrderMapper;
import com.sss.service.breakfast.TodayOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class TodayOrderServiceImpl implements TodayOrderService {

    @Resource
    private FoodOrderMapper foodOrderMapper;

    @Override
    public List<FoodOrders> findByDate(Integer uid, String sdate) {
        Example example = new Example(FoodOrders.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid", uid);
        criteria.andEqualTo("createTime", sdate);

        List<FoodOrders> foodOrders = foodOrderMapper.selectByExample(example);
        return foodOrders;
    }

    @Override
    public List<FoodFoodOrder> findByOrdersNum(String ordersNumber) {
        List<FoodFoodOrder> byOrderNum = foodOrderMapper.findByOrderNum(ordersNumber);
        return byOrderNum;
    }

    @Override
    public Food findByFid(Integer fid) {
        return foodOrderMapper.findByFid(fid);
    }
}

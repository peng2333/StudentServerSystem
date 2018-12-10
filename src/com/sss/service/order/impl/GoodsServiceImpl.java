package com.sss.service.order.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sss.bean.Food;
import com.sss.bean.Goods;
import com.sss.mapper.order.GoodsMapper;
import com.sss.service.order.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;


    @Override
    public Goods findAll(Integer page,Integer limit) {
//        PageHelper.startPage(page, limit);
        List<Food> list = goodsMapper.selectAll();
        //PageInfo<Food> data = new PageInfo<>(list);
        Goods goods = new Goods();
        goods.setCode(0);
        goods.setMsg("");
        goods.setCount(list.size());
        goods.setData(list);
        //int pages = data.getPages();

        return goods;
    }

    @Override
    public void deleteByFid(Integer fid) {
        goodsMapper.deleteByFid(fid);
    }

    @Override
    public void edit(Food food) {
        goodsMapper.edit(food);
    }

    @Override
    public void addGoods(Food food) {
        goodsMapper.addGoods(food);
    }
}

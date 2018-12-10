package com.sss.service.order;

import com.sss.bean.Food;
import com.sss.bean.Goods;

import java.util.List;

public interface GoodsService {
    public Goods findAll(Integer page, Integer limit);

    public void deleteByFid(Integer fid);

    public void edit(Food food);

    public void addGoods(Food food);
}

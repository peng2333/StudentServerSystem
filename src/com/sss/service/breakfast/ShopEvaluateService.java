package com.sss.service.breakfast;

import com.github.pagehelper.PageInfo;
import com.sss.bean.ShopEvaluate;

import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/20 23:26
 */
public interface ShopEvaluateService {

    public PageInfo<ShopEvaluate> findAllBySid(String sid, Integer page);


    List<Integer> findEvaluateList(Integer sid);
}

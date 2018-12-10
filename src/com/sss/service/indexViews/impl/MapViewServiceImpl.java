package com.sss.service.indexViews.impl;

import com.github.pagehelper.PageHelper;
import com.sss.bean.MapView;
import com.sss.mapper.indexViews.MapViewMapper;
import com.sss.service.indexViews.MapViewService;
import com.sss.vo.MapViewVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by XiongTianCi on 2018/7/3
 *
 * @author tianci
 */
@Service
@Transactional
public class MapViewServiceImpl implements MapViewService {
    @Resource
    private MapViewMapper mapViewMapper;
    /**
    *@Author:XiongTianCi
    *@Description:查询所有用户访问的数据，在地图上显示
    *@return:
    */
    @Override
    public List<MapViewVo> findAll() {
        return mapViewMapper.findAll();
    }

    /**
    *@Author:XiongTianCi
    *@Description:查询用户最多的三个城市
    *@return:
    */
    @Override
    public List<MapViewVo> findMaxCity() {
        PageHelper.startPage(1,3);
        List<MapViewVo> maxCity = mapViewMapper.findMaxCity();
        return maxCity;
    }
}

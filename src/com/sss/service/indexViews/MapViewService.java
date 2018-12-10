package com.sss.service.indexViews;

import com.sss.bean.MapView;
import com.sss.mapper.indexViews.MapViewMapper;
import com.sss.vo.MapViewVo;

import java.util.List;

/**
 * Created by XiongTianCi on 2018/7/3
 *
 * @author tianci
 */
public interface MapViewService {
    List<MapViewVo> findAll();

    List<MapViewVo> findMaxCity();
}

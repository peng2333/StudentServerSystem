package com.sss.mapper.indexViews;

import com.sss.bean.MapView;
import com.sss.vo.MapViewVo;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by XiongTianCi on 2018/7/3
 *
 * @author tianci
 */
public interface MapViewMapper extends Mapper<MapView> {

    @Select("SELECT COUNT(*) num ,city c FROM map_view GROUP BY city")
    @Results({
            @Result(property = "value",column = "num"),
            @Result(property = "name",column = "c")
    })
    List<MapViewVo> findAll();

    /**
    *@Author:XiongTianCi
    *@Description:查询用户最多的三个城市
    *@return:
    */
    @Select("SELECT COUNT(*) num,city c FROM `map_view` GROUP BY city ORDER BY num DESC")
    @Results({
            @Result(property = "value",column = "num"),
            @Result(property = "name",column = "c")
    })
    List<MapViewVo> findMaxCity();

}

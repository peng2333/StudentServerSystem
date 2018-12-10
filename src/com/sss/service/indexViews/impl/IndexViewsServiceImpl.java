package com.sss.service.indexViews.impl;

import com.sss.bean.MapView;
import com.sss.bean.VisitView;
import com.sss.mapper.indexViews.MapViewMapper;
import com.sss.mapper.indexViews.VisitViewMapper;
import com.sss.service.indexViews.IndexViewsService;
import ipdatabase.ip.IpHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by XiongTianCi on 2018/7/2
 *
 * @author tianci
 */
@Service
@Transactional
public class IndexViewsServiceImpl implements IndexViewsService {
    @Resource
    private VisitViewMapper visitViewMapper;
    @Resource
    private MapViewMapper mapViewMapper;

    /**
    *@Author:XiongTianCi
    *@Description:将访问的数据添加进数据库中
    *@return:
    */
    @Override
    public void addVisit(String path) {
        // 通过path，获得数据库中对应的对象
        Example example = new Example(VisitView.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("path",path);
        //
        VisitView indexViews = visitViewMapper.selectOneByExample(example);
        // 判断是否为空
        if(indexViews == null){
            // 为空，则第一次访问此功能
            indexViews = new VisitView();
            indexViews.setNum(1);
            indexViews.setPath(path);
            // 保存进数据库中
            visitViewMapper.insert(indexViews);
        }else{
            // 不为空，则此功能被多次访问
            // 更改此功能的访问次数；即：num+1
            indexViews.setNum(indexViews.getNum() + 1);
            // 保存进数据库中
            visitViewMapper.updateByPrimaryKey(indexViews);
        }
    }

    /**
    *@Author:XiongTianCi
    *@Description:查询统计的访问数据
    *@return:
    */
    @Override
    public List<VisitView> findAllWithVisit() {
        List<VisitView> visitViews = visitViewMapper.selectAll();

        return visitViews;
    }



    /**
    *@Author:XiongTianCi
    *@Description:重置数据库（用户访问统计为每天更新）
    *@return:
    */
    @Override
    public void resetDatabase() {
        // 更新数据
       /* List<VisitView> list = visitViewMapper.selectAll();
        for(VisitView v : list){
            v.setNum(0);
        }
        // 更新数据库
        for(VisitView v : list){
            visitViewMapper.updateByPrimaryKey(v);
        }*/
    }

    /**
     *@Author:XiongTianCi
     *@Description:添加ip到数据库
     *@return:
     */
    @Override
    public void addIp(String ip) {
        // 判断，本机ip：0:0:0:0:0:0:0:1 不会记录到数据库中
        if(!"0:0:0:0:0:0:0:1".equals(ip)){
            // 先通过ip查询，如果以存在，不操作
            Example example = new Example(MapView.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("ip",ip);
            MapView mapView = mapViewMapper.selectOneByExample(example);
            if(mapView == null){
                // 不存在此用户，查询此用户的地址，添加进数据库中
                mapView = new MapView();
                // 封装数据
                mapView.setIp(ip);
                // 获得ip对应的城市
                String city = IpHelper.findRegionByIp(ip);
                /*判断局域网，目前局域网显示的是全球*/
                if("全球".equals(city)){
                    city = "江苏";
                }
                mapView.setCity(city);

                mapViewMapper.insert(mapView);
            }
        }
    }
}

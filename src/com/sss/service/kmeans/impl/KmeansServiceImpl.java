package com.sss.service.kmeans.impl;

import com.sss.bean.Cluster;
import com.sss.bean.Point;
import com.sss.reidsDao.PointDao;
import com.sss.service.kmeans.KmeansService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 专门对Kmeans进行各种操作的类接口实现类
 * @author 赵飞
 */
@Service
public class KmeansServiceImpl implements KmeansService {

    private String POINT_KEY = "Points";
    @Resource
    private PointDao pointDao;

    /**
     * 查询所有点
     * @author 赵飞
     */
    @Override
    public List<Cluster> findAll() {
//        Point point_100 = pointDao.getCacheObject("point_100");
//        System.out.println(point_100);
//        List<Point> points = pointDao.getCacheList(POINT_KEY);
//
//        for (Point point : points) {
//            System.out.println(point);
//        }
        List<Cluster> cluster = pointDao.getCacheList("Cluster");
        System.out.println("_________________________________");
        System.out.println(cluster);
        if (cluster==null || cluster.size()==0){
            //空的
            return null;
        }
        return cluster;
    }

//    /**
//     * 创建一个点
//     * @author 赵飞
//     */
//    @Override
//    public void setPoint(Point point) {
////        pointDao.setCacheObject("point_100",point);
//        List<Point> points = new ArrayList<>();
//        points.add(new Point(new double[]{1.0,2.0},2,3,1.0));
//        points.add(new Point(new double[]{2.0,2.0},3,3,2.0));
//        points.add(new Point(new double[]{2.0,3.0},3,3,3.0));
//        points.add(new Point(new double[]{4.0,5.0},3,2,4.0));
//        points.add(new Point(new double[]{5.0,6.0},1,2,5.0));
//
//        pointDao.setCacheList(POINT_KEY,points);
//
//        pointDao.addCacheList(POINT_KEY,new Point(new double[]{1235.0,1236.0},1,2,5.0));
//    }

//    /**
//     * 创建一个点集合
//     * @param pointList
//     */
//    @Override
//    public void setPointList(List<Point> pointList){
//        pointDao.addCacheList(POINT_KEY,pointList);
//    }

    /**
     * 把结果集存入
     * @param c
     */
    @Override
    public void setClusterList(List<Cluster> c) {
        pointDao.setCacheList("Cluster",c);
    }

}

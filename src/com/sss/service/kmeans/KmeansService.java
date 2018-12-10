package com.sss.service.kmeans;

import com.sss.bean.Cluster;
import com.sss.bean.Point;

import java.util.List;

/**
 * 专门对Kmeans进行各种操作的类接口
 * @author 赵飞
 */
public interface KmeansService {
    List<Cluster> findAll();

//    void setPoint(Point point);

//    void setPointList(List<Point> pointList);

    void setClusterList(List<Cluster> c);
}

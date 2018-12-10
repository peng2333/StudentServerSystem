package com.sss.util;


import com.sss.bean.Point;

/*欧式距离*/
public class DistanceCompute {

//    求欧式距离
    public double getEuclideanDis(Point p1, Point p2){
        double count_dis = 0;
        //位置，可能是二维空间，三维空间，N维空间
        double[] p1_local_array = p1.getLocalArray();
        double[] p2_local_array = p2.getLocalArray();

        //进行过滤
        if (p1_local_array.length != p2_local_array.length){
            //不同维度的数据无法计算
            throw new IllegalArgumentException("长度不同");
        }


        for (int i = 0; i < p1_local_array.length; i++) {
            //欧式距离！！
            count_dis += Math.pow(p1_local_array[i]-p2_local_array[i],2);
        }

        return Math.sqrt(count_dis);
    }

}

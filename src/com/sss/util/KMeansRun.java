package com.sss.util;


import com.sss.bean.Cluster;
import com.sss.bean.Point;

import java.util.*;

public class KMeansRun {
    private int kNum;       //筛选个数
    private int iterNum = 10;   //迭代次数

    private int iterMaxTimes = 100000;  //单次迭代最大运行次数
    private int iterRunTimes = 0;        //单次迭代实际运行次数
    private double disDiff = (double)0.01;    //单次迭代终止条件，两次运行中类中心的距离差,最低预测底线


    private List<double[]> original_data = null; //存放——原始数据集
    private static List<Point> pointList = null;    //存放——原始数据集构建的点集
    private DistanceCompute disC = new DistanceCompute();   //欧式测距
    private int len = 0;        //记录每个数据点的维度

    public KMeansRun(int k, List<double[]> original_data){
        //设置K
        this.kNum = k;
        //初始数据
        this.original_data = original_data;
        //维度
        this.len = original_data.get(0).length;
        //检查
        check();
        //初始化点集
        init();
    }

    private void check() {
        if (kNum == 0){
            throw new IllegalArgumentException("K必须不等于0");
        }
        if(original_data == null){
            throw new IllegalArgumentException("数据不能为空");
        }
    }

    /*
    * 初始化数据集，把数组转换成Point类型
    * */
    private void init(){
        pointList = new ArrayList<Point>();
        for (int i = 0, j = original_data.size(); i < j; i++) {
            pointList.add(new Point(original_data.get(i),i));
        }
    }

    private Set<Cluster> chooseCenterCluster(){
        /*选定区块*/
        Set<Cluster> clustersSet = new HashSet<Cluster>();
        Random random = new Random();
        for (int id = 0; id < kNum;) {
            /*随机一个点作为核心*/
            Point point = pointList.get(random.nextInt(pointList.size()));
            boolean flag = true;
            /*判断是否存在过*/
            for (Cluster cluster : clustersSet) {
                if (cluster.getCenter().equals(point)){
                    flag = false;
                }
            }

            //如果随机选取的点没被选过
            if (flag){
                //生成一个cluster
                Cluster cluster = new Cluster(id,point);
                clustersSet.add(cluster);
                id++;
            }
        }
        return clustersSet;
    }

    /*
    *  为一个点分配一个类！！
    * */
    public void cluster(Set<Cluster> clusterSet){
        //计算每个点到K个中心的距离，并且为每个点标记别号
        for (Point point : pointList) {
            double min_ids = Integer.MAX_VALUE;
            for (Cluster cluster : clusterSet) {
                //测距
                double tmp_dis = (double) Math.min(disC.getEuclideanDis(point, cluster.getCenter()), min_ids);
                if (tmp_dis != min_ids){
                    min_ids = tmp_dis;
                    //添加所属的区块
                    point.setClusterId(cluster.getId());
                    //最短的距离
                    point.setDist(min_ids);
                }
            }
        }

        for (Cluster cluster : clusterSet) {
            //清楚区块成员
            cluster.getMembers().clear();
            for (Point point : pointList) {
                if (point.getClusterId()==cluster.getId()){
                    //给所有的点分别加入每个类别
                    cluster.addPoint(point);
                }
            }
        }
    }

    /*
    * 计算每个区块的新中心位置
    * */
    public boolean calculateCenter(Set<Cluster> clusterSet){
        boolean ifNeedIter = false;
        for (Cluster cluster : clusterSet) {
            //所有成员
            List<Point> point_list = cluster.getMembers();
            //所有的和
            double[] sumAll = new double[len];
            for (int i = 0; i < len; i++) {
                //所有点，对应各个维度求和
                for (int j = 0; j < point_list.size(); j++) {
                    /**没懂*/
                    sumAll[i]+=point_list.get(j).getLocalArray()[i];
                }
            }

            //开始计算平均值
            for (int i = 0; i < sumAll.length; i++) {
                //每个维度的和除以总共的点数的数量
                sumAll[i] = (double) sumAll[i]/point_list.size();
            }
            //计算两个新、旧中心的距离，任意一个类中心移动距离大于dis_diff则继续迭代
            if (disC.getEuclideanDis(cluster.getCenter(),new Point(sumAll))>disDiff){
                ifNeedIter = true;
            }

            //设置新的中心位置
            cluster.setCenter(new Point(sumAll));
        }
        return ifNeedIter;
    }

    /*运行k-means*/
    public Set<Cluster> run(){
        //区块集合
        Set<Cluster> clusterSet = chooseCenterCluster();
        boolean ifNeedIter = true;
        while (ifNeedIter){
            //分区块
            cluster(clusterSet);
            //重定制质点
            ifNeedIter = calculateCenter(clusterSet);
            iterRunTimes++;
        }
        return clusterSet;
    }

    public int getIterTimes() {
        return iterRunTimes;
    }
}

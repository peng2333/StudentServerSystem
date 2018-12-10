package com.sss.entr;

import com.sss.bean.Cluster;
import com.sss.bean.Point;
import com.sss.bean.Result;
import com.sss.util.KMeansRun;
import com.sss.util.ReadDataPoi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class RowMain {
    //数据存储集合
    private  List<double[]> dataSet;
    //结果存储集合
    private  List<Result> resultList = new ArrayList<Result>();
    //xlsx地址
    private  String address;

    private Set<Cluster> clusters;

    public List<double[]> getDataSet() {
        return dataSet;
    }

    public Set<Cluster> getClusters() {
        return clusters;
    }

    public void setClusters(Set<Cluster> clusters) {
        this.clusters = clusters;
    }

    public void doit() throws IOException {
        //进行初始化数据
//        initDataSet();

        //进行计算获取结果
        Set<Cluster> clusterSet = kMeansGetClusters(4);

        clusters = clusterSet;
        //统计结果
        setEndResult(clusterSet);
    }

    //初始化数据
    private void initDataSet() throws IOException {
        ReadDataPoi readData = new ReadDataPoi();
        readData.read(address);
        dataSet = readData.getDataSet();
    }


    //进行核心K-means算法计算
    private Set<Cluster> kMeansGetClusters(int K) {
        //k：区块
        KMeansRun kRun = new KMeansRun(K,dataSet);

        //区块集返回
        Set<Cluster> clusterSet = kRun.run();
//        System.out.println("单次迭代结果:"+kRun.getIterTimes());
//        for (Cluster cluster : clusterSet) {
//            System.out.println(cluster);
//        }
        return clusterSet;
    }


    //存入结果
    public void setEndResult(Set<Cluster> clusterSet){
        for (Cluster cluster : clusterSet) {
            setResultToList(cluster);
        }
    }

    //将cluster视作结果存入List
    private void setResultToList(Cluster cluster) {
        Result result = new Result();
        int pointSize = cluster.getMembers().size();
        //概率
        int prob = Math.round(((float)pointSize/(float) dataSet.size())*100);
        result.setProb(prob);

        //存入结果
        Point center = cluster.getCenter();
        double[] localArray = center.getLocalArray();
        result.setLocalArray(new int[localArray.length]);
        int[] loa = result.getLocalArray();
        for (int i = 0; i < localArray.length; i++) {
            loa[i] = (int) Math.round(localArray[i]);
        }

//        //将结果打印到控制台
//        System.out.print("localArray:\n\t");
//        for (int i : loa) {
//            System.out.print(+i+"\t");
//        }
//        System.out.println();
//        System.out.println("概率:"+result.getProb()+"%\n");
        resultList.add(result);
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<double[]> getDataSet(ArrayList<double[]> dataSet) {
        return this.dataSet;
    }

    public void setDataSet(List<double[]> dataSet) {
        this.dataSet = dataSet;
    }

    public List<Result> getResultList() {
        return resultList;
    }

    public void setResultList(List<Result> resultList) {
        this.resultList = resultList;
    }

    public String getAddress() {
        return address;
    }
}

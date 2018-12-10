package com.sss.bean;

import java.io.Serializable;
import java.util.Arrays;

public class Point implements Serializable {
    private double[] localArray;
    private int id;
    private int clusterId;  //属于哪个核心
    private double dist;     //表示所属的中心的距离

    public Point() {
    }

    public Point(double[] localArray, int id) {
        this.localArray = localArray;
        this.id = id;
    }

    public Point(double[] localArray) {
        this.localArray = localArray;
    }

    public Point(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || getClass() != obj.getClass())
            return false;

        Point point = (Point) obj;
        if (point.localArray.length != localArray.length)
            return false;

        for (int i = 0; i < localArray.length; i++) {
            if (Double.compare(point.localArray[i], localArray[i]) != 0) {
                return false;
            }
        }
        return true;
    }

    @Override
    public int hashCode() {
        double x = localArray[0];
        double y = localArray[localArray.length - 1];
        long temp = x != +0.0d ? Double.doubleToLongBits(x) : 0L;
        int result = (int) (temp ^ (temp >>> 32));
        temp = y != +0.0d ? Double.doubleToLongBits(y) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "Point{" +
                "localArray=" + Arrays.toString(localArray) +
                ", id=" + id +
                ", clusterId=" + clusterId +
                ", dist=" + dist +
                '}';
    }

    public double[] getLocalArray() {
        return localArray;
    }

    public void setLocalArray(double[] localArray) {
        this.localArray = localArray;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClusterId() {
        return clusterId;
    }

    public void setClusterId(int clusterId) {
        this.clusterId = clusterId;
    }

    public double getDist() {
        return dist;
    }

    public void setDist(double dist) {
        this.dist = dist;
    }


    public Point(double[] localArray, int id, int clusterId, double dist) {

        this.localArray = localArray;
        this.id = id;
        this.clusterId = clusterId;
        this.dist = dist;
    }
}

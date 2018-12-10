package com.sss.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*类聚*/
public class Cluster implements Serializable {
    private int id;
    private Point center;//中心
    //成员
    private List<Point> members = new ArrayList<Point>();


    @Override
    public String toString() {
        String toString = "Cluster \n" + "Cluster_id=" + this.id + ", center:{" + this.center.toString()+"}";
        for (Point point : members) {
            toString+="\n"+point.toString();
        }
        return toString+"\n";
    }

    public void addPoint(Point newPoint) {
//        if (!members.contains(newPoint)){
            members.add(newPoint);
//        }else{
//            System.out.println("样本数据点 {"+newPoint.toString()+"} 已经存在！");
//        }
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Point getCenter() {
        return center;
    }

    public void setCenter(Point center) {
        this.center = center;
    }

    public List<Point> getMembers() {
        return members;
    }

    public void setMembers(List<Point> members) {
        this.members = members;
    }

    public Cluster() {

    }

    public Cluster(int id, Point center) {
        this.id = id;
        this.center = center;
    }

    public Cluster(int id, Point center, List<Point> members) {

        this.id = id;
        this.center = center;
        this.members = members;
    }
}

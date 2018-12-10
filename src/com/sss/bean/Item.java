package com.sss.bean;

import java.util.Date;

/**
 * Created by ZhangJun on 2018/6/1.
 */
public class Item {
    private String name;//文件名
    private String path;//在服务器上的绝对路径
    private boolean isDir;//是否是文件夹
    private String postfix;//后缀名
    private String size="";//大小
    private Date lastModifyDate;//上次修改时间

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public boolean isDir() {
        return isDir;
    }

    public void setDir(boolean dir) {
        isDir = dir;
    }

    public String getPostfix() {
        return postfix;
    }

    public void setPostfix(String postfix) {
        this.postfix = postfix;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Date getLastModifyDate() {
        return lastModifyDate;
    }

    public void setLastModifyDate(Date lastModifyDate) {
        this.lastModifyDate = lastModifyDate;
    }

    @Override
    public String toString() {
        return "Item{" +
                "name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", isDir=" + isDir +
                ", postfix='" + postfix + '\'' +
                ", size='" + size + '\'' +
                ", lastModifyDate=" + lastModifyDate +
                '}';
    }
}

package com.sss.bean;

import java.util.List;

/**
 * Created by ZhangJun on 2018/6/6.
 */
public class DirTreeBean {
    private String name;
    private String path;
    private boolean spread;
    private List<DirTreeBean> children;

    public DirTreeBean() {
    }

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

    public boolean isSpread() {
        return spread;
    }

    public void setSpred(boolean spread) {
        this.spread = spread;
    }

    public List<DirTreeBean> getChildren() {
        return children;
    }

    public void setChildren(List<DirTreeBean> children) {
        this.children = children;
    }

    public DirTreeBean(String name, String path, boolean spread, List<DirTreeBean> children) {
        this.name = name;
        this.path = path;
        this.spread = spread;
        this.children = children;
    }

    @Override
    public String toString() {
        return "DirTreeBean{" +
                "name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", spread=" + spread +
                ", children=" + children +
                '}';
    }
}

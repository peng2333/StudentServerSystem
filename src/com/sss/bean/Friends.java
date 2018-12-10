package com.sss.bean;

import com.sss.vo.OnlineUserVo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/19
 */
public class Friends {
    private String groupname;
    private Integer Id;
    private List<OnlineUserVo> list = new ArrayList<OnlineUserVo>();

    public Friends() {
    }

    public Friends(String groupname, Integer id, List<OnlineUserVo> list) {
        this.groupname = groupname;
        Id = id;
        this.list = list;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public List<OnlineUserVo> getList() {
        return list;
    }

    public void setList(List<OnlineUserVo> list) {
        this.list = list;
    }

    public Integer getId() {
        return Id;
    }

    public void setGroupId(Integer Id) {
        this.Id = Id;
    }

    @Override
    public String toString() {
        return "Friends{" +
                "groupname='" + groupname + '\'' +
                ", list=" + list +
                '}';
    }
}

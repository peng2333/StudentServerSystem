package com.sss.bean;

import com.sss.vo.OnlineUserVo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/20
 */
public class Data {
    private OnlineUserVo mine;
    private List<Friends> friend = new ArrayList<Friends>();

    public OnlineUserVo getMine() {
        return mine;
    }

    public void setMine(OnlineUserVo mine) {
        this.mine = mine;
    }

    public List<Friends> getFriend() {
        return friend;
    }

    public void setFriend(List<Friends> friend) {
        this.friend = friend;
    }

    @Override
    public String toString() {
        return "Data{" +
                "mine=" + mine +
                ", friend=" + friend +
                '}';
    }
}

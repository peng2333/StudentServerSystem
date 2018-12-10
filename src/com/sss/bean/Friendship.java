package com.sss.bean;

/**
 * Created by ZhangPeng on 2018/6/20
 */
public class Friendship {
    private Integer uid1;
    private Integer uid2;
    private Integer groupId;

    public Friendship() {
    }

    public Friendship(Integer uid1, Integer uid2, Integer groupId) {
        this.uid1 = uid1;
        this.uid2 = uid2;
        this.groupId = groupId;
    }

    public Integer getUid1() {
        return uid1;
    }

    public void setUid1(Integer uid1) {
        this.uid1 = uid1;
    }

    public Integer getUid2() {
        return uid2;
    }

    public void setUid2(Integer uid2) {
        this.uid2 = uid2;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}

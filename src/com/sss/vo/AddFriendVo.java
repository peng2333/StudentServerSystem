package com.sss.vo;

import com.sss.bean.User;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by ZhangPeng on 2018/6/28
 */
@Table(name = "addFriend")
public class AddFriendVo {
    @Id
    private Integer afid;
    private Integer sendUid;
    private String remark;
    private Integer groupId;
    private Integer uid;
    private Date stime = new Date();
    private User user;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    public Integer getAfid() {
        return afid;
    }

    public void setAfid(Integer afid) {
        this.afid = afid;
    }

    public Integer getSendUid() {
        return sendUid;
    }

    public void setSendUid(Integer sendUid) {
        this.sendUid = sendUid;
    }


    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "AddFriendVo{" +
                "afid=" + afid +
                ", sendUid=" + sendUid +
                ", remark='" + remark + '\'' +
                ", groupId=" + groupId +
                ", uid=" + uid +
                ", stime=" + stime +
                ", user=" + user +
                '}';
    }
}

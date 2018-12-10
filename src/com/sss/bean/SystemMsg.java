package com.sss.bean;

import javax.persistence.Table;
import java.util.Date;

/**
 * Created by ZhangPeng on 2018/7/2
 */
@Table(name = "system_msg")
public class SystemMsg {
    private String name;
    private Integer sendId;
    private Integer receiveId;
    private Integer type;
    private Date stime;

    public SystemMsg() {
    }

    public SystemMsg(Integer sendId, Integer receiveId, Integer type, Date stime) {
        this.sendId = sendId;
        this.receiveId = receiveId;
        this.type = type;
        this.stime = stime;
    }

    public Integer getSendId() {
        return sendId;
    }

    public void setSendId(Integer sendId) {
        this.sendId = sendId;
    }

    public Integer getReceiveId() {
        return receiveId;
    }

    public void setReceiveId(Integer receiveId) {
        this.receiveId = receiveId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

}

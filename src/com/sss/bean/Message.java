package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Message的实例
 * 魏彤羽
 */
public class Message {
    @Id
    /**Message的主键*/
    private Integer mid;
    /**
     * Question的主键
     */
    private Integer qid;
    @Column(name = "q_uid")
    /**Question的uid*/
    private Integer quid;
    @Column(name = "a_uid")
    /**Answer的uid*/
    private Integer auid;
    /*消息类型*/
    private Integer mtype;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getQuid() {
        return quid;
    }

    public void setQuid(Integer quid) {
        this.quid = quid;
    }

    public Integer getAuid() {
        return auid;
    }

    public void setAuid(Integer auid) {
        this.auid = auid;
    }

    public Integer getMtype() {
        return mtype;
    }

    public void setMtype(Integer mtype) {
        this.mtype = mtype;
    }

}

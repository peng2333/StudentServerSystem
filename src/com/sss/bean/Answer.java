package com.sss.bean;

import javax.persistence.Id;
import java.util.Date;

/**
 * Created by ZhangPeng on 2018/6/7
 */
public class Answer {
    @Id
    private Integer aid;//回答id
    private String an;//回复内容
    private Integer uid;//回复者id
    private Integer qid;//对应的问题id
    private Integer dzs = 0;//点赞数
    private Date dtime;//回复创建时间
    private String dbest;//回复是否最佳
    /**
     * 魏彤羽  一个回复属于一个用户，用于页面问题详情展示
     */
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAn() {
        return an;
    }

    public void setAn(String an) {
        this.an = an;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getDzs() {
        return dzs;
    }

    public void setDzs(Integer dzs) {
        this.dzs = dzs;
    }

    public Date getDtime() {
        return dtime;
    }

    public void setDtime(Date dtime) {
        this.dtime = dtime;
    }

    public String getDbest() {
        return dbest;
    }

    public void setDbest(String dbest) {
        this.dbest = dbest;
    }
}

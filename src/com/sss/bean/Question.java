package com.sss.bean;

import javax.persistence.Id;
import org.springframework.stereotype.Component;

import javax.persistence.Id;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/7
 */

public class Question {
    @Id
    private Integer qid;//问题id
    private String qbt;//问题标题
    private String qs;//问题内容
    private Integer uid;//提问者id
    private Integer djs = 0;//问题点击数
    private Date qtime;//问题创建时间
    private String qstate = "0";//问题解决状态
    private String qstick = "0";//问题是否顶置
    private String qfierce = "0";//问题是否为精品
    private String qtype;//问题分类

    /**
    *@Author:XiongTianCi
    *@Description:每一个问题都绑定其提问user对象
    *@return:
    */
    private User user;

    /**
    *@Author:XiongTianCi
    *@Description:用于存放每个问题创建的时间的str格式
    *@return:
    */
    private String qtimeStr;

    /**魏彤羽  一个问题属于一个用户，用于页面问题详情展示*/
    //private User user;
    /**魏彤羽  一个问题有多个回贴，用于页面问题详情展示*/
    private List<Answer> answerList;


    public List<Answer> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<Answer> answerList) {
        this.answerList = answerList;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getQbt() {
        return qbt;
    }

    public void setQbt(String qbt) {
        this.qbt = qbt;
    }

    public String getQs() {
        return qs;
    }

    public String getQtimeStr() {
        return qtimeStr;
    }

    public void setQtimeStr(String qtimeStr) {
        this.qtimeStr = qtimeStr;
    }

    public void setQs(String qs) {
        this.qs = qs;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getDjs() {
        return djs;
    }

    public void setDjs(Integer djs) {
        this.djs = djs;
    }

    public Date getQtime() {
        return qtime;
    }

    public void setQtime(Date qtime) {
        this.qtime = qtime;
    }

    public String getQstate() {
        return qstate;
    }

    public void setQstate(String qstate) {
        this.qstate = qstate;
    }

    public String getQstick() {
        return qstick;
    }

    public void setQstick(String qstick) {
        this.qstick = qstick;
    }

    public String getQfierce() {
        return qfierce;
    }

    public void setQfierce(String qfierce) {
        this.qfierce = qfierce;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

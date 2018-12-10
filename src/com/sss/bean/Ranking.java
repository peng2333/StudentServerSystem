package com.sss.bean;

import javax.persistence.Id;

/**
 * @author 魏彤羽
 */
public class Ranking {
    @Id
    private Integer uid;
    private Integer number;
    private String uname;
    private String classid;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }
}

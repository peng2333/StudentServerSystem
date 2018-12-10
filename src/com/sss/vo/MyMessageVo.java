package com.sss.vo;

/**
 * @author WangShuang
 * @date 2018/6/11 11:59
 */

public class MyMessageVo {
    private String qname;

    private String username;

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public MyMessageVo() {
    }

    public MyMessageVo(String qname, String username) {
        this.qname = qname;
        this.username = username;
    }
}

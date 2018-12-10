package com.sss.bean;

import javax.persistence.Table;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-28 15:56
 **/
@Table(name = "user_QRCode")
public class UserQRCode {

    private String codeurl;
    private Integer uid;

    public String getCodeurl() {
        return codeurl;
    }

    public void setCodeurl(String codeurl) {
        this.codeurl = codeurl;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "UserQRCode{" +
                "codeurl='" + codeurl + '\'' +
                ", uid=" + uid +
                '}';
    }
}

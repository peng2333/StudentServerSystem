package com.sss.bean;

import javax.persistence.Id;

/**
 * Created by XiongTianCi on 2018/6/28
 * 用于首页中进行功能“时间段访问量”和“ip定位”表的domain
 * @author tianci
 */

public class IpView {
    @Id
    private Integer id;     //
    private String path;    // 访问的路径
    private String ip;      // 用户的ip
    private Integer num;    // 访问此功能的次数

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}

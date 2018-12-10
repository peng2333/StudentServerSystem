package com.sss.bean;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by XiongTianCi on 2018/7/3
 *  用于封装map_view表中数据
 * @author tianci
 */
@Table(name = "map_view")
public class MapView {
    @Id
    private Integer id;
    private String ip;      // 用户ip地址
    private String city;    // 用户所在城市


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}

package com.sss.vo;

/**
 * Created by XiongTianCi on 2018/7/3
 * 用于封装展示地图上的用户访问数据
 * @author tianci
 */
public class MapViewVo {
    private String name;        // 城市
    private Integer value;        // 人数

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public MapViewVo(String name, Integer value) {
        this.name = name;
        this.value = value;
    }

    public MapViewVo() {
    }
}

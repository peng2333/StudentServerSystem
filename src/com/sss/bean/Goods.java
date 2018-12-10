package com.sss.bean;

import com.github.pagehelper.PageInfo;

import java.util.ArrayList;
import java.util.List;

public class Goods {
    private Integer code = 0;
    private String msg = null;
    private Integer count;
    private List<Food> data = new ArrayList<>();

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setData(List<Food> data) {
        this.data = data;
    }

    public List<Food> getData() {
        return data;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}

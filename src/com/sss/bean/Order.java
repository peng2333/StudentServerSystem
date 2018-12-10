package com.sss.bean;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private Integer code = 0;
    private String msg = null;
    private Integer count;
    private List<FoodOrders> data = new ArrayList<>();

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void setData(List<FoodOrders> data) {
        this.data = data;
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

    public List<FoodOrders> getData() {
        return data;
    }

    @Override
    public String toString() {
        return "Order{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}

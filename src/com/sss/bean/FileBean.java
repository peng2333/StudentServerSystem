package com.sss.bean;

import java.util.List;

/**
 * Created by ZhangJun on 2018/6/8.
 */
public class FileBean {
    private String key;
    private List<Item> value;

    public FileBean() {
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public List<Item> getValue() {
        return value;
    }

    public void setValue(List<Item> value) {
        this.value = value;
    }

    public FileBean(String key, List<Item> value) {
        this.key = key;
        this.value = value;
    }
}

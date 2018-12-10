package com.sss.bean;

/**
 * Created by ZhangJun on 2018/6/13.
 */
public class Link {
    private String key;
    private String value;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Link() {
    }

    public Link(String key, String value) {
        this.key = key;
        this.value = value;
    }
}

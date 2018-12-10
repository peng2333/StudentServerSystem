package com.sss.bean;

public class Number {
    private Float num;
    private Integer from;

    public Number() {
    }

    public Number(Float num, Integer from) {

        this.num = num;
        this.from = from;
    }

    public Float getNum() {

        return num;
    }

    public void setNum(Float num) {
        this.num = num;
    }

    public Integer getFrom() {
        return from;
    }

    public void setFrom(Integer from) {
        this.from = from;
    }
}

package com.sss.bean;

public class Exceptionans {
    private String answer;
    private Integer goods;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getGoods() {
        return goods;
    }

    public void setGoods(Integer goods) {
        this.goods = goods;
    }

    @Override
    public String toString() {
        return "Exceptionans{" +
                "answer='" + answer + '\'' +
                ", goods=" + goods +
                '}';
    }
}

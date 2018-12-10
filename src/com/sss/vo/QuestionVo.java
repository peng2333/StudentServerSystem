package com.sss.vo;

public class QuestionVo {
    private Integer qid;
    //问题内容
    private String qs;
    //问题属性
    private String qtype;
    //问题标题
    private String qbt;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getQs() {
        return qs;
    }

    public void setQs(String qs) {
        this.qs = qs;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public String getQbt() {
        return qbt;
    }

    public void setQbt(String qbt) {
        this.qbt = qbt;
    }
}

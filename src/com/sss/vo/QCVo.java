package com.sss.vo;

import com.sss.bean.Question;

/**
 * Created by ZhangPeng on 2018/6/11
 */
public class QCVo {
    private Question question;//问题对象
    private Integer count;//该问题的回答数

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}

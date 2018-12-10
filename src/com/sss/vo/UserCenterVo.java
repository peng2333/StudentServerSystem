package com.sss.vo;

import com.sss.bean.Question;

/**
 * @author WangShuang
 * @date 2018/6/8 21:05
 */

public class UserCenterVo {
    /**
    *@Author WangShuang
    *@Description 用户中心的————我发的贴
     * 帖子问题 的回答数
    */
    //帖子问题
    private Question question;
    //回答数
    private Integer answerNum;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Integer getAnswerNum() {
        return answerNum;
    }

    public void setAnswerNum(Integer answerNum) {
        this.answerNum = answerNum;
    }
}

package com.sss.vo;

import com.sss.bean.User;

import java.util.List;

/**
 * @author WangShuang
 * @date 2018/6/8 11:51
 */
public class UserVo {
    /**
    *@Author WangShuang
    *@Description user 分页后回答数最多得用户
     * *          answerNum user对应的回答数
    */

    private User user;

    private Integer answerNum;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getAnswerNum() {
        return answerNum;
    }

    public void setAnswerNum(Integer answerNum) {
        this.answerNum = answerNum;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "user=" + user +
                ", answerNum=" + answerNum +
                '}';
    }
}

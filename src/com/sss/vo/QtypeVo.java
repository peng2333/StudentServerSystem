package com.sss.vo;

import com.sss.bean.Question;
import com.sss.bean.User;

import java.util.List;

/**
 * Created by XiongTianCi on 2018/6/8
 *  用于接受ajax传输的数据
 * @author tianci
 */
public class QtypeVo {
    /**
    *@Author:XiongTianCi
    *@Description:查询置顶内容的分类详情
    */
    private String qtype;

    /**
    *@Author:XiongTianCi
    *@Description:查询 置顶对象 的结果
    */
    private List<Question> qList;

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public List<Question> getqList() {
        return qList;
    }

    public void setqList(List<Question> qList) {
        this.qList = qList;
    }

}

package com.sss.vo;

import com.sss.bean.Question;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by XiongTianCi on 2018/6/9
 *
 * @author tianci
 */
public class ASVo {
    /**
    *@Author:XiongTianCi
    *@Description:问题的分类qtype
    *@return:
    */
    private String qtype;

    /**
    *@Author:XiongTianCi
    *@Description:搜索框内容
    *@return:
    */
    private String searchName;

    private List<Question> qList = new ArrayList<Question>();

    public List<Question> getqList() {
        return qList;
    }

    public void setqList(List<Question> qList) {
        this.qList = qList;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }
}

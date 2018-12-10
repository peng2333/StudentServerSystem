package com.sss.vo;

/**
 * Created by XiongTianCi on 2018/6/11
 *用于 知识互助中心 的搜索时传输搜索框数据和qtype数据；同时封装搜索的结果
 * @author tianci
 */
public class SearchVo {
    // 分类qtype
    private String qtype;
    // 搜索框数据
    private String searchText;

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}

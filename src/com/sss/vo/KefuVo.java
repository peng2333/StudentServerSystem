package com.sss.vo;

/**
 * Created by ZhangPeng on 2018/7/3
 */
public class KefuVo {
    private String content;
    private String recent;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRecent() {
        return recent;
    }

    public void setRecent(String recent) {
        this.recent = recent;
    }

    @Override
    public String toString() {
        return "KefuVo{" +
                "content='" + content + '\'' +
                '}';
    }
}

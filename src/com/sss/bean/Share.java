package com.sss.bean;

import javax.persistence.Column;

/**
 * Created by ZhangJun on 2018/6/7.
 */
public class Share {
   private String name;
   @Column(name = "share_id")
   private int share_id;
   @Column(name="user_id")
   private int user_id;
   @Column(name="create_date")
   private String create_date;
   private int count;
   private int type;//-1私有 1公共
    private Downloads downloads;

    public Downloads getDownloads() {
        return downloads;
    }

    public void setDownloads(Downloads downloads) {
        this.downloads = downloads;
    }

    public Share() {
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getShare_id() {
        return share_id;
    }

    public void setShare_id(int share_id) {
        this.share_id = share_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Share(String name, int share_id, int user_id, String create_date, int count, int type) {
        this.name = name;
        this.share_id = share_id;
        this.user_id = user_id;
        this.create_date = create_date;
        this.count = count;
        this.type = type;
    }
}

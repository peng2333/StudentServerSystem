package com.sss.bean;

import javax.persistence.Id;

/**
 * Created by ZhangJun on 2018/6/13.
 */
public class ShareItem {
    @Id
    private int item_id;
    private int share_id;
    private String path;

    private Item item;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public ShareItem() {
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getShare_id() {
        return share_id;
    }

    public void setShare_id(int share_id) {
        this.share_id = share_id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public ShareItem(int item_id, int share_id, String path) {
        this.item_id = item_id;
        this.share_id = share_id;
        this.path = path;
    }

    @Override
    public String toString() {
        return "ShareItem{" +
                "item_id=" + item_id +
                ", share_id=" + share_id +
                ", path='" + path + '\'' +
                ", item=" + item +
                '}';
    }
}

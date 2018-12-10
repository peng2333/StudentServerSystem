package com.sss.bean;

import javax.persistence.Id;

public class FileDownloads {

    @Id
    private String path;
    private Integer count;

    public FileDownloads(String path, Integer count) {
        this.path = path;
        this.count = count;
    }

    public FileDownloads() {
        super();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

}

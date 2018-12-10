package com.sss.bean;

public class Downloads {

    private Integer did;        //下载id
    private Integer count;      //下载次数

    public Integer getDid() {
        return did;
    }

    public Downloads(Integer did, Integer count) {
        this.did = did;
        this.count = count;
    }

    public Downloads() {
        super();
    }

    public void setDid(Integer did) {

        this.did = did;
    }

    public Integer getCount() {
        return count;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}

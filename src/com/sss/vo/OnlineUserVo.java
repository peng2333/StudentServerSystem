package com.sss.vo;

/**
 * Created by ZhangPeng on 2018/6/19
 */
public class OnlineUserVo {
    private String username;
    private Integer id;
    private String avatar;
    private String sign;
    private Integer groupId;

    public OnlineUserVo() {
    }

    public OnlineUserVo(String username, Integer id, String avatar, String sign, Integer groupId) {
        this.username = username;
        this.id = id;
        this.avatar = avatar;
        this.sign = sign;
        this.groupId = groupId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    @Override
    public String toString() {
        return "OnlineUserVo{" +
                "username='" + username + '\'' +
                ", id=" + id +
                ", avatar='" + avatar + '\'' +
                ", sign='" + sign + '\'' +
                ", groupId=" + groupId +
                '}';
    }
}

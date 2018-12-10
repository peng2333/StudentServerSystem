package com.sss.bean;

import javax.persistence.Id;

/**
 * @author 魏彤羽
 */
public class Measurement {
    @Id
    private Integer id;
    private String typeone;
    private String content;
    private String answer;
    private String typetwo;
    private String level;
    private String passrate;
    private Long tnumber;
    private Long allnumber;
    private Integer uid;
    private User user;
    private String omgcool;

    public String getOmgcool() {
        return omgcool;
    }

    public void setOmgcool(String omgcool) {
        this.omgcool = omgcool;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getTnumber() {
        return tnumber;
    }

    public void setTnumber(Long tnumber) {
        this.tnumber = tnumber;
    }

    public Long getAllnumber() {
        return allnumber;
    }

    public void setAllnumber(Long allnumber) {
        this.allnumber = allnumber;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeone() {
        return typeone;
    }

    public void setTypeone(String typeone) {
        this.typeone = typeone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getTypetwo() {
        return typetwo;
    }

    public void setTypetwo(String typetwo) {
        this.typetwo = typetwo;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPassrate() {
        return passrate;
    }

    public void setPassrate(String passrate) {
        this.passrate = passrate;
    }
}

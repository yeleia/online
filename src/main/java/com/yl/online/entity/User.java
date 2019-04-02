package com.yl.online.entity;

public class User {
    private Integer id;

    private String username;

    private String usernumber;

    private String userpass;

    private String sex;

    private String campuse;

    private String profession;

    private Integer auth;

    public User(Integer id, String username, String usernumber, String userpass, String sex, String campuse, String profession, Integer auth) {
        this.id = id;
        this.username = username;
        this.usernumber = usernumber;
        this.userpass = userpass;
        this.sex = sex;
        this.campuse = campuse;
        this.profession = profession;
        this.auth = auth;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUsernumber() {
        return usernumber;
    }

    public void setUsernumber(String usernumber) {
        this.usernumber = usernumber == null ? null : usernumber.trim();
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass == null ? null : userpass.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getCampuse() {
        return campuse;
    }

    public void setCampuse(String campuse) {
        this.campuse = campuse == null ? null : campuse.trim();
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession == null ? null : profession.trim();
    }

    public Integer getAuth() {
        return auth;
    }

    public void setAuth(Integer auth) {
        this.auth = auth;
    }
}
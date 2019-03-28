package com.yl.online.entity;

public class User {
    private Integer userid;

    private String username;

    private String userpass;

    private Integer usersex;

    private Integer auth;

    public User(Integer userid, String username, String userpass, Integer usersex, Integer auth) {
        this.userid = userid;
        this.username = username;
        this.userpass = userpass;
        this.usersex = usersex;
        this.auth = auth;
    }

    public User() {
        super();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass == null ? null : userpass.trim();
    }

    public Integer getUsersex() {
        return usersex;
    }

    public void setUsersex(Integer usersex) {
        this.usersex = usersex;
    }

    public Integer getAuth() {
        return auth;
    }

    public void setAuth(Integer auth) {
        this.auth = auth;
    }
}
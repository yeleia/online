package com.yl.online.entity;

public class Group {
    private Integer groupid;

    private Integer userid;

    private Integer auth;

    public Group(Integer groupid, Integer userid, Integer auth) {
        this.groupid = groupid;
        this.userid = userid;
        this.auth = auth;
    }

    public Group() {
        super();
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getAuth() {
        return auth;
    }

    public void setAuth(Integer auth) {
        this.auth = auth;
    }
}
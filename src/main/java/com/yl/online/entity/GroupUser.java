package com.yl.online.entity;

public class GroupUser {
    private Integer id;

    private Integer groupid;

    private Integer userid;

    public GroupUser(Integer id, Integer groupid, Integer userid) {
        this.id = id;
        this.groupid = groupid;
        this.userid = userid;
    }

    public GroupUser() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
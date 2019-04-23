package com.yl.online.entity;

import java.util.Date;

public class Group {
    private Integer id;

    private Integer creator;

    private String groupname;

    private Date creattime;

    public Group(Integer id, Integer creator, String groupname, Date creattime) {
        this.id = id;
        this.creator = creator;
        this.groupname = groupname;
        this.creattime = creattime;
    }

    public Group() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }
}
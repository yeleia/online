package com.yl.online.entity;

public class Group {
    private Integer id;

    private String groupname;

    public Group(Integer id, String groupname) {
        this.id = id;
        this.groupname = groupname;
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

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }
}
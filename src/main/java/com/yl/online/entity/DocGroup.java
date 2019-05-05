package com.yl.online.entity;

public class DocGroup {
    private Integer id;

    private Integer docid;

    private Integer groupid;

    public DocGroup(Integer id, Integer docid, Integer groupid) {
        this.id = id;
        this.docid = docid;
        this.groupid = groupid;
    }

    public DocGroup() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDocid() {
        return docid;
    }

    public void setDocid(Integer docid) {
        this.docid = docid;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }
}
package com.yl.online.entity;

public class DocUser {
    private Integer id;

    private Integer docid;

    private Integer userid;

    public DocUser(Integer id, Integer docid, Integer userid) {
        this.id = id;
        this.docid = docid;
        this.userid = userid;
    }

    public DocUser() {
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

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}
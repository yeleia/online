package com.yl.online.entity;

public class GroupDoc {
    private Integer id;

    private Integer groupid;

    private Integer documentid;

    public GroupDoc(Integer id, Integer groupid, Integer documentid) {
        this.id = id;
        this.groupid = groupid;
        this.documentid = documentid;
    }

    public GroupDoc() {
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

    public Integer getDocumentid() {
        return documentid;
    }

    public void setDocumentid(Integer documentid) {
        this.documentid = documentid;
    }
}
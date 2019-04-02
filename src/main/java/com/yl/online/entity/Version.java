package com.yl.online.entity;

import java.util.Date;

public class Version {
    private Integer id;

    private Integer docid;

    private Date writedate;

    private String docname;

    private String content;

    public Version(Integer id, Integer docid, Date writedate, String docname, String content) {
        this.id = id;
        this.docid = docid;
        this.writedate = writedate;
        this.docname = docname;
        this.content = content;
    }

    public Version() {
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

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname == null ? null : docname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}
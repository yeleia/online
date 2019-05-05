package com.yl.online.entity;

import java.util.Date;

public class Doc {
    private Integer id;

    private String docname;

    private Date writedate;

    private Byte iswrite;

    private String pdfurl;

    private String content;

    public Doc(Integer id, String docname, Date writedate, Byte iswrite, String pdfurl, String content) {
        this.id = id;
        this.docname = docname;
        this.writedate = writedate;
        this.iswrite = iswrite;
        this.pdfurl = pdfurl;
        this.content = content;
    }

    public Doc() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname == null ? null : docname.trim();
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public Byte getIswrite() {
        return iswrite;
    }

    public void setIswrite(Byte iswrite) {
        this.iswrite = iswrite;
    }

    public String getPdfurl() {
        return pdfurl;
    }

    public void setPdfurl(String pdfurl) {
        this.pdfurl = pdfurl == null ? null : pdfurl.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}
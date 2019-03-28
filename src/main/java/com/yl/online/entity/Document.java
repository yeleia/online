package com.yl.online.entity;

public class Document {
    private Integer documentid;

    private Byte iswrite;

    private String title;

    private String pdfurl;

    private String imgurl;

    public Document(Integer documentid, Byte iswrite, String title, String pdfurl, String imgurl) {
        this.documentid = documentid;
        this.iswrite = iswrite;
        this.title = title;
        this.pdfurl = pdfurl;
        this.imgurl = imgurl;
    }

    public Document() {
        super();
    }

    public Integer getDocumentid() {
        return documentid;
    }

    public void setDocumentid(Integer documentid) {
        this.documentid = documentid;
    }

    public Byte getIswrite() {
        return iswrite;
    }

    public void setIswrite(Byte iswrite) {
        this.iswrite = iswrite;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getPdfurl() {
        return pdfurl;
    }

    public void setPdfurl(String pdfurl) {
        this.pdfurl = pdfurl == null ? null : pdfurl.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }
}
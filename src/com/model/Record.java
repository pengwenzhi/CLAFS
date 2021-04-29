package com.model;

public class Record {
    private int objectid;
    private String username;
    private String title;
    private String sort;
    private String photo;
    private String state;
    private String pubtime;
    private String applyname;
    private String applytel;
    private String applyaddress;

    public Record(int objectid, String username, String title, String sort, String photo, String state, String applyname, String applytel, String applyaddress) {
           this.objectid=objectid;
           this.username=username;
           this.title=title;
           this.sort=sort;
           this.photo=photo;
           this.state=state;
           this.applyname=applyname;
           this.applytel=applytel;
           this.applyaddress=applyaddress;
    }

    public Record() {

    }

    public int getObjectid() {
        return objectid;
    }

    public void setObjectid(int objectid) {
        this.objectid = objectid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime;
    }

    public String getApplyname() {
        return applyname;
    }

    public void setApplyname(String applyname) {
        this.applyname = applyname;
    }

    public String getApplytel() {
        return applytel;
    }

    public void setApplytel(String applytel) {
        this.applytel = applytel;
    }

    public String getApplyaddress() {
        return applyaddress;
    }

    public void setApplyaddress(String applyaddress) {
        this.applyaddress = applyaddress;
    }
}

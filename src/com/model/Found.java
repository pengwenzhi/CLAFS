package com.model;

public class Found {
    private int id;
    private String username;
    private String title;
    private String sort;
    private String pickday;
    private String pubtime;
    private String address;
    private String photo;
    private String detail;
    private String state;

    public Found(String username, String title, String sort, String pickday, String address, String photo, String detail) {
        this.username=username;
        this.title=title;
        this.sort=sort;
        this.pickday=pickday;
        this.address=address;
        this.photo=photo;
        this.detail=detail;
    }

    public Found() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPickday() {
        return pickday;
    }

    public void setPickday(String pickday) {
        this.pickday = pickday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
}

package com.model;

public class User {
    private String username;
    private String realname;
    private String password;
    private String gender;
    private String email;
    private String qq;
    private String tel;
    private String address;
    private String role;

    public User(String username, String realname, String password, String gender, String email, String qq, String tel, String address,String role) {
        this.username = username;
        this.realname = realname;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.qq = qq;
        this.tel = tel;
        this.address = address;
        this.role=role;
    }

    public User(String username, String password, String role) {
        this.username=username;
        this.password=password;
        this.role=role;
    }

    public User() {

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}

package com.bjwlxy.pojo;

public class User {
    private Long id;

    private String username;

    private String password;

    private String sex;

    private String email;

    private Integer userleave;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", userleave=" + userleave +
                '}';
    }

    public User() {
    }

    public User(Long id, String username, String password, String sex, String email, int i) {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getUserleave() {
        return userleave;
    }

    public void setUserleave(Integer userleave) {
        this.userleave = userleave;
    }
}
package com.bjwlxy.pojo;

import java.util.Date;

public class SongMenu {
    private Long id;

    private String menuname;

    private String description;

    private Long createrid;

    private Date createdate;

    private String cover;

    @Override
    public String toString() {
        return "SongMenu{" +
                "id=" + id +
                ", menuname='" + menuname + '\'' +
                ", description='" + description + '\'' +
                ", createrid=" + createrid +
                ", createdate=" + createdate +
                ", cover='" + cover + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getCreaterid() {
        return createrid;
    }

    public void setCreaterid(Long createrid) {
        this.createrid = createrid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }
}
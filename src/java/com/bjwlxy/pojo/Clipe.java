package com.bjwlxy.pojo;

import java.util.Date;

public class Clipe {
    private Long id;

    private String clipename;

    private String player;

    private Date pubyear;

    private String com;

    private String cover;

    private Double price;

    @Override
    public String toString() {
        return "Clipe{" +
                "id=" + id +
                ", clipename='" + clipename + '\'' +
                ", player='" + player + '\'' +
                ", pubyear=" + pubyear +
                ", com='" + com + '\'' +
                ", cover='" + cover + '\'' +
                ", price=" + price +
                '}';
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getClipename() {
        return clipename;
    }

    public void setClipename(String clipename) {
        this.clipename = clipename == null ? null : clipename.trim();
    }

    public String getPlayer() {
        return player;
    }

    public void setPlayer(String player) {
        this.player = player == null ? null : player.trim();
    }

    public Date getPubyear() {
        return pubyear;
    }

    public void setPubyear(Date pubyear) {
        this.pubyear = pubyear;
    }

    public String getCom() {
        return com;
    }

    public void setCom(String com) {
        this.com = com == null ? null : com.trim();
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }
}
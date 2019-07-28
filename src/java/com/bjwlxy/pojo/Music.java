package com.bjwlxy.pojo;

import java.util.Date;

public class Music {
    private Long id;

    private String musicname;

    private String musictype;

    private Date pubyear;

    private Integer playnum;

    private Long clipeid;

    private String musiclocale;

    private Date uploadtime;

    private String storeaddress;

    private String player;

    private Long diyclipeid;

    private Clipe clipe;

    private SongMenu songMenu;

    @Override
    public String toString() {
        return "Music{" +
                "id=" + id +
                ", musicname='" + musicname + '\'' +
                ", musictype='" + musictype + '\'' +
                ", pubyear=" + pubyear +
                ", playnum=" + playnum +
                ", clipeid=" + clipeid +
                ", musiclocale='" + musiclocale + '\'' +
                ", uploadtime=" + uploadtime +
                ", storeaddress='" + storeaddress + '\'' +
                ", player='" + player + '\'' +
                ", diyclipeid=" + diyclipeid +
                ", clipe=" + clipe +
                ", songMenu=" + songMenu +
                '}';
    }

    public SongMenu getSongMenu() {
        return songMenu;
    }

    public void setSongMenu(SongMenu songMenu) {
        this.songMenu = songMenu;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMusicname() {
        return musicname;
    }

    public void setMusicname(String musicname) {
        this.musicname = musicname;
    }

    public String getMusictype() {
        return musictype;
    }

    public void setMusictype(String musictype) {
        this.musictype = musictype;
    }

    public Date getPubyear() {
        return pubyear;
    }

    public void setPubyear(Date pubyear) {
        this.pubyear = pubyear;
    }

    public Integer getPlaynum() {
        return playnum;
    }

    public void setPlaynum(Integer playnum) {
        this.playnum = playnum;
    }

    public Long getClipeid() {
        return clipeid;
    }

    public void setClipeid(Long clipeid) {
        this.clipeid = clipeid;
    }

    public String getMusiclocale() {
        return musiclocale;
    }

    public void setMusiclocale(String musiclocale) {
        this.musiclocale = musiclocale;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getStoreaddress() {
        return storeaddress;
    }

    public void setStoreaddress(String storeaddress) {
        this.storeaddress = storeaddress;
    }

    public String getPlayer() {
        return player;
    }

    public void setPlayer(String player) {
        this.player = player;
    }

    public Long getDiyclipeid() {
        return diyclipeid;
    }

    public void setDiyclipeid(Long diyclipeid) {
        this.diyclipeid = diyclipeid;
    }

    public Clipe getClipe() {
        return clipe;
    }

    public void setClipe(Clipe clipe) {
        this.clipe = clipe;
    }
}
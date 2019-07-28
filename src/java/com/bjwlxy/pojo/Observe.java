package com.bjwlxy.pojo;

import java.util.Date;

public class Observe {
    private Long id;

    private Long musicid;

    private Long observerid;

    private String contents;

    private Date obtime;

    private Integer argue;

    private Integer against;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMusicid() {
        return musicid;
    }

    public void setMusicid(Long musicid) {
        this.musicid = musicid;
    }

    public Long getObserverid() {
        return observerid;
    }

    public void setObserverid(Long observerid) {
        this.observerid = observerid;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents == null ? null : contents.trim();
    }

    public Date getObtime() {
        return obtime;
    }

    public void setObtime(Date obtime) {
        this.obtime = obtime;
    }

    public Integer getArgue() {
        return argue;
    }

    public void setArgue(Integer argue) {
        this.argue = argue;
    }

    public Integer getAgainst() {
        return against;
    }

    public void setAgainst(Integer against) {
        this.against = against;
    }
}
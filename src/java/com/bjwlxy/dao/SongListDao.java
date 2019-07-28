package com.bjwlxy.dao;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.utils.PageBean;

import java.util.List;

public interface SongListDao {
    int seleSongList();

    List<Music> getProList(PageBean<Music> pageBean);

}

package com.bjwlxy.service;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;

import java.sql.SQLException;
import java.util.List;

public interface SongMenuService {
    SongMenu seleSongMenu(Long id) throws SQLException, ClassNotFoundException;


    List<Music> seleSong(Long id) throws SQLException, ClassNotFoundException;

    /**
     * 获取全部
     * @return
     */
    List<SongMenu> seLSong();

    /**
     * 歌曲添加歌单
     * @param musicid
     * @param seleVal
     * @return
     */
    int addSongMenu(Long musicid, int seleVal);
}

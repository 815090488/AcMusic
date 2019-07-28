package com.bjwlxy.dao;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;

import java.sql.SQLException;
import java.util.List;

public interface SongMenuDao {
    SongMenu seleSongMenu(Long id) throws SQLException, ClassNotFoundException;
    List<Music> seleSong(Long id) throws SQLException, ClassNotFoundException;

    List<SongMenu> selSong();

    int addSongMenu(Long musicid, int seleVal);
}

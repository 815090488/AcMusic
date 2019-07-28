package com.bjwlxy.service.impl;

import com.bjwlxy.dao.SongMenuDao;
import com.bjwlxy.dao.impl.SongMenuDaoImpl;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;
import com.bjwlxy.service.SongMenuService;

import java.sql.SQLException;
import java.util.List;

public class SongMenuServiceImpl implements SongMenuService {

    SongMenuDao songMenuDao = new SongMenuDaoImpl();
    @Override
    public SongMenu seleSongMenu(Long id) throws ClassNotFoundException, SQLException {
        return songMenuDao.seleSongMenu(id);
    }

    @Override
    public List<Music> seleSong(Long id) throws SQLException, ClassNotFoundException {
        return songMenuDao.seleSong(id);
    }

    @Override
    public List<SongMenu> seLSong() {
        return songMenuDao.selSong();
    }

    /**
     * 歌曲添加歌单
     * @param musicid
     * @param seleVal
     * @return
     */
    @Override
    public int addSongMenu(Long musicid, int seleVal) {
        return songMenuDao.addSongMenu(musicid,seleVal);
    }


}

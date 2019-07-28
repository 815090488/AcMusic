package com.bjwlxy.dao.impl;

import com.bjwlxy.dao.SongMenuDao;
import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;
import com.bjwlxy.pojo.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongMenuDaoImpl implements SongMenuDao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public SongMenu seleSongMenu(Long id) throws SQLException, ClassNotFoundException {
        SongMenu songMenu = null;
        String s = "select * from playlist  where id=?";
        Driver(s);
        ps.setLong(1, id);
        rs = ps.executeQuery();
        while (rs.next()) {
            songMenu = new SongMenu();
            setSongMenu(songMenu);
        }
        close();
        return songMenu;
    }

    @Override
    public List<Music> seleSong(Long id) throws SQLException, ClassNotFoundException {
        List<Music> musicList = null;
        String s = "select * from playlist LEFT JOIN music on playlist.id=music.diyclipeId  where playlist.id=?";
        Driver(s);
        ps.setLong(1, id);
        rs = ps.executeQuery();
        musicList = new ArrayList<>();
        while (rs.next()) {
            Music music = new Music();
            SetMusi(music);
            SongMenu songMenu = new SongMenu();
            setSongMenu(songMenu);
            musicList.add(music);
        }
        close();
        return musicList;
    }

    @Override
    public List<SongMenu> selSong() {
        List<SongMenu> songMenu = null;
        try {

            String s = "select * from playlist";
            Driver(s);
            // 执行sql
            rs = ps.executeQuery();
            songMenu = new ArrayList<SongMenu>();
            // 遍历结果
            while (rs.next()) {
                SongMenu songMenu1 = new SongMenu();
                setSongMenu(songMenu1);
                songMenu.add(songMenu1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close();
        }
        // 返回结果
        return songMenu;
    }

    /**
     * 添加歌单
     * @param musicid
     * @param seleVal
     * @return
     */
    @Override
    public int addSongMenu(Long musicid, int seleVal) {
        int index = -1;
        try {
            String sql = "UPDATE music SET diyclipeId=? where id=?";
            Driver(sql);
            // 给占位符
            ps.setLong(1, seleVal);
            ps.setLong(2, musicid);
            // 执行sql
            index = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close();
        }
        // 返回结果
        return index;
    }


    private void SetMusi(Music music) throws SQLException {
        music.setId(rs.getLong("id"));
        music.setMusicname(rs.getString("musicName"));
        music.setMusiclocale(rs.getString("musicLocale"));
        music.setStoreaddress(rs.getString("storeAddress"));
        music.setPlayer(rs.getString("player"));
        music.setClipeid(rs.getLong("clipeid"));
    }

    private void setSongMenu(SongMenu songMenu) throws SQLException {
        songMenu.setMenuname(rs.getString("menuName"));
        songMenu.setId(rs.getLong("id"));
        songMenu.setCreatedate(rs.getDate("createDate"));
        songMenu.setCreaterid(rs.getLong("createrId"));
        songMenu.setDescription(rs.getString("description"));
        songMenu.setCover(rs.getString("cover"));
    }

    //连接数据库
    private void Driver(String s) throws ClassNotFoundException, SQLException {
        // 加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        // 获得连接
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/music", "root", "zgwbgh959");
        // 创建sql命令对象
        ps = conn.prepareStatement(s);
    }

    //关闭资源
    private void close() {
        try {
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (ps != null)
                ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

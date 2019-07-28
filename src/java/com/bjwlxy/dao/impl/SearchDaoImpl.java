package com.bjwlxy.dao.impl;

import com.bjwlxy.dao.SearchDao;
import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchDaoImpl implements SearchDao {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    @Override
    public List<Music> seleSong(String search) {
        List<Music> lu = null;
        try {
            String s = "select * from music LEFT JOIN clipe on music.clipeId=clipe.id  WHERE storeAddress LIKE "+"'%"+search+"%'";
            Driver(s);
            rs = ps.executeQuery();
            lu = new ArrayList<Music>();
            // 遍历结果
            while (rs.next()) {
                Clipe clipe = new Clipe();
                Music music = new Music();
                SetMusi(music);
                clipe.setClipename(rs.getString("clipename"));
                music.setClipe(clipe);
                lu.add(music);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close();
        }
        // 返回结果
        return lu;
    }


    private void SetMusi(Music music) throws SQLException {
        music.setId(rs.getLong("id"));
        music.setMusicname(rs.getString("musicName"));
        music.setMusiclocale(rs.getString("musicLocale"));
        music.setStoreaddress(rs.getString("storeAddress"));
        music.setPlayer(rs.getString("player"));
        music.setClipeid(rs.getLong("clipeid"));
        music.setPlaynum(rs.getInt("playNum"));
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

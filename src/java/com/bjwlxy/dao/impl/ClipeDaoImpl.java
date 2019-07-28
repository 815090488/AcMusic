package com.bjwlxy.dao.impl;

import com.bjwlxy.dao.ClipeDao;
import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClipeDaoImpl implements ClipeDao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public List<Music> seleClipeList(Long clip) throws SQLException, ClassNotFoundException {
        List<Music> musicList = null;
        String s = "select * from music LEFT JOIN clipe on clipe.id=music.clipeId  where clipe.id=?";
        Driver(s);
        ps.setLong(1,clip);
        rs = ps.executeQuery();
        musicList = new ArrayList<>();
        while (rs.next()){
            Clipe clipe = new Clipe();
            Music music = new Music();
            clipe.setClipename(rs.getString("clipeName"));
            clipe.setPlayer(rs.getString("player"));
            clipe.setPubyear(rs.getDate("pubYear"));
            clipe.setCom(rs.getString("com"));
            clipe.setCover(rs.getString("cover"));
            music.setId(rs.getLong("id"));
            music.setMusicname(rs.getString("musicName"));
            music.setMusiclocale(rs.getString("musicLocale"));
            music.setStoreaddress(rs.getString("storeAddress"));
            music.setPlayer(rs.getString("player"));
            music.setClipe(clipe);
            musicList.add(music);
        }
        close();
        return musicList;
    }

    @Override
    public Clipe seleClipe(long clip) throws SQLException, ClassNotFoundException {
        Clipe clipe = null;
        String s = "select * from clipe  where clipe.id=?";
        Driver(s);
        ps.setLong(1,clip);
        rs = ps.executeQuery();
        while (rs.next()){
            clipe = new Clipe();
            clipe.setClipename(rs.getString("clipeName"));
            clipe.setPlayer(rs.getString("player"));
            clipe.setPubyear(rs.getDate("pubYear"));
            clipe.setCom(rs.getString("com"));
            clipe.setCover(rs.getString("cover"));
            clipe.setPrice(rs.getDouble("price"));
        }
        close();
        return clipe;
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

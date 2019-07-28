package com.bjwlxy.dao.impl;

import com.bjwlxy.dao.CountDao;
import com.bjwlxy.pojo.Music;

import java.sql.*;

public class CountDaoImpl implements CountDao {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;


    @Override
    public int UpdPlyNum(Long id, int playNum) {
        int index = -1;
        try {
            String sql = "UPDATE music SET playNum=? where id=?";
            Driver(sql);
            // 给占位符
            ps.setInt(1, playNum);
            ps.setLong(2, id);
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

    @Override
    public int selePlyNum(Long id) {
        int index = 0;
        try {

            String s = "select playNum from music where id=?";
            Driver(s);
            ps.setLong(1,id);

            rs = ps.executeQuery();
            rs.next();
            index = rs.getInt("playnum");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        // 返回结果
        return index;
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

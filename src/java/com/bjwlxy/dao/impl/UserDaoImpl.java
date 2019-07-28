package com.bjwlxy.dao.impl;

import com.bjwlxy.dao.UserDao;
import com.bjwlxy.pojo.User;

import java.sql.*;

public class UserDaoImpl implements UserDao {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    /**
     * 用户登录
     *
     * @param username
     * @param password
     * @return
     */
    @Override
    public User Userlogin(String username, String password) {

        User u = null;
        try {

            String s = "select * from user where username=? and password=?";
            Driver(s);
            // 给占位符
            ps.setString(1, username);
            ps.setString(2, password);
            // 执行sql
            rs = ps.executeQuery();
            // 遍历结果
            while (rs.next()) {
                u = new User();
                u.setId(rs.getLong("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setSex(rs.getString("sex"));
                u.setEmail(rs.getString("email"));
                u.setUserleave(rs.getInt("userLeave"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close();
        }
        // 返回结果
        return u;
    }

    /**
     * 注册
     * @param i
     * @param username
     * @param password
     * @param sex
     * @param email
     * @param i1
     * @return
     */
    @Override
    public int userRegDao(int i, String username, String password, String sex, String email, int i1) {
        int index = -1;
        try {
            String sql = "insert into user values(default,?,?,?,?,default)";
            Driver(sql);
            // 给占位符
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, sex);
            ps.setString(4, email);
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

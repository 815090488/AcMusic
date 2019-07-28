package com.bjwlxy.dao;

import com.bjwlxy.pojo.User;

import java.sql.SQLException;

public interface UserDao {
     User Userlogin(String username, String password) throws ClassNotFoundException, SQLException;


    int userRegDao(int i, String username, String password, String sex, String email, int i1);
}

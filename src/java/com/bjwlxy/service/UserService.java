package com.bjwlxy.service;

import com.bjwlxy.pojo.User;

import java.sql.SQLException;

public interface UserService {
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    User UserLogin(String username, String password) throws ClassNotFoundException, SQLException;


    int UserRegister(int i, String username, String password, String sex, String email, int i1);
}

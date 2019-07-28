package com.bjwlxy.service.impl;

import com.bjwlxy.dao.UserDao;
import com.bjwlxy.dao.impl.UserDaoImpl;
import com.bjwlxy.pojo.User;
import com.bjwlxy.service.UserService;

import java.sql.SQLException;

public class UserServiceImpl implements UserService {
    UserDao ud = new UserDaoImpl();

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    @Override
    public User UserLogin(String username, String password) throws ClassNotFoundException, SQLException {
        User u= ud.Userlogin(username,password);
        return u;
    }

    @Override
    public int UserRegister(int i, String username, String password, String sex, String email, int i1) {
        return ud.userRegDao(i,username,password,sex,email,i1);
    }


}

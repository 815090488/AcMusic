package com.bjwlxy.service.impl;

import com.bjwlxy.dao.ClipeDao;
import com.bjwlxy.dao.impl.ClipeDaoImpl;
import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.ClipeService;

import java.sql.SQLException;
import java.util.List;

public class ClipeServiceImpl implements ClipeService  {
    ClipeDao clipeDao = new ClipeDaoImpl();
    @Override
    public List<Music> seleClipeList(Long clip) throws SQLException, ClassNotFoundException {
        List<Music> clipeList = clipeDao.seleClipeList(clip);
        return clipeList;
    }

    @Override
    public Clipe seleClipe(long clip) throws SQLException, ClassNotFoundException {
        return clipeDao.seleClipe(clip);
    }
}

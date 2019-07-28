package com.bjwlxy.dao;

import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;

import java.sql.SQLException;
import java.util.List;

public interface ClipeDao {
    List<Music> seleClipeList(Long clip) throws SQLException, ClassNotFoundException;

    Clipe seleClipe(long clip) throws SQLException, ClassNotFoundException;
}

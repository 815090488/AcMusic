package com.bjwlxy.dao;

import com.bjwlxy.pojo.Music;

import java.util.List;

public interface SearchDao {
    List<Music> seleSong(String search);
}

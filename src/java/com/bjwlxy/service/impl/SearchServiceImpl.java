package com.bjwlxy.service.impl;

import com.bjwlxy.dao.SearchDao;
import com.bjwlxy.dao.impl.SearchDaoImpl;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.SearchService;

import java.util.List;

public class SearchServiceImpl implements SearchService {
    SearchDao searchDao = new SearchDaoImpl();
    @Override
    public List<Music> seleSong(String search) {
        return searchDao.seleSong(search);
    }
}

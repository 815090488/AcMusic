package com.bjwlxy.service.impl;

import com.bjwlxy.dao.CountDao;
import com.bjwlxy.dao.impl.CountDaoImpl;
import com.bjwlxy.service.CountService;

public class CountServiceImpl implements CountService {

    CountDao countDao = new CountDaoImpl();

    @Override
    public int selePlyNum(Long id) {
        return countDao.selePlyNum(id);
    }

    @Override
    public int UpdPlyNum(Long id, int plyNum) {
        return countDao.UpdPlyNum(id,plyNum);
    }
}

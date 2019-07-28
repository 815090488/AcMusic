package com.bjwlxy.dao;

public interface CountDao {
    int UpdPlyNum(Long id, int playNum);

    int selePlyNum(Long id);
}

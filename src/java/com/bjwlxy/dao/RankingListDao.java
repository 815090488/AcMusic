package com.bjwlxy.dao;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.utils.PageBean;

import java.util.List;

public interface RankingListDao  {

    List<Music> getProList(PageBean<Music> pagebean);

    int seleSongList();
}

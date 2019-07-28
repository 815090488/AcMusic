package com.bjwlxy.service.impl;


import com.bjwlxy.dao.SongListDao;
import com.bjwlxy.dao.impl.SongListDaoImpl;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.SongListService;
import com.bjwlxy.utils.PageBean;

import java.util.List;

public class SongListServiceImpl implements SongListService {

    SongListDao songListDao = new SongListDaoImpl();

    @Override
    public PageBean<Music> getPageBean(int pageNumber, int pageSize) {

        //组装pageBean
        PageBean<Music> pagebean = new PageBean<>(pageNumber, pageSize);


        //查询当前页所有显示的数据
        List<Music> list = songListDao.getProList(pagebean);
        //查询总条数
        int musicList = songListDao.seleSongList();
        //把数据放入到pageBean中
        pagebean.setDatalist(list);
        pagebean.setTotalSize(musicList);
        pagebean.setTotalCount(pagebean.getTotalCount());
        return pagebean;
    }

}

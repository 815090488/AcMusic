package com.bjwlxy.service;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.utils.PageBean;

import java.util.List;


public interface SongListService {

    PageBean<Music> getPageBean(int pageNumber, int pageSize);

}

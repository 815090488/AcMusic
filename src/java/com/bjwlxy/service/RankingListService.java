package com.bjwlxy.service;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.utils.PageBean;

import java.util.List;

public interface RankingListService {

    PageBean<Music> getPageBean(int pageNumber, int pageSize);
}

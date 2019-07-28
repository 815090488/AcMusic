package com.bjwlxy.service;

import com.bjwlxy.pojo.Music;

import java.util.List;

public interface SearchService {
    List<Music> seleSong(String search);
}

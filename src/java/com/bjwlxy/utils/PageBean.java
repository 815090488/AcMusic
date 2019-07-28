package com.bjwlxy.utils;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
    private List<T> datalist = new ArrayList<>();
    private int pageSize;//每页显示几条数据
    private int pageNumber;//当前页从前台传递过来
    private int totalCount;//（int）Math.ceil(totalSize*1.0/pageSize)
    private int totalSize;//总条数


    public PageBean() {
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "datalist=" + datalist +
                ", pageSize=" + pageSize +
                ", pageNumber=" + pageNumber +
                ", totalCount=" + totalCount +
                ", totalSize=" + totalSize +
                '}';
    }

    public List<T> getDatalist() {
        return datalist;
    }

    public void setDatalist(List<T> datalist) {
        this.datalist = datalist;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalCount() {
        return (int)Math.ceil(totalSize*1.0/pageSize);
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    //开始索引index的方法
    public int getIndex(){
        return (pageNumber-1)*pageSize;
    }
    //index必须有值
    public PageBean(int pageNumber, int pageSize) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
    }
}

package com.training.common.utils;

import com.github.pagehelper.Page;
import com.training.model.PageInfo;
import com.training.model.Source;
import org.springframework.stereotype.Component;

import java.util.List;
/*
* 分页工具类
*/
@Component
public class SpratePage<T> {
    public PageInfo<T> sparate(Integer currentPage, Integer pageSize, List<T> list){
        PageInfo<T> pageInfo = new PageInfo<>(list.size(), currentPage, pageSize, 5);
        if(currentPage==pageInfo.getTotalPage())
            pageInfo.setList(list.subList((currentPage-1)*pageSize, list.size()));
        else
            pageInfo.setList(list.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize));
        return pageInfo;
    }
}

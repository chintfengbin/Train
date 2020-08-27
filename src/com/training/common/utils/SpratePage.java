package com.training.common.utils;

import com.training.model.PageInfo;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/*
 * 分页工具类
 */
@Component
public class SpratePage<T> {
    public PageInfo<T> sparate(Integer currentPage, Integer pageSize, List<T> list){
        PageInfo<T> pageInfo = new PageInfo<>(list.size(), currentPage, pageSize, 5);
        if (list.size()!=0 &&(list.size()>(pageSize+1)))
        {
            if(currentPage==pageInfo.getTotalPage())
                pageInfo.setList(list.subList((currentPage-1)*pageSize, list.size()));
            else
                pageInfo.setList(list.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize));
            return pageInfo;
        }
        else {
            PageInfo<T> pageInfo1= new PageInfo<T>(0,1,pageSize,5);
            pageInfo1.setList(list);
            return pageInfo1;
        }
//        if(currentPage==pageInfo.getTotalPage())
//            pageInfo.setList(list.subList((currentPage-1)*pageSize, list.size()));
//        else
//            pageInfo.setList(list.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize));
//        return pageInfo;
    }
}
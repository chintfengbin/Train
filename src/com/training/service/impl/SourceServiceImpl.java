package com.training.service.impl;

import com.github.pagehelper.Page;
import com.training.mapper.SourceMapper;
import com.training.model.PageInfo;
import com.training.model.Source;
import com.training.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourceServiceImpl implements SourceService {

    @Autowired
    SourceMapper sourceMapper;
    @Override
    public void add(Source source) {
        sourceMapper.add(source);
    }

    @Override
    public List<Source> listSourceByDept(String deptname) {
        return sourceMapper.listSourceByDept(deptname);
    }

    @Override
    public List<Source> list() {
        return sourceMapper.list();
    }

    @Override
    public PageInfo<Source> listSourceByPage(Integer currentPage,Integer pageSize){
        List<Source> sources = sourceMapper.list();

        PageInfo<Source> pageInfo = new PageInfo<>(sources.size(), currentPage, pageSize, 5);

        //判断是否是最后一页,如果最后一页就显示最后一页的几条，不是最后一页就显示pageSize条
        if(currentPage==pageInfo.getTotalPage())
            pageInfo.setList(sources.subList((currentPage-1)*pageSize, sources.size()));
        else
            pageInfo.setList(sources.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize));
        return pageInfo;
    }
}

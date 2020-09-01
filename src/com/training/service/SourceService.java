package com.training.service;

import com.training.model.PageInfo;
import com.training.model.Source;

import java.util.List;

public interface SourceService {
     List<Source> list();

     PageInfo<Source> listSourceByPage(Integer currentPage,Integer pageSize);

     void add(Source source);

    PageInfo<Source> listSourceByDept(Integer currentPage,Integer pageSize,String deptname);

}

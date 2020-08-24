package com.training.service;

import com.training.model.PageInfo;
import com.training.model.Source;

import java.util.List;

public interface SourceService {
     List<Source> list();

     List<Source> listSourceByPage(Integer currentPage,Integer pageSize);

     void add(Source source);

    List<Source> listSourceByDept(String deptname);
}

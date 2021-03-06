package com.training.mapper;

import com.training.model.Source;

import java.util.List;

public interface SourceMapper {



    int insert(Source record);



    void add(Source source);

     List<Source> list();

    List<Source> listSourceByDept(String deptname);

    void delete(long id);

    Source getSourceById(long id);

    void update(Source source);
}
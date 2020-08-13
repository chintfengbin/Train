package com.training.mapper;

import com.training.model.Source;

import java.util.List;

public interface SourceMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Source record);

    int insertSelective(Source record);



    Source selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(Source record);

    int updateByPrimaryKey(Source record);

    void add(Source source);

    List<Source> list();
}
package com.training.mapper;

import com.training.model.Login;

public interface LoginMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Login record);

    int insertSelective(Login record);



    Login selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(Login record);

    int updateByPrimaryKeyWithBLOBs(Login record);

    int updateByPrimaryKey(Login record);

    void add(Login login);
}
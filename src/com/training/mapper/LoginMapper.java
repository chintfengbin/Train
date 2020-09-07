package com.training.mapper;

import com.training.model.Login;

public interface LoginMapper {


    int insert(Login record);

    void add(Login login);

    Login selectByName(String username);
}
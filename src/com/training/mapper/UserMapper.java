package com.training.mapper;

import com.training.model.User;

import java.util.List;

public interface UserMapper {


     List<User> list(String condition);


    int insert(User record);



    User selectByName(String name);

    void add(User user);

    void deleteById(long id);

    void update(User user);

    User userInf(long id);
}
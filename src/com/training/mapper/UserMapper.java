package com.training.mapper;

import com.training.model.User;

import java.util.List;

public interface UserMapper {


     List<User> list();

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);


    User selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);

    User selectByName(String name);

    void add(User user);

    void deleteById(long id);

    void update(User user);
}
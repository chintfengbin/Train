package com.training.service.impl;

import com.training.mapper.UserMapper;
import com.training.model.User;
import com.training.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public User selectByName(String name) {
        return userMapper.selectByName(name);
    }

    @Override
    public void deleteById(long id) {
        userMapper.deleteById(id);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public User userinf(long id) {
        return userMapper.userInf(id);
    }

    @Override
    public List<User> list() {
        return userMapper.list();
    }
}

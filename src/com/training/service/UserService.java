package com.training.service;

import com.training.model.User;

import java.util.List;

public interface UserService {
     List<User> list() ;

    void add(User user);

    User selectByName(String name);

    void deleteById(long id);

    void update(User user);

    User userinf(long id);
}

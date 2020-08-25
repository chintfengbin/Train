package com.training.service;

import com.training.model.UserRole;

import java.util.List;

public interface UserRoleService {

    void add(UserRole userRole);
    List<UserRole> listUserRoleByPage(Integer currentPage,Integer pageSize);
    void update(UserRole userRole);
    void delete(long id);
}

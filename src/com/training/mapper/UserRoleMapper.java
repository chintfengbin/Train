package com.training.mapper;

import com.training.model.UserRole;

import java.util.List;

public interface UserRoleMapper {
    void add(UserRole userRole);
    List<UserRole> list();
    void update(UserRole userRole);
    void delete(long id);
}

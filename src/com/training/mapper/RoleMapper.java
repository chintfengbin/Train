package com.training.mapper;

import com.training.model.Role;

import java.util.List;

public interface RoleMapper {
    void add(Role role);

    Role select(Role role);

    void delete(int id);
    void update(Role role);

    List<Role> list();
}

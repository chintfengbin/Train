package com.training.service;

import com.training.model.Role;

import java.util.List;

public interface RoleService {
    void add(Role role);

    Role select(Role role);

    void deletebyId(int id);
    void update(Role role);
    List<Role> list();
}

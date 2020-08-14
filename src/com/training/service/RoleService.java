package com.training.service;

import com.training.model.Role;

public interface RoleService {
    void add(Role role);

    Role select(Role role);

    void deletebyId(int id);
    void update(Role role);
}

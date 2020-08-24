package com.training.service.impl;

import com.training.mapper.RoleMapper;
import com.training.model.Role;
import com.training.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {


    @Autowired
    RoleMapper roleMapper;

    @Override
    public void add(Role role) {
        roleMapper.add(role);
    }

    @Override
    public Role select(Role role) {
        return roleMapper.select(role);
    }

    @Override
    public void deletebyId(int id) {
        roleMapper.delete(id);
    }

    @Override
    public void update(Role role) {
        roleMapper.update(role);
    }

    @Override
    public List<Role> list(){
        return roleMapper.list();
    }
}

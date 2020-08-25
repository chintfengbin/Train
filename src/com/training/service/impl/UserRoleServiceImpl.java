package com.training.service.impl;

import com.training.mapper.UserRoleMapper;
import com.training.model.UserRole;
import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    UserRoleMapper userRoleMapper;
    @Override
    public void add(UserRole userRole) {
        userRoleMapper.add(userRole);
    }
}

package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.UserRoleMapper;
import com.training.model.PageInfo;
import com.training.model.UserRole;
import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    UserRoleMapper userRoleMapper;
    @Autowired
    SpratePage<UserRole> spratePage;

    @Override
    public void add(UserRole userRole) {
        userRoleMapper.add(userRole);
    }

    @Override
    public PageInfo<UserRole> listUserRoleByPage(Integer currentPage, Integer pageSize) {
        List<UserRole> userRoles =userRoleMapper.list();
        return spratePage.sparate(currentPage,pageSize,userRoles);
    }

    @Override
    public void update(UserRole userRole) {
        userRoleMapper.update(userRole);
    }

    @Override
    public void delete(long id) {
        userRoleMapper.delete(id);
    }
}

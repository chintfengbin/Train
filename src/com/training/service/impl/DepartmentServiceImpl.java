package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.DepartmentMapper;
import com.training.model.Department;
import com.training.model.PageInfo;
import com.training.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {


    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    SpratePage<Department> spratePage;

    @Override
    public Department select(Department department) {
        return departmentMapper.select(department);
    }

    @Override
    public void deletebyId(long id) {
        departmentMapper.deleteById(id);
    }

    @Override
    public void add(Department department) {
        departmentMapper.add(department);
    }

    @Override
    public void update(Department department) {
        departmentMapper.update(department);
    }

    @Override
    public List<Department> list(String condition) {
        return departmentMapper.list(condition);
    }

    @Override
    public PageInfo<Department> listDeptByPage(Integer currentPage, Integer pageSize,String condition) {
        List<Department> departments=departmentMapper.list(condition);
        return spratePage.sparate(currentPage,pageSize,departments);
    }
}

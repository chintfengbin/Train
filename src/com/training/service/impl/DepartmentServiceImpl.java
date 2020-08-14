package com.training.service.impl;

import com.training.mapper.DepartmentMapper;
import com.training.model.Department;
import com.training.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements DepartmentService {


    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public Department select(Department department) {
        return departmentMapper.select(department);
    }

    @Override
    public void deletebyId(int deptid) {
        departmentMapper.deleteById(deptid);
    }

    @Override
    public void add(Department department) {
        departmentMapper.add(department);
    }

    @Override
    public void update(Department department) {
        departmentMapper.update(department);
    }
}

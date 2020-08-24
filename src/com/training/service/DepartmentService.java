package com.training.service;

import com.training.model.Department;

import java.util.List;

public interface DepartmentService {
    Department select(Department department);

    void deletebyId(int deptid);

    void add(Department department);
    void update(Department department);

    List<Department> list();
    List<Department> listDeptByPage(Integer currentPage,Integer pageSize);
}

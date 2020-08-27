package com.training.service;

import com.training.model.Department;
import com.training.model.PageInfo;

import java.util.List;

public interface DepartmentService {
    Department select(Department department);

    void deletebyId(int deptid);

    void add(Department department);
    void update(Department department);

    List<Department> list();
    PageInfo<Department> listDeptByPage(Integer currentPage, Integer pageSize);
}

package com.training.service;

import com.training.model.Department;
import com.training.model.PageInfo;

import java.util.List;

public interface DepartmentService {
    Department select(Department department);

    void deletebyId(long id);

    void add(Department department);
    void update(Department department);

    List<Department> list(String condition);
    PageInfo<Department> listDeptByPage(Integer currentPage, Integer pageSize,String condition);
}

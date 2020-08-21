package com.training.mapper;

import com.training.model.Department;

import java.util.List;

public interface DepartmentMapper {
    void add(Department department);

    void deleteById(int deptid);

    Department select(Department department);
    void update(Department department);

    List<Department> list();
}

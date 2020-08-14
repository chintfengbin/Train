package com.training.mapper;

import com.training.model.Department;

public interface DepartmentMapper {
    void add(Department department);

    void deleteById(int deptid);

    Department select(Department department);
    void update(Department department);
}

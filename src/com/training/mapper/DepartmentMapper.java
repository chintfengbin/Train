package com.training.mapper;

import com.training.model.Department;

import java.util.List;

public interface DepartmentMapper {
    void add(Department department);

    void deleteById(long id);

    Department select(Department department);
    void update(Department department);

    List<Department> list(String condition);
}

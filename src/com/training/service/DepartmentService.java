package com.training.service;

import com.training.model.Department;

public interface DepartmentService {
    Department select(Department department);

    void deletebyId(int deptid);

    void add(Department department);
    void update(Department department);
}

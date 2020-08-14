package com.training.action;

import com.training.model.Department;
import com.training.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/add")
    public String add(Department department){
        departmentService.add(department);
        return "success!";
    }

    @RequestMapping("/delete")
    public String delete(int deptid){
        departmentService.deletebyId(deptid);
        return "success!";
    }

    @RequestMapping("/select")
    public Department select(Department department){
        Department department1;
        department1=departmentService.select(department);
        return department1;
    }

    @RequestMapping("/update")
    public String update(Department department){
        departmentService.update(department);
        return "success!";
    }
}

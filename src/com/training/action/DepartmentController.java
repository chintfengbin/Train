package com.training.action;

import com.training.model.Department;
import com.training.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Department department){
        departmentService.add(department);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int deptid){
        departmentService.deletebyId(deptid);
        return "success!";
    }

    @RequestMapping("/select")
    @ResponseBody
    public Department select(Department department){
        Department department1;
        department1=departmentService.select(department);
        return department1;
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Department department){
        departmentService.update(department);
        return "success!";
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<Department> list1(){
        return departmentService.list();
    }

    /*
    * 查询部门列表
    * */
    @RequestMapping("/listDeptByPage")
    @ResponseBody
    public List<Department> list(Integer currentPage, Integer pageSize){
        return departmentService.listDeptByPage(currentPage,pageSize);
    }

}

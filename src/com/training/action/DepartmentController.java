package com.training.action;

import com.training.model.Department;
import com.training.model.PageInfo;
import com.training.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Department department,HttpServletResponse response){
        cross(response);
        departmentService.add(department);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int deptid,HttpServletResponse response){
        cross(response);
        departmentService.deletebyId(deptid);
        return "success!";
    }

    @RequestMapping("/select")
    @ResponseBody
    public Department select(Department department,HttpServletResponse response){
        cross(response);
        Department department1;
        department1=departmentService.select(department);
        return department1;
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Department department,HttpServletResponse response){
        cross(response);
        departmentService.update(department);
        return "success!";
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<Department> list1(HttpServletResponse response){
        cross(response);
        return departmentService.list();
    }

    /*
    * 查询部门列表
    * */
    @RequestMapping("/listDeptByPage")
    @ResponseBody
    public PageInfo<Department> list(Integer currentPage, Integer pageSize, HttpServletResponse response){
        cross(response);
        return departmentService.listDeptByPage(currentPage,pageSize);
    }


    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}

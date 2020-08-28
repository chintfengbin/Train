package com.training.action;


import com.training.model.Department;
import com.training.model.Role;
import com.training.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleService roleService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Role role,HttpServletResponse response){
        cross(response);
        roleService.add(role);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int id,HttpServletResponse response){
        cross(response);
        roleService.deletebyId(id);
        return "success!";
    }

    @RequestMapping("/select")
    @ResponseBody
    public Role select(Role role,HttpServletResponse response){
        cross(response);
        Role role1;
        role1=roleService.select(role);
        return role1;
    }


    @RequestMapping("/update")
    @ResponseBody
    public String update(Role role,HttpServletResponse response){
        cross(response);
        roleService.update(role);
        return "success!";
    }
    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}

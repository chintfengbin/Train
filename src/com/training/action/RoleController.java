package com.training.action;


import com.training.model.Department;
import com.training.model.Role;
import com.training.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleService roleService;

    @RequestMapping("/add")
    public String add(Role role){
        roleService.add(role);
        return "success!";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        roleService.deletebyId(id);
        return "success!";
    }

    @RequestMapping("/select")
    public Role select(Role role){
        Role role1;
        role1=roleService.select(role);
        return role1;
    }


    @RequestMapping("/update")
    public String update(Role role){
        roleService.update(role);
        return "success!";
    }
}

package com.training.action;


import com.training.model.UserRole;
import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/userrole")
public class UserRoleController {


    @Autowired
    UserRoleService userRoleService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(UserRole userRole){
        userRoleService.add(userRole);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(UserRole userRole){
        userRoleService.update(userRole);
        return "success!";
    }

    @RequestMapping("/listUserRoleByPage")
    @ResponseBody
    public List<UserRole> list(Integer currentPage,Integer pageSize){
        return userRoleService.listUserRoleByPage(currentPage,pageSize);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id){
        userRoleService.delete(id);
        return "success!";
    }
}

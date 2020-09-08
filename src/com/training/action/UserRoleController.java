package com.training.action;


import com.training.model.PageInfo;
import com.training.model.UserRole;
import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/userrole")
public class UserRoleController {


    @Autowired
    UserRoleService userRoleService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(UserRole userRole,HttpServletResponse response){
        cross(response);
        userRoleService.add(userRole);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(UserRole userRole,HttpServletResponse response){
        cross(response);
        userRoleService.update(userRole);
        return "success!";
    }

    @RequestMapping("/listUserRoleByPage")
    @ResponseBody
    public PageInfo<UserRole> list(Integer currentPage, Integer pageSize, HttpServletResponse response){
        cross(response);
        return userRoleService.listUserRoleByPage(currentPage,pageSize);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id,HttpServletResponse response){
        cross(response);
        userRoleService.delete(id);
        return "success!";
    }
    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET,PUT,DELETE");

    }
}

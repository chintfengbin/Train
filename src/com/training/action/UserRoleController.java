package com.training.action;


import com.training.model.UserRole;
import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}

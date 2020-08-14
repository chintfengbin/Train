package com.training.action;


import com.training.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userrole")
public class UserRoleController {


    @Autowired
    UserRoleService userRoleService;


}

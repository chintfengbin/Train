package com.training.action;

import com.training.model.UserClick;
import com.training.service.UserClickService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/userclick")
public class UserClickController {

    @Autowired
    UserClickService userClickService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(UserClick userClick,HttpServletResponse response){
        cross(response);
        userClickService.add(userClick);
        return "success!";
    }

    @RequestMapping("/vdclicknum")
    @ResponseBody
    public long vdclicknum(long source_id,HttpServletResponse response){
        cross(response);
        return userClickService.vdclicknumb(source_id);
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}

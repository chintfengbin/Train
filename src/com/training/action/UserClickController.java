package com.training.action;

import com.training.model.UserClick;
import com.training.service.UserClickService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userclick")
public class UserClickController {

    @Autowired
    UserClickService userClickService;

    @RequestMapping("/add")
    public String add(UserClick userClick){
        userClickService.add(userClick);
        return "success!";
    }

    @RequestMapping("/vdclicknum")
    public long vdclicknum(long source_id){
        return userClickService.vdclicknumb(source_id);
    }
}

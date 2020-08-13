package com.training.action;

import com.training.model.User;
import com.training.model.UserSource;
import com.training.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/add")
    public String add(User user){
        String name=user.getUsername();
        User user1=userService.selectByName(name);
        if (user1==null){
            userService.add(user);
            return "success!";
        }
        return"false!";
    }

    @RequestMapping("/delete")
    public String delete(long id){
        userService.deleteById(id);
        return "删除成功";
    }

    @RequestMapping("/update")
    public String upadte(User user){
        userService.update(user);
        return "修改成功";
    }
    @RequestMapping("/list")
    public List<User> list(){
        List<User> users=userService.list();
        return users;
    }

}

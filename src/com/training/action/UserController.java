package com.training.action;

import com.training.model.PageInfo;
import com.training.model.User;
import com.training.model.UserSource;
import com.training.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;


    @RequestMapping("/add")
    @ResponseBody
    public String add(User user,HttpServletResponse response){
        cross(response);
        String name=user.getUsername();
        User user1=userService.selectByName(name);
        if (user1==null){
            userService.add(user);
            return "success!";
        }
        else {
            userService.deleteById(user1.getId());
            userService.add(user);
        }
        return"success!";
    }

    @RequestMapping("/delete")
    public String delete(long id,HttpServletResponse response){
        cross(response);
        userService.deleteById(id);
        return "success!";
    }

    @RequestMapping("/update")
    public String upadte(User user,HttpServletResponse response){
        cross(response);
        userService.update(user);
        return "success!";
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<User> list(HttpServletResponse response){
        cross(response);
        List<User> users=userService.list();
        return users;
    }

    @RequestMapping("/userInf")
    @ResponseBody
    public User userInf( long id,HttpServletResponse response){
        cross(response);
        return userService.userinf(id);
    }

    @RequestMapping("/listUserByPage")
    @ResponseBody
    public PageInfo<User> listByPage(Integer currentPage, Integer pageSize, HttpServletResponse response){
        cross(response);
        return userService.listUserByPage(currentPage,pageSize);
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}

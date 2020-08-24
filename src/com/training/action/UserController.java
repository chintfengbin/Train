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

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/addpage")
    public String addpage(){
        return "user/add";
    }
    @RequestMapping("/add")
    @ResponseBody
    public String add(User user){
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
    @ResponseBody
    public List<User> list(){
        List<User> users=userService.list();
        return users;
    }

    @RequestMapping("/userInf")
    @ResponseBody
    public User userInf( long id){
        return userService.userinf(id);
    }

    @RequestMapping("/listUserByPage")
    @ResponseBody
    public List<User> listByPage(Integer currentPage,Integer pageSize){
        return userService.listUserByPage(currentPage,pageSize);
    }
}

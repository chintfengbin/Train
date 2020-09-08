package com.training.action;

import com.training.model.PageInfo;
import com.training.model.UserSource;
import com.training.service.UserSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/usersource")
public class UserSourceController {


    @Autowired
    UserSourceService userSourceService;
        /*
        * 分页查询
        * */
    @RequestMapping("listUserSourceByPage")
    @ResponseBody
    public PageInfo<UserSource> list(Integer currentPage, Integer pageSize, HttpServletResponse response){
        cross(response);
        return userSourceService.list(currentPage,pageSize);
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(UserSource userSource,HttpServletResponse response){
        cross(response);
        userSourceService.add(userSource);
        return "success!";
    }

    @RequestMapping("/deleteBySourceId")
    @ResponseBody
    public String delete(long sourceid,HttpServletResponse response){
        cross(response);
        userSourceService.deleteBySourceId(sourceid);
        return "success!";
    }
    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET,PUT,DELETE");

    }
}

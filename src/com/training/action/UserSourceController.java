package com.training.action;

import com.training.model.UserSource;
import com.training.service.UserSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<UserSource> list(Integer currentPage,Integer pageSize){
        return userSourceService.list(currentPage,pageSize);
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(UserSource userSource){
        userSourceService.add(userSource);
        return "success!";
    }

    @RequestMapping("/deleteBySourceId")
    @ResponseBody
    public String delete(long sourceid){
        userSourceService.deleteBySourceId(sourceid);
        return "success!";
    }

}

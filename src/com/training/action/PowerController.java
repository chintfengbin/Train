package com.training.action;

import com.training.model.PageInfo;
import com.training.model.Power;
import com.training.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/power")
public class PowerController {

    @Autowired
    PowerService powerService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Power power,HttpServletResponse response){
        cross(response);
        powerService.add(power);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id,HttpServletResponse response){
        cross(response);
        powerService.delete(id);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Power power,HttpServletResponse response){
        cross(response);
        powerService.update(power);
        return "success!";
    }

    @RequestMapping("/listPowerByPage")
    @ResponseBody
    public PageInfo<Power> list(Integer currentPage, Integer pageSize,HttpServletResponse response ){
        cross(response);
       return powerService.listPowerByPage(currentPage,pageSize);
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}

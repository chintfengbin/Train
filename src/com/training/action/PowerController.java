package com.training.action;

import com.training.model.Power;
import com.training.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/power")
public class PowerController {

    @Autowired
    PowerService powerService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Power power){
        powerService.add(power);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id){
        powerService.delete(id);
        return "success!";
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(Power power){
        powerService.update(power);
        return "success!";
    }

    @RequestMapping("listPowerByPage")
    @ResponseBody
    public List<Power> list(Integer currentPage,Integer pageSize){
       return powerService.listPowerByPage(currentPage,pageSize);
    }
}

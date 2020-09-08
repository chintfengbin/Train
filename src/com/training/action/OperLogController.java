package com.training.action;

import com.training.model.OperLog;
import com.training.model.PageInfo;
import com.training.service.OperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/operlog")
public class OperLogController {

    @Autowired
    OperLogService operLogService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(OperLog operLog, HttpServletResponse response){
        cross(response);
        operLogService.add(operLog);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id,HttpServletResponse response){
        cross(response);
        operLogService.delete(id);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(OperLog operLog,HttpServletResponse response){
        cross(response);
        operLogService.update(operLog);
        return "success!";
    }

    @RequestMapping("/listOperLogByPage")
    @ResponseBody
    public PageInfo<OperLog> list(Integer currentPage, Integer pageSize, HttpServletResponse response){
        cross(response);
        return operLogService.listOperLogByPage(currentPage,pageSize);
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET,PUT,DELETE");

    }
}

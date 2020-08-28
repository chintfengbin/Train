package com.training.action;


import com.training.model.Menu;
import com.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Menu menu){
        menuService.add(menu);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id){
        menuService.delete(id);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Menu menu){
        menuService.update(menu);
        return "success!";
    }

    @RequestMapping("/listByUpMenu")
    @ResponseBody
    public List<Menu> list(String upmenu){
        return menuService.listByUpMenu(upmenu);
    }

}

package com.training.action;


import com.training.model.Menu;
import com.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Menu menu,HttpServletResponse response){
        cross(response);
        menuService.add(menu);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id, HttpServletResponse response ){
        cross(response);
        menuService.delete(id);
        return "success!";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Menu menu,HttpServletResponse response){
        cross(response);
        menuService.update(menu);
        return "success!";
    }

    /*
     * 分级查询菜单
     */
    @RequestMapping("/listAllMenu")
    @ResponseBody
    public List<Menu> listAll(HttpServletResponse response){
        cross(response);
        List<Menu> fatherMenus =menuService.listByUpMenu("");
        List<Menu> allMenus =menuService.listAllMenu();

        /*for (Menu fatherMenu :fatherMenus){
            List<Menu> children=new ArrayList<>();
            Menu menu=fatherMenu;
            String menuname =menu.getMenuname();
            for (Menu childrenMenu:allMenus){
                Menu menu1=childrenMenu;
                String upmenuname=childrenMenu.getUpmenu();
                if (menuname.equals(upmenuname)){
                    children.add(childrenMenu);
                }
            }
            fatherMenu.setChildrenmenu(children);
        }
        return fatherMenus;*/
         menuTree(fatherMenus,allMenus);
         return fatherMenus;
    }


    @RequestMapping("/listByUpMenu")
    @ResponseBody
    public List<Menu> list(String upmenu,HttpServletResponse response){
        cross(response);
        return menuService.listByUpMenu(upmenu);
    }

    /*
    * 处理多级菜单的递归函数，没有返回值，依次逐级添加父级列表的子列表
    * */
    public void menuTree(List<Menu> fatherMenus,List<Menu> allMenu){
        List<Menu> newFatherMenus = new ArrayList<>();//用于将同级所有父级菜单的子菜单列表合并存储新生成的父级列表
        for (Menu fatherMenu:fatherMenus){
            List<Menu> menus =new ArrayList<>();//一个父节点的子子列表
            for (Menu menu:allMenu){
                //如果匹配到子菜单，即加入子列表
                if (menu.getUpmenu().equals(fatherMenu.getMenuname())){
                    menus.add(menu);
//                    System.out.println("***************"+menu.getMenuname()+"************************");
                }
            }
            newFatherMenus.addAll(menus);//合并存储所有子列表生成新的父级列表
            fatherMenu.setChildrenmenu(menus);//为父级列表添加子列表
        }
        //如果新的父菜单为空打印日志，并停止递归
        if (newFatherMenus.size()==0){
            System.out.println("遍历结束！");
        }
        else
         menuTree(newFatherMenus,allMenu);
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET,PUT,DELETE");

    }
}

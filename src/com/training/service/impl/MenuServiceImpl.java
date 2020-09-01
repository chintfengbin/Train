package com.training.service.impl;

import com.training.mapper.MenuMapper;
import com.training.model.Menu;
import com.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;
    public void add(Menu menu){
        menuMapper.add(menu);
    }

    public void delete(long id){
        menuMapper.delete(id);
    }

    public void update(Menu menu){
        menuMapper.update(menu);
    }

    public List<Menu> listByUpMenu(String upmenu){
        return menuMapper.listByUpMenu(upmenu);
    }

    @Override
    public List<Menu> listAllMenu() {
        return menuMapper.listAllMenu();
    }
}

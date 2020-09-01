package com.training.service;


import com.training.model.Menu;

import java.util.List;

public interface MenuService {
    void add(Menu menu);

    void delete(long id);

    void update(Menu menu);

    List<Menu> listByUpMenu(String menuname);

    List<Menu> listAllMenu();
}


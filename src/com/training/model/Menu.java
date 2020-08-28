package com.training.model;

public class Menu {
    private long id;
    private String menuname;//菜单名
    private String upmenu;//父级菜单
    private String menutype;//菜单类型
    private String location;//位置
    private String needforce;//是否需要权限
    private String menulogo;//图标

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getUpmenu() {
        return upmenu;
    }

    public void setUpmenu(String upmenu) {
        this.upmenu = upmenu;
    }

    public String getMenutype() {
        return menutype;
    }

    public void setMenutype(String menutype) {
        this.menutype = menutype;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNeedforce() {
        return needforce;
    }

    public void setNeedforce(String needforce) {
        this.needforce = needforce;
    }

    public String getMenulogo() {
        return menulogo;
    }

    public void setMenulogo(String menulogo) {
        this.menulogo = menulogo;
    }
}

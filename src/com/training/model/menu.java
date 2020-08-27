package com.training.model;

public class menu {
    private long id;
    private String menuname;
    private String upmenu;
    private String menutype;
    private String location;
    private String needforce;
    private String menulogo;

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

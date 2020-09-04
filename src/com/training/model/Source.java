package com.training.model;

import java.io.File;

public class Source {
    private Integer id;

    private String title;

    private String explain;

    private String filetype;

    private String uploadby;

    private String location;

    private String uploadtime;

    private String filesize;
    private String bgpath;
    private long userclick;
    private String show;
    private String deptname;

    private String reallocation;
    private String realbgpath;

    public String getReallocation() {
        return reallocation;
    }

    public void setReallocation(String reallocation) {
        this.reallocation = reallocation;
    }

    public String getRealbgpath() {
        return realbgpath;
    }

    public void setRealbgpath(String realbgpath) {
        this.realbgpath = realbgpath;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    public long getUserclick() {
        return userclick;
    }

    public void setUserclick(long userclick) {
        this.userclick = userclick;
    }


    public String getBgimage() {
        return bgpath;
    }

    public void setBgimage(String bgimage) {
        this.bgpath = bgimage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain == null ? null : explain.trim();
    }

    public String getType() {
        return filetype;
    }

    public void setType(String type) {
        this.filetype = type == null ? null : type.trim();
    }

    public String getUploadby() {
        return uploadby;
    }

    public void setUploadby(String uploadby) {
        this.uploadby = uploadby == null ? null : uploadby.trim();
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(String uploadtime) {
        this.uploadtime = uploadtime == null ? null : uploadtime.trim();
    }

    public String getSize() {
        return filesize;
    }

    public void setSize(String size) {
        this.filesize = size == null ? null : size.trim();
    }
}
package com.training.model;

import java.util.Date;

public class Comment {
    private long id;
    private long user_id;
    private String cmtime;
    private String cmcontent;
    private String remark;
    private long source_id;

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", cmtime=" + cmtime +
                ", cmcontent='" + cmcontent + '\'' +
                ", remark='" + remark + '\'' +
                ", source_id=" + source_id +
                '}';
    }

    public long getSource_id() {
        return source_id;
    }

    public void setSource_id(long source_id) {
        this.source_id = source_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getCmtime() {
        return cmtime;
    }

    public void setCmtime(String cmtime) {
        this.cmtime = cmtime;
    }

    public String getCmcontent() {
        return cmcontent;
    }

    public void setCmcontent(String cmcontent) {
        this.cmcontent = cmcontent;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

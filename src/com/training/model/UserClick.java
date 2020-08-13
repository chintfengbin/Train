package com.training.model;

public class UserClick {
    private long id;
    private long user_id;
    private long source_id;
    private long clicknumber;
    private String remark;

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", source_id=" + source_id +
                ", clicknumber=" + clicknumber +
                ", remark='" + remark + '\'' +
                '}';
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

    public long getSource_id() {
        return source_id;
    }

    public void setSource_id(long source_id) {
        this.source_id = source_id;
    }

    public long getClicknumber() {
        return clicknumber;
    }

    public void setClicknumber(long clicknumber) {
        this.clicknumber = clicknumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

package com.training.model;

public class RolePower {
    private long id;
    private long role_id;
    private long power_id;
    private String remark;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getRole_id() {
        return role_id;
    }

    public void setRole_id(long role_id) {
        this.role_id = role_id;
    }

    public long getPower_id() {
        return power_id;
    }

    public void setPower_id(long power_id) {
        this.power_id = power_id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

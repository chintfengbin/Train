package com.training.model;

public class Power {
    private long id;
    private String powername;//权限名
    private String powervalue;//权限值
    private String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPowername() {
        return powername;
    }

    public void setPowername(String powername) {
        this.powername = powername;
    }

    public String getPowervalue() {
        return powervalue;
    }

    public void setPowervalue(String powervalue) {
        this.powervalue = powervalue;
    }
}

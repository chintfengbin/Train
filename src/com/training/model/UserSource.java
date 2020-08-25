package com.training.model;

public class UserSource {
    private long id;
    private long userid;
    private long sourceid;
    private String remark;

    @Override
    public String toString() {
        return "UserSource{" +
                "userid='" + userid + '\'' +
                ", sourceid='" + sourceid + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public long getSourceid() {
        return sourceid;
    }

    public void setSourceid(long sourceid) {
        this.sourceid = sourceid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

package com.training.model;

public class UserSource {
    private String userid;
    private String sourceid;
    private String remark;

    @Override
    public String toString() {
        return "UserSource{" +
                "userid='" + userid + '\'' +
                ", sourceid='" + sourceid + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getSourceid() {
        return sourceid;
    }

    public void setSourceid(String sourceid) {
        this.sourceid = sourceid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

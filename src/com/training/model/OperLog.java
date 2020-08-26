package com.training.model;

import java.util.Date;

public class OperLog {
    private Integer id;
    private String title;
    private Integer bussiness_type;
    private String method;
    private String request_method;
    private Integer operator_type;
    private String oper_name;
    private String dept_name;
    private String oper_url;
    private String oper_ip;
    private String oper_location;
    private String oper_param;
    private String json_result;
    private Integer status;
    private String error_msg;
    private Date oper_time;

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
        this.title = title;
    }

    public Integer getBussiness_type() {
        return bussiness_type;
    }

    public void setBussiness_type(Integer bussiness_type) {
        this.bussiness_type = bussiness_type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getRequest_method() {
        return request_method;
    }

    public void setRequest_method(String request_method) {
        this.request_method = request_method;
    }

    public Integer getOperator_type() {
        return operator_type;
    }

    public void setOperator_type(Integer operator_type) {
        this.operator_type = operator_type;
    }

    public String getOper_name() {
        return oper_name;
    }

    public void setOper_name(String oper_name) {
        this.oper_name = oper_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getOper_url() {
        return oper_url;
    }

    public void setOper_url(String oper_url) {
        this.oper_url = oper_url;
    }

    public String getOper_ip() {
        return oper_ip;
    }

    public void setOper_ip(String oper_ip) {
        this.oper_ip = oper_ip;
    }

    public String getOper_location() {
        return oper_location;
    }

    public void setOper_location(String oper_location) {
        this.oper_location = oper_location;
    }

    public String getOper_param() {
        return oper_param;
    }

    public void setOper_param(String oper_param) {
        this.oper_param = oper_param;
    }

    public String getJson_result() {
        return json_result;
    }

    public void setJson_result(String json_result) {
        this.json_result = json_result;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public Date getOper_time() {
        return oper_time;
    }

    public void setOper_time(Date oper_time) {
        this.oper_time = oper_time;
    }
}

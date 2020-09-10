package com.training.model;

public class User {
    private Integer id;

    private String username;

    private String sex;

    private String password;

    private String identitynumber;

    private String dept;

    private String email;

    private String phone;

    private long dep_id;

    public long getDep_id() {
        return dep_id;
    }

    public void setDep_id(long dep_id) {
        this.dep_id = dep_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getIdentitynumber() {
        return identitynumber;
    }

    public void setIdentitynumber(String identitynumber) {
        this.identitynumber = identitynumber == null ? null : identitynumber.trim();
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept == null ? null : dept.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", sex='" + sex + '\'' +
                ", password='" + password + '\'' +
                ", identitynumber='" + identitynumber + '\'' +
                ", dept='" + dept + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", dep_id=" + dep_id +
                '}';
    }
}
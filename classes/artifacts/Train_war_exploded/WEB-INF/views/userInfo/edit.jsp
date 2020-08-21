<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" >
<head>
    <%@ include file="/pages/common/meta.jsp"%>
   <title>登陆</title>
    <%@ include file="/pages/common/comm.jsp"%>
    </head>
</head>
<body class="white-bg">
    <div class="wrapper wrapper-content animated fadeInRight ibox-content">
        <form class="form-horizontal m" id="form-info-edit">
            <input name="userId"  value="${userInfo.userId}" type="hidden">
          
            <div class="form-group">    
                <label class="col-sm-3 control-label">登录账号：</label>
                <div class="col-sm-8">
                    <input name="loginName"  value="${userInfo.loginName}" class="form-control" type="text" required>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">用户姓名：</label>
                <div class="col-sm-8">
                    <input name="userName" value="${userInfo.userName}"  class="form-control" type="text" required>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">类型：</label>
                <div class="col-sm-8">
                    <select name="userType" class="form-control m-b">
                        
                         <option  <c:if test="${userInfo.userType==0}"> selected</c:if> value="0">普通用户</option>
								<option  <c:if test="${userInfo.userType==1}"> selected</c:if> value="1">管理员</option>
                  
                    </select>
                      </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">邮箱：</label>
                <div class="col-sm-8">
                    <input name="email" value="${userInfo.email}"   class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">手机号码：</label>
                <div class="col-sm-8">
                    <input name="phonenumber" value="${userInfo.phonenumber}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">用户性别：</label>
                <div class="col-sm-8">
                    <select name="sex" class="form-control m-b">
                      
                         <option value="0"   
                         <c:if test="${userInfo.sex==0}"> selected</c:if>>男</option>
                                     <option value="1" <c:if test="${userInfo.sex==1}"> selected</c:if>>女</option>
                              
                    </select>
                    
                    </div>
            </div>            
            
           
        </form>
    </div>    
    <script type="text/javascript">
        var prefix = ctx + "s4hc/info";
        $("#form-info-edit").validate({
            focusCleanup: true
        });

        function submitHandler() {
            if ($.validate.form()) {
                $.operate.save(prefix + "/edit", $('#form-info-edit').serialize());
            }
        }
    </script>
</body>
</html>
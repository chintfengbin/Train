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
        <form class="form-horizontal m" id="form-info-add">
            
            <div class="form-group">    
                <label class="col-sm-3 control-label">登录账号：</label>
                <div class="col-sm-8">
                    <input name="loginName" class="form-control" type="text" required>
                </div>
            </div>
              <div class="form-group">    
                <label class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input name="password" class="form-control" type="text">
                </div>
            </div>      
            <div class="form-group">    
                <label class="col-sm-3 control-label">用户姓名：</label>
                <div class="col-sm-8">
                    <input name="userName" class="form-control" type="text" required>
                </div>
            </div>
                <div class="form-group">    
                <label class="col-sm-3 control-label">用户性别：</label>
                <div class="col-sm-8">
                    <select name="sex" class="form-control m-b">
                       
                        <option value="0">男</option>
				                <option value="1">女</option>
				                 
                    </select>
                    </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">用户类型：</label>
                <div class="col-sm-8">
                    <select name="userType" class="form-control m-b">
                        
                        <option  value="0">普通用户</option>
								<option  value="1">管理员</option>
                    </select>
                   </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">用户邮箱：</label>
                <div class="col-sm-8">
                    <input name="email" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">手机号码：</label>
                <div class="col-sm-8">
                    <input name="phonenumber" class="form-control" type="text">
                </div>
            </div>
           <div class="form-group">    
                <label class="col-sm-3 control-label">备注：</label>
                <div class="col-sm-8">
                    <input name="remark" class="form-control" type="text">
                </div>
            </div>
        
              
        </form>
    </div>
     <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="submitHandler()" ><i class="fa fa-check"></i>保 存</button>&nbsp;
            <button type="button" class="btn btn-sm btn-danger" onclick="closeItemA()"><i class="fa fa-reply-all"></i>关 闭 </button>
        </div>
    </div>
   
    <script type="text/javascript">
    var ctx ="<%=basePath%>" ;
    var prefix = ctx + "userInfo"
      
      /*  $("#form-info-add").validate({
            focusCleanup: true
        });

        function submitHandler() {
            if ($.validate.form()) {
                $.operate.save(prefix + "/add", $('#form-info-add').serialize());
            }
        }*/
        function submitHandler() {
            /*  if ($.validate.form()) {
                  $.operate.save(prefix + "/add", $('#form-employee-add').serialize());
              }*/
          	$.ajax({
                  type : "POST",
                  dataType:"json",
                  async: false,
                  url : "${pageContext.request.contextPath}/userInfo/addSave",
                  data:$("#form-info-add").serialize(),
                  success : function(data) {
                  	console.log("SUCCESS: ", data);
                  	flag = data.flag;
                  	console.info("1 -- : " + flag);
                  	if(flag=="1"){                		
                  		closeItemA();
                  		
                  	}
                  	
                  }
              });
          }
          function closeItemA(){
          	window.location.href ="<%=basePath%>userInfo";
          	
          }
    </script>
</body>
</html>
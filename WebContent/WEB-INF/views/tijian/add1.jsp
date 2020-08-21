<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@page import="com.EHC.model.Tijian"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html lang="zh">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>员工体检信息录入</title>	
	
	<style>
		.right{float:right}
	</style>
	<%@ include file="/pages/common/comm.jsp"%>
	<script src="<%=basePath%>js/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/common/form.js" type="text/javascript"></script>
	<script src="<%=basePath%>assets/layui.js" type="text/javascript"></script>


</head>

<body class="white-bg">


    <div class="main-content">
        <form id="form-user-add" class="form-horizontal" method="post" action="<%=basePath%>tijian/save">
           
            <h4 class="form-header h4">用户信息</h4>
            <div class="row">
            	<div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>登陆账号：</label>
                        <div class="col-sm-8">
                            <input name="name" id="name" placeholder="请输入登陆账号" class="form-control" type="text" maxlength="30" required>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>手机号码：</label>
                        <div class="col-sm-8">
                            <input id="phonenumber" name="phonenumber" placeholder="请输入手机号码" class="form-control" type="text" maxlength="11" required>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>邮箱：</label>
                        <div class="col-sm-8">
                            <input id="email" name="email" class="form-control email" type="text" maxlength="50" placeholder="请输入邮箱" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>用户姓名：</label>
                        <div class="col-sm-8">
                            <input id="userName" name="userName" placeholder="请输入用户姓名" class="form-control" type="text" maxlength="30" required>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>登录密码：</label>
                        <div class="col-sm-8">
                            <input name="pwd" placeholder="请输入登录密码" class="form-control" type="password" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户性别：</label>
                        <div class="col-sm-8">
                            <select name="sex" class="form-control m-b" >
				                <option value="0">男</option>
				                <option value="1">女</option>
				                 <option value="2">未知</option>
				            </select>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row">
            	<div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户角色：</label>
                        <div class="col-sm-8">
                       
                            <select id="role_id" name="roleId" class="form-control m-b">
								<option  value="0">普通用户</option>
								<option  value="1">管理员</option>
							</select>
                        </div>
                    </div>
                </div>
                 <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">备注：</label>
                        <div class="col-sm-8">
                            <input name="remark" placeholder="备注"  class="form-control" type="text" >
                        </div>
                    </div>
                </div>
            </div>
           
         
           
        </form>
    </div>
     <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="submitHandler()" ><i class="fa fa-check"></i>保 存</button>&nbsp;
            <button type="button" class="btn btn-sm btn-danger" onclick="navTo('<%=basePath%>user/list')""><i class="fa fa-reply-all"></i>关 闭 </button>
        </div>
    </div>
   
	<script>
		var ctx = "\/";
	</script>


	<script type="text/javascript">
	window.base="<%=basePath%>";
	function submitHandler(){		
		 if ($("#form-user-add").validate().form()) {
			 $("#form-user-add").submit();
		 }			
		
	}
	 
	
	$(function () {
		
	});
		
	</script>
	

</body>

</html>
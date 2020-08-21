<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@page import="com.cert.model.User"%>
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
	<title>修改用户密码</title>
	<%@ include file="/pages/common/rapid.jsp"%>
	<script src="<%=basePath%>js/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/user/form.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/js1/layui.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery/validate/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery/validate/jquery.validate.extend.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery/validate/additional-methods.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery/validate/messages_zh.min.js" type="text/javascript"></script>
	
</head>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-user-resetPwd" method="post" action="<%=basePath%>user/update">
			<input name="id"  id="id" type="hidden"  value="${eneity.id}" />
			<div class="form-group">
				<label class="col-sm-3 control-label ">登录名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" readonly="true" name="name" value="${eneity.name}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">旧密码：</label>
				<div class="col-sm-8">
					<input class="form-control" type="password" name="pwd" id="oldPassword">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">新密码：</label>
				<div class="col-sm-8">
					<input class="form-control" type="password" name="newPassword" id="newPassword">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">再次确认：</label>
				<div class="col-sm-8">
					<input class="form-control" type="password" name="confirm" id="confirm">
					<span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请再次输入您的密码</span>
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
	window.base="<%=basePath%>";
		$("#form-user-resetPwd").validate({
			rules:{
				pwd:{
					required:true,
					remote: {
						url: window.base + "user/checkPassword",
	                    type: "get",
	                    dataType: "json",
	                    data: {
	                    	"id": function() {
                                return $("#id").val();
                            },
	                        "pwd": function() {
	                            return $("#oldPassword").val();
	                        }
	                    }
	                }
				},
				newPassword: {
	                required: true,
	                minlength: 5,
	    			maxlength: 20
	            },
				
	            confirm: {
	                required: true,
	                equalTo: "#newPassword"
	            }
			},
			messages: {
	            pwd: {
	                required: "请输入原密码",
	                remote: "原密码错误"
	            },
	            newPassword: {
	                required: "请输入新密码",
	                minlength: "密码不能小于6个字符",
	                maxlength: "密码不能大于20个字符"
	            },
	            confirm: {
	                required: "请再次输入新密码",
	                equalTo: "两次密码输入不一致"
	            }

	        },
	        focusCleanup: true
		});
		
		function submitHandler() {
			 if ($("#form-user-resetPwd").validate().form()) {
				 $("#form-user-resetPwd").submit();
			 }		
	       
	    }
	</script>
</body>

</html>


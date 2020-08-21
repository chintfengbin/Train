<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发送邮件</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>

    发送邮件 <br>
    

<!-- 操作按钮 start -->
<table width="100%">
<tr><td height="15"></td></tr>

	<tr>	
					<td>
					<%
    					String msg=(String)session.getAttribute("msg");
    				%>
					
					<%=(String)request.getAttribute("msg")%></td>
					
					</tr>
					
	
</table>

  </body>
</html>

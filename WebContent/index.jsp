<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ssi-transaction</title>

  </head>
  
  <body>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
 <a href="${pageContext.request.contextPath}/mvc/firstPage"></a> 
 <h1>---${loginUser}---</h1>
		    <a href="add.jsp">新增数据</a>
		    <a href="getAll.do">查看全部数据</a>
  </body>
</html>

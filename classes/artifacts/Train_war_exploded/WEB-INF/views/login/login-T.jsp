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
     <script type="text/javascript">
       
        var ctx ="<%=basePath%>";
        </script>
   <script src="<%=basePath%>js/jquery.min.js" type="text/javascript" ></script> 
  <script src="<%=basePath%>js/login.js"  type="text/javascript" ></script> 

  </head>
  
  <body>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <form action="testLogin" id="signupForm">
	  <table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="129" align="right">用户名称</td>
	      <td width="261"><input type="text" name="username"></td>
	    </tr>
	    <tr>
	      <td align="right">用户密码</td>
	      <td><input type="password" name="password"></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td><input type="button"  id="btnSubmit" value="登录123" onclick="login();"></td>
	    </tr>
	    <tr>
	    <p class="login-tips" id="msg"></p>
	    </tr>
	  </table>
  </form> 


  
  
  </body>
</html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>

    
    <title>error</title>
    
    <%@ include file="/pages/common/meta.jsp"%>

	<%
		//System.out.print("error page start");
		Exception e = (Exception)request.getAttribute("exception");
	%>
	<style type="text/css">
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			font-size: 9pt;
			color: #111111;
		}
 
       .font14 {
			font-size: 14pt;
			color: #F2683E;
			font-weight: bold;
			height: 50px;
		}
		 .font12 {
			font-size: 12pt;
			color: #F2683E;
			font-weight: bold;
			height: 30px;
		}
		.font10 {
			font-size: 10pt;
			color: #111111;
			line-height: 22px;
			font-weight: bold;
		}
		.font {
			font-size: 9pt;
			color: #113E75;
			line-height: 22px;
		}
		.font_e {
			font-size: 10pt;
			color: #113E75;
			line-height: 18px;
			font-family: Verdana, Arial, Helvetica, sans-serif;
		}
	</style>
  </head>
  
  <body topmargin="0">
  
    <table width="90%" class="font" style="border-collapse: collapse" border="0" align="center" bordercolor="7C9ECB" cellpadding="0" cellspacing="4">
      	<tr><td height="8"></td></tr>
      	<tr><td class="font14"><center>错误信息</center></td></tr>
      	<tr><td class="font10">错误信息：</td></tr>
      	<tr><td class="font"><%= e.getMessage()%></td></tr>
      	

      	<tr><td class="font10">StackTrace：</td></tr>
      	<tr><td class="font_e">
	     <%

			StackTraceElement[] eles = e.getStackTrace();
			for(int i=0;i<eles.length; i++){
				StackTraceElement ele = eles[i];
				out.print("at " + ele.getClassName()+"." + ele.getMethodName()+"("+ele.getFileName() + ele.getLineNumber() +")" +"<br>");
			}
			out.print("<br>");
		%>
		</td></tr>

	 </table>
 
  </body>
</html>

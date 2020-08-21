<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	 <base href="<%=basePath%>">
    <script type="text/javascript">
		
		window.base="<%=basePath%>";
		
		window.onload = function(){			
			<%--window.location="<%=basePath%>login/index";--%>
			window.location="<%=basePath%>source/uploadpage";
			};
		</script>
    <title>Train</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		 <link href="<%=basePath%>css/css1/bootstrap.min.css" rel="stylesheet"/>
		
		<link rel="stylesheet" href="<%=basePath%>css/css1/ace.min.css" />
		
	</head>
	<body class="login-layout light-login">
	
	</body>
</html>

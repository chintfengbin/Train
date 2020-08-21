<%--
  Created by IntelliJ IDEA.
  User: fbin
  Date: 2020/8/14
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=basePath%>user/add" method="post">
    用户名：<input type="text" name="username"><br>
    性别:<input type="text" name="sex" list="sexlist" ><br>
            <datalist id="sexlist">
                <option>男</option>
                <option>女</option>
            </datalist>
    密码:<input type="text" name="password"><br>
    身份证:<input type="text" name="identitynumber"><br>
    部门:<input type="text" name="dept" ><br>
    部门编号:<input type="text" name="dep_id"><br>
    邮箱:<input type="text" name="email"><br>
    手机号:<input type="text" name="phone"><br>
    <input type="submit" value="提交"><br>
</form>
</body>
</html>

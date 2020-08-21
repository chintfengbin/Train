<%--
  Created by IntelliJ IDEA.
  User: fbin
  Date: 2020/8/12
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>上传</title>
</head>
<body>
<form action="<%=basePath%>source/upload.action" method="post" enctype="multipart/form-data">
    标题：<input type="text" name="title"><br>
    资源类型：<input id="type" type="text" list="typelist" name="type"><br>
    <datalist id="typelist">
        <option>视频</option>
        <option>pdf</option>
        <option>ppt</option>
    </datalist>
    说明：<input type="text" name="explain"><br>
    上传者：<input type="text" name="uploadby"><br>
    选择文件:<input type="file" name="file" width="120px"><br>
    选择封面:<input type="file" name="bgpath" width="120px"/><br>
    <input type="submit" value="上传">
</form>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fbin
  Date: 2020/8/13
  Time: 14:44
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
<%--<table>--%>
<%--    <tr>--%>
<%--        <th>资源名</th>--%>
<%--        <th>资源类型</th>--%>
<%--        <th>资源位置</th>--%>
<%--        <th>上传时间</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${sources}" var="source">--%>
<%--        <tr>--%>
<%--            <td>${source.title}</td>--%>
<%--            <td>${source.type}</td>--%>
<%--            <td>${source.location}</td>--%>
<%--            <td>${source.uploadtime}</td>--%>
<%--                &lt;%&ndash;            <a href=""&ndash;%&gt;--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>


<div class="row" style="width: 1210px; margin: 0 auto;">
    <div class="col-md-12">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
        </ol>
    </div>
    <c:forEach items="${sources }" var="source">
        <div class="col-md-2" style="height:250px;float: left" >
            <a href="test.jsp"> <img src="<%=basePath%>upload/冯斌/${source.bgimage.substring(source.bgimage.length()-26)}"
                                             width="170" height="170" style="display: inline-block;">
            </a>
            <p>
                <a href="test.jsp" style='color: green'>${source.title }</a>
            </p>
        </div>
    </c:forEach>
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>员工体检</title>
<link rel="stylesheet" href="./assets/css/layui.css">
 
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">员工体检</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <!--  右上
    <ul class="layui-nav layui-layout-left">
       <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
     
    </ul>
    -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          用户
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
        <!--  
          <a class="" href="./pages/user/table.jsp">用户管理</a>
          -->
          <dl class="layui-nav-child">
            <dd><a target="mainframe" href="./tijian">体检管理</a></dd>
             <!--  
             <dd><a target="mainframe" href="./employee">员工管理</a></dd>
             <dd><a target="mainframe" href="./employee?state=1">在职员工</a></dd>
            <dd><a target="mainframe" href="./employee?state=0">离职员工</a></dd>
            -->
            <dd><a target="mainframe" href="./workshop?type=0">车间管理</a></dd>
           <dd><a target="mainframe" href="./workshop?type=1">岗位管理</a></dd>
           <dd><a target="mainframe" href="./workshop?type=2">危害因素管理</a></dd>
            <dd><a target="mainframe" href="./workshop?type=3">部门管理</a></dd>
           
            <dd><a target="mainframe" href="./workJobYh">车间岗位危害管理</a></dd>
             <dd><a target="mainframe" href="./userInfo">登陆管理</a></dd>
           
            <!--  
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
            -->
          </dl>
        </li>
           
        <li class="layui-nav-item">
          <a href="javascript:;">员工管理</a>
          <dl class="layui-nav-child">
            <dd><a target="mainframe" href="./employee?state=1">在职员工</a></dd>
            <dd><a target="mainframe" href="./employee?state=0">离职员工</a></dd>
            <dd><a target="mainframe" href="./employee?state=2">调入员工</a></dd>
           <dd><a target="mainframe" href="./employee?state=3">调出员工</a></dd>
           
            <!-- 
            <dd><a href="">超链接</a></dd>
             -->
          </dl>
        </li>
        <!--
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      -->
      </ul>
    </div>
  </div>
 
  <div class="layui-body">
    <!-- 内容主体区域 -->
  
    <IFRAME id="conFrame" frameBorder=0 name=mainframe src="./tijian" height="100%" width="100%"  scrolling="yes"></IFRAME>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    员工体检
  </div>
</div>
<script src="./assets/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>

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

<link rel="stylesheet" href="<%=basePath%>/css/base.css">
<link rel="stylesheet" href="<%=basePath%>/css/index.css">
<link rel="stylesheet" href="<%=basePath%>/css/jquery.dialog.css">


 <style>
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
    </style>
</head>
<body class="layui-layout-body">
<div id="container">
	<div id="hd">
    	<div class="hd-wrap ue-clear">
        	<div class="top-light"></div>
            <h1 class="员工监护"></h1>
            <div class="login-info ue-clear">
                <div class="welcome ue-clear"><span>欢迎您,</span><a href="javascript:void(0)" class="user-name">用户</a></div>
                <div class="login-msg ue-clear">
                   <!--  
                    <a href="javascript:void(0)" class="msg-txt">消息</a>
                    <a href="javascript:void(0)" class="msg-num">10</a>
                -->
                </div>
            </div>
            <div class="toolbar ue-clear">
               <!--
                <a target="mainframe" class="home-btn" href="./tijian">体检</a>
                  
                <a href="javascript:void(0)" class="home-btn1" target="right" onclick="openlayer()">修改密码</a>
                <a href="javascript:void(0)" class="quit-btn exit home-btn">退出</a>
            -->
            </div>
        </div>
    </div>
    <div id="bd">
    	<div class="wrap ue-clear">
        	<div class="sidebar">
            	<h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                	 <li class="train">
                    <div class="nav-header">
                    <a target="mainframe" class="ue-clear" >
                    <span>管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                     
                   
                  
                  
                    
        
                   
                </ul>
            </div>
            <div class="content">
            	<!--  
            	<iframe src="./tijian" id="iframe" width="100%" height="100%" frameborder="0" name="mainframe" style="min-width: 1100px"></iframe>
           -->
           <iframe src="" id="iframe" width="100%" height="100%" frameborder="0" name="mainframe" style="min-width: 1100px"></iframe>
            </div>
        </div>
    </div>
    <div id="ft" class="foot_div">

            <span>职业监护岗位</span>
            <em>员工&nbsp;健康</em>

        <div class="ft-right">
            <span>公司</span>
            <em><a href="http://coas.chint.com" target="_blank">Noark</a></em>
        </div>
    </div>
</div>
<script src="<%=basePath%>/assets/layui.js"></script>
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/firstIndex/index.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>

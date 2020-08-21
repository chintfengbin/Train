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

<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/jquery.dialog.css">


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
               
                <a target="mainframe" class="home-btn" href="./tijian">体检</a>
                <!--  
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
                	<li class="office current"><div class="nav-header"><a target="mainframe" href="./tijian" class="ue-clear"><span>体检</span><i class="icon"></i></a></div></li>
                  
                    <li class="train">
                    <div class="nav-header">
                    <a target="mainframe" href="./workshop?type=0" class="ue-clear" >
                    <span>车间管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                     <li class="agency"><div class="nav-header">
                    <a target="mainframe" href="./workshop?type=1" class="ue-clear" >
                    <span>岗位管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                     <li class="list_m"><div class="nav-header">
                    <a target="mainframe" href="./workshop?type=2" class="ue-clear" >
                    <span>危害因素管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                    <li class="news_m"><div class="nav-header">
                    <a target="mainframe" href="./workshop?type=3" class="ue-clear" >
                    <span>部门管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                    <li class="role_m"><div class="nav-header">
                    <a target="mainframe" href="./workJobYh" class="ue-clear" >
                    <span>车间岗位危害</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
                     <li class="dossier"><div class="nav-header">
                    <a target="mainframe" href="./userInfo" class="ue-clear" >
                    <span>登陆管理</span>
                    <i class="icon"></i>
                    </a>
                    </div>
                    </li>
        <li class="part">
          <div class="nav-header">
          <a href="JavaScript:;" class="ue-clear" ><span>员工管理</span><i class="icon hasChild"></i></a></div>
          <ul class="subnav">
                            <li><a target="mainframe" href="./employee?state=1">在职员工</a></li>
                            <li><a target="mainframe" href="./employee?state=0">离职员工</a></li>
 <li><a target="mainframe" href="./employee?state=2">调入员工</a></li>
 <li><a target="mainframe" href="./employee?state=3">调出员工</a></li>

          
          </ul>
         
        </li>
                   
                </ul>
            </div>
            <div class="content">
            	<iframe src="./tijian" id="iframe" width="100%" height="100%" frameborder="0" name="mainframe" style="min-width: 1100px"></iframe>
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
<script src="./assets/layui.js"></script>
<script src="./js/jquery.min.js"></script>
<script src="./js/firstIndex/index.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>

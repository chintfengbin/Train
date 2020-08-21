
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train</title>
    <style>
        html,
        body {
            height: 100%;
        }

        .login-vue {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .login-vue .container {
            background: rgba(255, 255, 255, .5);
            width: 300px;
            text-align: center;
            border-radius: 10px;
            padding: 30px;
        }

        .login-vue .ivu-input {
            background-color: transparent;
            color: #fff;
            outline: #fff;
            border-color: #fff;
        }

        .login-vue ::-webkit-input-placeholder {
            /* WebKit, Blink, Edge */
            color: rgba(255, 255, 255, .8);
        }

        .login-vue :-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            color: rgba(255, 255, 255, .8);
        }

        .login-vue ::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            color: rgba(255, 255, 255, .8);
        }

        .login-vue :-ms-input-placeholder {
            /* Internet Explorer 10-11 */
            color: rgba(255, 255, 255, .8);
        }

        .login-vue .title {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .login-vue .input-c {
            margin: auto;
            width: 200px;
        }

        .login-vue .error {
            color: red;
            text-align: left;
            margin: 5px auto;
            font-size: 12px;
            padding-left: 30px;
            height: 20px;
        }


        .login-vue .account {
            margin-top: 30px;
        }

        .login-vue .account span {
            cursor: pointer;
        }

        .login-vue .ivu-icon {
            color: #eee;
        }

        .login-vue .ivu-icon-ios-close-circle {
            color: #777;
        }

        .login-vue .input-c {
            margin: auto;
            width: 200px;
        }

        .ivu-input-wrapper {
            display: inline-block;
            width: 100%;
            position: relative;
            vertical-align: middle;
            line-height: normal;
        }

        .ivu-input {
            background-color: transparent;
            color: #fff;
            outline: #fff;
            border-color: #fff;
            display: inline-block;
            width: 100%;
            height: 18px;
            line-height: 1.5;
            padding: 4px 7px;
            font-size: 14px;
            border: 1px solid #dcdee2;
            border-radius: 4px;
            color: #515a6e;
            background-color: #fff;
            background-image: none;
            position: relative;
            cursor: text;
            transition: border .2s ease-in-out, background .2s ease-in-out, box-shadow .2s ease-in-out;
        }

        .ivu-btn {
            display: inline-block;
            margin-bottom: 0;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            touch-action: manipulation;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            white-space: nowrap;
            line-height: 1.5;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            height: 32px;
            padding: 0 15px;
            font-size: 14px;
            border-radius: 4px;
            transition: color .2s linear, background-color .2s linear, border .2s linear, box-shadow .2s linear;
            color: #515a6e;
            background-color: #fff;
            border-color: #dcdee2;
        }


        .ivu-btn-primary {
            color: #fff;
            background-color: #2d8cf0;
            border-color: #2d8cf0;
        }

        .ivu-btn,
        .ivu-btn:active,
        .ivu-btn:focus {
            outline: 0;
        }

        .submit {
            width: 214px;
            margin-left: 17px;
        }
    </style>
     <script type="text/javascript">
       
        var ctx ="<%=basePath%>";
        </script>
   <script src="<%=basePath%>js/jquery.min.js" type="text/javascript" ></script> 
  <script src="<%=basePath%>js/login.js"  type="text/javascript" ></script> 
    
</head>

<body>
<form action="/login/check" type="Post">
<div class="login-vue" style='background-image: url("<%=basePath%>img/bg03.jpg");'>
    <div class="container">
        <p class="title">WELCOME</p>
        <div class="input-c">
            <input class="ivu-input" prefix="ios-contact" placeholder="账号" name="username"  value="admin"/>
            <p class="error" id="msgName"></p>
        </div>
        <div class="input-c">
            <input class="ivu-input" type="password" prefix="md-lock" placeholder="密码"  name="password" value="123456"/>
            <p class="error" id="msg"></p>
        </div>
        <input type="button" value="登录"  onclick="login();">
        <!--  
        <p class="account"><span>注册账号</span> | <span>忘记密码</span></p>
    -->
    </div>
</div></form>
</body>

</html>

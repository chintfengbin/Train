<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
 <%@ include file="/pages/common/meta.jsp"%>
    <title>登陆</title>
   <%@ include file="/pages/common/comm.jsp"%>
</head>

<body class="gray-bg">
     <div class="container-div">
        <div class="row">
            <div class="col-sm-12 search-collapse">
                <form id="formId">
                    <div class="select-list">
                        <ul>
                           
                            <li>
                                <p>登录账号：</p>
                                <input type="text" name="loginName"/>
                            </li>
                            <li>
                                <p>用户姓名：</p>
                                <input type="text" name="userName"/>
                            </li>
                            <li>
                                <p>用户类型：</p>
                                <select name="userType" >
                                    <option value="">所有</option>
                                   <option  value="0">普通用户</option>
								<option  value="1">管理员</option>
                                </select>
                            </li>
                            <li>
                                <p>用户邮箱：</p>
                                <input type="text" name="email"/>
                            </li>
                            <li>
                                <p>手机号码：</p>
                                <input type="text" name="phonenumber"/>
                            </li>
                            <li>
                                <p>用户性别：</p>
                                <select name="sex" >
                                    <option value="">所有</option>
                                    <option value="0">男</option>
				                <option value="1">女</option>
				                
                                </select>
                            </li>
                            <li>
                                <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
                                <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>

            <div class="btn-group-sm" id="toolbar" role="group">
                <a class="btn btn-success" target="mainframe" href="./userInfo/add" >
                    <i class="fa fa-plus"></i> 添加
                </a>
               
                <a class="btn btn-danger multiple disabled" onclick="$.operate.removeAll()" >
                    <i class="fa fa-remove"></i> 删除
                </a>
                <a class="btn btn-warning" onclick="$.table.exportExcel()" >
                    <i class="fa fa-download"></i> 导出
                 </a>
            </div>
            <div class="col-sm-12 select-table table-striped">
                <table id="bootstrap-table"></table>
            </div>
        </div>
    </div>

	  <th:block th:include="include :: footer" />
    <script th:inline="javascript">
    var ctx ="<%=basePath%>";  
   
        var editFlag ="";
        var removeFlag ="";
        var prefix ="<%=basePath%>userInfo";

        $(function() {
            var options = {
                url: prefix + "/list",
                createUrl: prefix + "/add",
                updateUrl: prefix + "/edit/{id}",
                removeUrl: prefix + "/remove",
                exportUrl: prefix + "/export",
                modalName: "用户信息",
                columns: [{
                    checkbox: true
                },
                {
                    field : 'userId', 
                    title : '用户ID',
                    visible: false
                },
                
                {
                    field : 'loginName', 
                    title : '登录账号'
                },
                {
                    field : 'userName', 
                    title : '用户姓名'
                },
                {
                    field : 'userType', 
                    title : '类型' ,
                        formatter: function(value,row,index){
                        	if(value==1){
                        	return "管理员";
                        	}
                        	else if(value==0){
                            	return "普通用户";
                            }
                        	else {
                        	return "";
                        	}
                        }
                },
                {
                    field : 'email', 
                    title : '用户邮箱'
                },
                {
                    field : 'phonenumber', 
                    title : '手机号码'
                },
                {
                    field : 'sex', 
                    title : '性别', 
                    	formatter: function(value,row,index){
                        	if(value==1){
                        	return "女";
                        	}
                        	else if(value==0){
                            	return "男";
                            }
                        	else {
                        	return "";
                        	}
                        }
                },              
                
               
                {
                    field : 'remark', 
                    title : '备注'
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function(value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.operate.edit(\'' + row.userId + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.userId + '\')"><i class="fa fa-remove"></i>删除</a>');
                        return actions.join('');
                    }
                }]
            };
            $.table.init(options);
        });
    </script>
	

</body>

</html>
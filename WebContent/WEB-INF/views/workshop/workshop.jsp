<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.Employee"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <%@ include file="/pages/common/meta.jsp"%>
    <title>车间岗位危害</title>
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
                                <p>名称：</p>
                                <input type="text" name="name"/>
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
                <a class="btn btn-success" onclick="$.operate.add()" >
                    <i class="fa fa-plus"></i> 添加
                </a>
               
                <a class="btn btn-danger multiple disabled" onclick="$.operate.removeAll()" >
                    <i class="fa fa-remove"></i> 删除
                </a>
               
            </div>
            <div class="col-sm-12 select-table table-striped">
                <table id="bootstrap-table"></table>
            </div>
        </div>
    </div>
   
    <script th:inline="javascript">  
    var typeFlag="${type}";
    
        var editFlag="";
        var removeFlag="";
        var prefix ="<%=basePath%>workshop";
        $(function() {
        	//alert(typeFlag);
            var options = {
                url: prefix + "/list?type="+typeFlag,
                createUrl: prefix + "/add?type="+typeFlag,
                updateUrl: prefix + "/edit/{id}",
                removeUrl: prefix + "/remove",
                exportUrl: prefix + "/export",
                modalName: "${modalName}",
                columns: [{
                    checkbox: true
                },
                {
                	field : 'id', 
                    title : '编号',
                    formatter: function(value, row, index) {
                         return index+1;
                    }
                },
                {
                    field : 'name', 
                    title : '名称'
                },
                {
                    field : 'remark', 
                    title : '备注'
                },
                {
                    field : 'type', 
                    title : '类型',
                    formatter: function(value,row,index){
                    	if(value==0){
                    	return "车间";
                    	}
                    	else if(value==1){
                        	return "岗位";
                        }
                    	else if(value==2){
                    		return "危害因素";
                    	
                    	}
                    	else{
                    		return value+"";
                    	}
                    }
                    
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function(value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                        return actions.join('');
                    }
                }]
            };
            $.table.init(options);
        });
    </script>
</body>
</html>
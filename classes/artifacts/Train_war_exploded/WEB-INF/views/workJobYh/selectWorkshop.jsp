<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.Workshop"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" >
<head>
	<%@ include file="/pages/common/meta.jsp"%>
   <title>车间岗位危害</title>
   <%@ include file="/pages/common/comm.jsp"%> 
</head>

<body class="gray-bg">
  
<input id="seWorkshopId"   name="seWorkshopId"    type="hidden" />
	<input id="seWorkshopName" name="seWorkshopName"  type="hidden" />
	
	<div class="container-div">
		<div class="row">
		 <!--
			<div class="col-sm-12 search-collapse">
				<form id="user-form">
				  
					<div class="select-list">
						<ul>
							<li>
								登录名称：<input type="text" name="loginName"/>
							</li>
							<li>
								手机号码：<input type="text" name="phonenumber"/>
							</li>
							<li>
								<a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
							    <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
							</li>
						</ul>
					</div>
					
				</form>
			</div>
	        -->
	        <div class="col-sm-12 select-table table-striped">
			    <table id="bootstrap-table"></table>
			</div>
			<div class="row">
       
    </div>
		</div>
	</div>
	<th:block th:include="include :: footer" />
	<script th:inline="javascript">
		var datas ="";
		  var ctx ="<%=basePath%>" ;
		    var prefix = ctx + "workJobYh";
		    var typeFlag="${type}";
		    var flagId="${typeName}";

		$(function() {
			var options = {
		        url: prefix + "/selectWorkshopList?type="+typeFlag,
		        createUrl: prefix + "/add",
		        updateUrl: prefix + "/edit/{id}",
		        removeUrl: prefix + "/remove",
		        exportUrl: prefix + "/export",
		        importUrl: prefix + "/importData",
		        importTemplateUrl: prefix + "/importTemplate",
		        queryParams: queryParams,
		        sortName: "id",
		        sortOrder: "desc",
		        modalName: "${modalName}",
		        showSearch: false,
		        showRefresh: false,
		        showToggle: false,
		        showColumns: false,
		        clickToSelect: true,		      
		        rememberSelected: true,
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
                    
                }
		        ]
		    };			
		    $.table.init(options);
		});
		
		function queryParams(params) {
			var search = $.table.queryParams(params);
			//search.roleId = $("#roleId").val();
			return search;
		}
		
		
		/* 添加用户-选择用户-提交 */
		function submitHandler() {				
			var rows = $.table.selectFirstColumns();
			var userId = $.table.selectColumns("id");
			var userName = $.table.selectColumns("name");
			if (rows.length == 0) {
       			$.modal.alertWarning("请选择一条记录");
       			return;
       		}
			if (rows.length>1) {
       			$.modal.alertWarning("请选择一条记录");
       			return;
       		}
			//alert(userId+userName);
			//$("#seUserId").val(userId);
			//$("#seUserName").val(userName);
			$.modal.close(); 			
            parent.$('#'+flagId+'id').val(userId);
            parent.$('#'+flagId+'Name').val(userName);
		}
	</script>
</body>
</html>
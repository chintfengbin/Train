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
    <title>员工</title>
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
                                <p>员工ID：</p>
                                <input type="text" name="employeeid"/>
                            </li>
                            <li>
                                <p>员工姓名：</p>
                                <input type="text" name="employeename"/>
                            </li>
                             <li>
                                <p>性别：</p>
                                <select name="ssex" id="ssex">
                                    <option value="">所有</option>
                                    <option value="0">男</option>
                                     <option value="1">女</option>
                                    </select>
                            </li>
                            <li>
                                <p>身份证：</p>
                                <input type="text" name="identitynumber"/>
                            </li>
                            <li>
								<a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
							    <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
							</li>
                           
                        </ul>
                    </div>
                </form>
            </div>		            
           
            <div class="col-sm-12 select-table table-striped">
                <table id="bootstrap-table"></table>
            </div>
        </div>
    </div>
  
    <script th:inline="javascript">
    var ctx ="<%=basePath%>";
        var editFlag="";
        var removeFlag="";
        var prefix ="<%=basePath%>tijian";
        var stateFlag="${state}";
        $(function() {
        	
            var options = {
               url: prefix + "/selectEmpList", 
               queryParams: queryParams,
               modalName: "员工",
                columns: [{
                    checkbox: true
                },
                {
                    field : 'id', 
                    title : '编号',
                    visible: false
                },
                {
                    field : 'employeeid', 
                    title : '员工ID'
                },
                {
                    field : 'employeename', 
                    title : '员工姓名'
                },
                {
                    field : 'entrydateStr', 
                    title : '入岗日期'
                },
                {
                    field : 'physicaldateStr', 
                    title : '体检日期'
                    
                },
                {
                    field : 'ssex', 
                    title : '性别',
                    formatter: function(value,row,index){
                    	if(value==1){
                    	return "女";
                    	}
                    	else if(value==0){
                        	return "男";
                        }
                    	else {
                    	return value+"";
                    	}
                    }
                },
                {
                    field : 'identitynumber', 
                    title : '身份证'
                },
                {
                    field : 'ishazards', 
                    title : '是否签核职业危害告知书'
                },
                {
                    field : 'workshope.deptname',
                    title : '部门'
                },
                {
                    field : 'workshope.workshopname', 
                    title : '车间'
                },
               
                {
                    field : 'workshope.jobname', 
                    title : '岗位名称'
                },
                {
                    field : 'ifMigrant', 
                    title : '是否外来务工人员'
                },
                {
                    field : 'ifDispatch', 
                    title : '是否劳务派遣'
                },
                {
                    field : 'remark', 
                    title : '备注'
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
			var employeeid = $.table.selectColumns("employeeid");
			var employeename = $.table.selectColumns("employeename");
			var identitynumber = $.table.selectColumns("identitynumber");
			
			if (rows.length == 0) {
       			$.modal.alertWarning("请选择一条记录");
       			return;
       		}
			if (rows.length>1) {
       			$.modal.alertWarning("请选择一条记录");
       			return;
       		}
			
			$.modal.close(); 			
            parent.$('#empid').val(userId);
            parent.$('#gonghao').val(employeeid);
            parent.$('#cardno').val(identitynumber);
		}
            
    </script>

    
    
</body>

</html>
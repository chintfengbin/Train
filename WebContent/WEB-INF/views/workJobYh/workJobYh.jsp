<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.WorkJobYh"%>
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
                                <p>车间：</p>                               
                                  <select name="workshopid" id="workshopid" >
                                   <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${wsList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                    </select>
                            </li>
                            <li>
                                <p>岗位：</p>
                                
                                <select name="jobid" id="jobid" >
                                   <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${jobList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach>  
                                    </select>
                            </li>
                            <li>
                                <p>危害因素：</p>                               
                                 <select name="yhid" id="yhid" > 
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${yhList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach>                                    
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
    <th:block th:include="include :: footer" />
    <script th:inline="javascript">
        var editFlag ="";
        var removeFlag ="";       
        var ctx ="<%=basePath%>" ;
        var prefix = ctx + "workJobYh";

        $(function() {
            var options = {
                url: prefix + "/list",
                createUrl: prefix + "/add",
                updateUrl: prefix + "/edit/{id}",
                removeUrl: prefix + "/remove",
                exportUrl: prefix + "/export",
                modalName: "车间岗位危害",
                columns: [{
                    checkbox: true
                },
                {
                    field : 'id', 
                    title : '危害因素',
                    visible: false
                },
                {
                    field : 'workshop.workshopname', 
                    title : '车间'
                },
                {
                    field : 'workshop.jobname', 
                    title : '岗位'
                },
                {
                    field : 'workshop.yhname', 
                    title : '危害因素'
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
                       // actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                        return actions.join('');
                    }
                }]
            };
            $.table.init(options);
        });
        function changeWorkshop() {   
        	$("#jobid option").remove(); 
        	$("#yhid option").remove(); 
        	var workshopId = $("#workshopid").val();
        	if(workshopId!=""){ 
    			 var postData = {    		              
    		                "workshopid" : workshopId,
    		                "typeFlag":"job"
    		          };
    			 
    			$.ajax({
                    type : "POST",
                    dataType:"json",
                    async: false,
                    url : prefix + "/getWorkShopList",
                    data:postData,
                    success : function(data) {
                    	console.log("SUCCESS: ", data);
                    	flag = data.flag;
                    	console.info("1 -- : " + flag);
                    	if(flag=="1"){
                    		var opts=data.opts;                     		
                    		$("#jobid").append(opts);
                    		
                    	}
                    	
                    }
                });
        	}
        }
        function changejob(){     
        	$("#yhid option").remove();
                    	var workshopId = $("#workshopid").val();
                    	var jobId=$("#jobid").val();
                    	if(jobId!=""){    
                    		 
                			 var postData = {    		              
                		                "workshopid" : workshopId,
                		                "jobid":jobId,
                		                "typeFlag":"yh"
                		          };        			 
                			$.ajax({
                                type : "POST",
                                dataType:"json",
                                async: false,
                                url : prefix + "/getWorkShopList",
                                data:postData,
                                success : function(data) {
                                	console.log("SUCCESS: ", data);
                                	flag = data.flag;
                                	console.info("1 -- : " + flag);
                                	if(flag=="1"){
                                		var opts=data.opts;  
                                		//alert(opts);
                                		$("#yhid").append(opts);
                                		
                                	}
                                	
                                }
                            });
                	}

        	
        }
        	
    </script>
</body>
</html>
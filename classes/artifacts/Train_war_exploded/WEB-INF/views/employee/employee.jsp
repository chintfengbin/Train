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
                          
                           
                                 
                            <li class="select-time">
                                <p>入岗日期：</p>
                                <input type="text" class="time-input" id="startTime" placeholder="开始时间" name="params[beginEntrydate]"/>
                                <span>-</span>
                                <input type="text" class="time-input" id="endTime" placeholder="结束时间" name="params[endEntrydate]"/>
                            </li>
                            <li class="select-time">
                                <p>体检日期：</p>
                                <input type="text" class="time-input" id="startTime1" placeholder="开始时间" name="params[beginPhysicaldate]"/>
                                <span>-</span>
                                <input type="text" class="time-input" id="endTime1" placeholder="结束时间" name="params[endPhysicaldate]"/>
                            </li>
                           <!--  
                             <li>
                                <p>员工状态：</p>
                                <select name="state" id="state">
                                    <option value="">所有</option>
                                    <option value="1">在职</option>
                                     <option value="0">离职</option>
                                    </select>
                            </li>
                            -->
                             
                            <li>
                                <p>身份证：</p>
                                <input type="text" name="identitynumber"/>
                            </li>
                             <li>
                                <p>部门：</p>                              
                                  <select name="dept" id="dept" >
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${deptList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                            </li>
                            <li>
                                <p>车间：</p>
                                 <select name="workshop"  >
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${wsList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                            </li>
                            
                            <li>
                                <p style="width:auto;">是否签核职业危害告知书：</p>
                                
                                <select name="ishazards">
                                    <option value="">所有</option>
                                    <option value="Y">已签订</option>
                                     <option value="N">未签订</option>
                                    </select>
                            </li>
                           
                           
                            <li>
                                <p>岗位名称：</p>                               
                                 <select name="postname"  >
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${jobList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                            </li>
                            <li>
                                <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
                                <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
                                  </li>
                                    <li>
                                <a class="btn btn-success btn-rounded btn-sm" onclick="serchTable('0','')">男<i class="fa fa-link"></i>&nbsp;${manNum}</a>
                             
                                 </li>
                                 <li>
                                <a class="btn btn-success btn-rounded btn-sm" onclick="serchTable('1','')">女<i class="fa fa-link"></i>&nbsp;${feNum}</a>
                                   
                                 </li>
                                 <c:if test="${state==1}">
                             <li>
                                <a class="btn btn-success btn-rounded btn-sm" onclick="serchTable('','1')">在职<i class="fa fa-link"></i>&nbsp;${inStateNum}</a>
                               
                                 </li>
                                 </c:if>
                                  <c:if test="${state==0}">
                             <li>
                                <a class="btn btn-success btn-rounded btn-sm" onclick="serchTable('','1')">离职<i class="fa fa-link"></i>&nbsp;${inStateNum}</a>
                               
                                 </li>
                                 </c:if>
                        </ul>
                    </div>
                </form>
            </div>
			            
            <div class="btn-group-sm" id="toolbar" role="group">
               
                <a class="btn btn-success" target="mainframe" href="./employee/add?state=${state}" >
                    <i class="fa fa-plus"></i> 添加
                </a>
              
                <a class="btn btn-danger multiple disabled" onclick="removeAll()" >
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
  
    <script th:inline="javascript">
    var ctx ="<%=basePath%>";
        var editFlag="";
        var removeFlag="";
        var prefix ="<%=basePath%>employee";
        var stateFlag="${state}";
        $(function() {
        	
            var options = {
               url: prefix + "/list?state="+stateFlag,            	
                createUrl: prefix + "/add?state="+stateFlag,               
                updateUrl: prefix + "/edit/{id}",
                  removeUrl: prefix + "/remove",
                  exportUrl: prefix + "/export?state="+stateFlag,
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
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function(value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" target="mainframe" href="./employee/edit/' + row.id +'"><i class="fa fa-edit"></i>编辑</a> ');
                     
                     actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="removeEmployee(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                     actions.push('<a class="ml5 btn btn-success btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="editStateForm(\'' + row.id + '\',\'' + row.state+ '\')"><i class="fa fa-edit"></i>中途异动</a>');
                     
                      return actions.join('');
                    }
                }]
            };
            $.table.init(options);
        });
        
        function removeEmployee(id){
        	table.set();        	
        	$.modal.confirm("确定删除该条" + table.options.modalName + "信息吗？", function() {
                var url = $.common.isEmpty(id) ? table.options.removeUrl : table.options.removeUrl.replace("{id}", id);
                if(table.options.type == table_type.bootstrapTreeTable) {
                	$.operate.get(url);
                } else {
            	    var data = { "ids": id };
            	    $.operate.submit(url, "post", "json", data);
                	
                	closeItemA();
                }
        	});
        }
        function removeAll(){        	
            	table.set();
        		var rows = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
        		if (rows.length == 0) {
        			$.modal.alertWarning("请至少选择一条记录");
        			return;
        		}
        		$.modal.confirm("确认要删除选中的" + rows.length + "条数据吗?", function() {
        			var url = table.options.removeUrl;
        			var data = { "ids": rows.join() };
        			$.operate.submit(url, "post", "json", data);
        			closeItemA();
        		});
           
        }
        
        function closeItemA(){
        	window.location.href ="<%=basePath%>employee?state=${state}";
        	
        }
        function serchTable(sex,state){
        	
        	$.form.reset();
        	if(sex!=""){
        		$("#ssex").val(sex);
        		//$("#state").val("1");
        		
        	}
        	$.table.search();
        	/*if(state!=""){
        		$("#state").val(state);
        		$.table.search();
        	}*/
        }
        function changeState(id,state){
        	table.set();   
        	var currentId="changeState";
        	$("#empId").val(id);
        	$("#empState").val(state);        	
        	var obj=$("#empState");      	
        
        	   $("#empState option").each(function() {
        		
        		    if($(this).val() ==state) {
        		        $(this).attr("selected","selected");
        		    }else {
        		        $(this).removeAttr("selected")
        		        }
        		    });
        	
        	
        	layer.open({
        		type: 5,
        		area: ['400px', '230px'],
        		fix: false,
        		//不固定
        		maxmin: true,
        		shade: 0.3,
        		title: '员工异动',
        		content: $('#' + currentId).html(),
        		success: function(index, layero){
                    // 重新渲染弹层中的下拉选择框select
                    $("#editStateForm").render();
        		},
        		btn: ['<i class="fa fa-check"></i> 确定', '<i class="fa fa-remove"></i> 取消'],
        		// 弹层外区域关闭
        		shadeClose: true,
        		btn1: function(index, layero){
        			var file = layero.find('#file').val();
        			//if (file == '' || (!$.common.endWith(file, '.xls') && !$.common.endWith(file, '.xlsx'))){
        				if (file == ''){        			
        				//$.modal.msgWarning("请选择体检报告");
        				return false;
        			}
        			var index = layer.load(2, {shade: false});
        			$.modal.disable();          			
        			var formData = new FormData();
        			formData.append("id", id);
        			formData.append("state", $("#empState").val());
        			
        			$.ajax({
        				url: "${pageContext.request.contextPath}/employee/editSave",
        				data: formData,
        				//data:postData,
        				//data:$("#editStateForm").serializeArray(),
        				cache: false,
        				contentType: false,
        				processData: false,
        				type: 'POST',
        				success: function (result) {        					
        				//alert(result);
        				//alert(web_status.SUCCESS);
        				//alert(web_status.WARNING);
        					if (result.code == web_status.SUCCESS) {
        						$.modal.closeAll();
        						$.modal.alertSuccess(result.msg);
        						//$.table.refresh();
        						closeItemA();
        					} else if (result.code == web_status.WARNING) {
        						layer.close(index);
        						$.modal.enable();
    	                        $.modal.alertWarning(result.msg)
    	                    } else {
        						layer.close(index);
        						$.modal.enable();
        						$.modal.alertError("系统故障");
        					}
        				}
        			});
        		}
        	});
        }
        	
        	function editStateForm(id,state){ 
				
        		var editStateUrl="<%=basePath%>employee/editState?state="+state+"&id="+id;
        		
                 	table.set();
                 	//$.modal.open("员工中途异动", $.operate.addUrl(id));
                 	$.modal.open("员工中途异动", editStateUrl);
                 
        	}   
            
    </script>

    <div style="display: none;" id="changeState">
    
	<form id="editStateForm" class="mt20 mb10">
		<div class="form-group">    
                <label class="col-sm-3 control-label">员工状态：</label>
                <div class="col-sm-8">					
                     <select name="state" id="empState" class="form-control m-b" >
                 
                                      <option value="1">在职</option>
                                     <option value="0">离职</option>
                                     <option value="2">调入</option>
                                     <option value="3">调出</option>
                                     
                   </select>
                    </div>
            </div> 
		
	</form>

    </div>
    
</body>
 <!--  
<script id="changeState" type="text/template">
<form id="editStateForm" class="mt20 mb10">
	
		<div class="form-group">    
                <label class="col-sm-3 control-label">员工状态：</label>
                <div class="col-sm-8">
					 <input name="id"  id="empId" type="hidden">
            <input   id="empIdt" type="hidden" value="10">
           
                     <select name="state" id="empState" class="form-control m-b" >
                 
                                      <option value="1">在职</option>
                                     <option value="0">离职</option>
                                     <option value="2">调入</option>
                                     <option value="3">调出</option>
                                     
                   </select>
                    </div>
            </div> 
		
	
</form>
</script>
-->
</html>
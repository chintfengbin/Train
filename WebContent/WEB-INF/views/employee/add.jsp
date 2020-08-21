<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.Employee"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org" >
<head>
   <%@ include file="/pages/common/meta.jsp"%>
   <title>员工</title>
   <%@ include file="/pages/common/comm.jsp"%>
   </head>
<body class="white-bg">
    <div class="wrapper wrapper-content animated fadeInRight ibox-content">
        <form class="form-horizontal m" id="form-employee-add">
            <div class="form-group">    
                <label class="col-sm-3 control-label">工号：</label>
                <div class="col-sm-8">
                    <input name="employeeid" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">员工姓名：</label>
                <div class="col-sm-8">
                    <input name="employeename" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">性别：</label>
                <div class="col-sm-8">
                    <select name="ssex" class="form-control m-b">
                         <option value="">所有</option>
                                    <option value="0">男</option>
                                     <option value="1">女</option>
                                   
                    </select>
                      </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">
身份证：</label>
                <div class="col-sm-8">
                    <input name="identitynumber" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">入岗日期：</label>
                <div class="col-sm-8">
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="entrydate" class="form-control" placeholder="yyyy-MM-dd" type="text">
                    </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检日期：</label>
                <div class="col-sm-8">
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="physicaldate" class="form-control" placeholder="yyyy-MM-dd" type="text">
                    </div>
                </div>
            </div>
            
            <div class="form-group">    
                <label class="col-sm-3 control-label">是否签核职业危害告知书：</label>
                <div class="col-sm-8">
                  <select name="ishazards" class="form-control m-b">
                 <option value="">不确定</option>
                                    <option value="Y">已签订</option>
                                     <option value="N">未签订</option>
                   </select>
                   </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">部门：</label>
                <div class="col-sm-8">
                    <select name="dept" id="dept" class="form-control m-b">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${deptList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">车间：</label>
                <div class="col-sm-8">                    
                <select name="workshop"  class="form-control m-b">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${wsList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">岗位名称：</label>
                <div class="col-sm-8">
                    <select name="postname"  class="form-control m-b">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${jobList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                </div>
            </div>
             <div class="form-group">    
                <label class="col-sm-3 control-label">是否外来务工人员：</label>
                <div class="col-sm-8">
                    <input name="ifMigrant" class="form-control" type="text">
                </div>
            </div>  
	    <div class="form-group">    
                <label class="col-sm-3 control-label">是否劳务派遣：</label>
                <div class="col-sm-8">
                    <input name="ifDispatch" class="form-control" type="text">
                </div>
            </div>  
             <div class="form-group">    
                <label class="col-sm-3 control-label">员工状态：</label>
                <div class="col-sm-8">
                     <select name="state" class="form-control m-b">
                 
                                    <option value="1">在职</option>
                                     <option value="0">离职</option>
                                     <option value="2">调入</option>
                                     <option value="3">调出</option>
                                     
                   </select>
                    </div>
            </div>  
             <div class="form-group">    
                <label class="col-sm-3 control-label">备注：</label>
                <div class="col-sm-8">
                    <input name="remark" class="form-control" type="text">
                </div>
            </div>
        </form>
    </div>
     <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="submitHandler()" ><i class="fa fa-check"></i>保 存</button>&nbsp;
            <button type="button" class="btn btn-sm btn-danger" onclick="closeItemA()"><i class="fa fa-reply-all"></i>关 闭 </button>
        </div>
    </div>
     <script type="text/javascript">
     var ctx ="<%=basePath%>" ;
        var prefix = ctx + "employee"
      /*  $("#form-employee-add").validate({
            focusCleanup: true
        });*/

        function submitHandler() {
          /*  if ($.validate.form()) {
                $.operate.save(prefix + "/add", $('#form-employee-add').serialize());
            }*/
        	$.ajax({
                type : "POST",
                dataType:"json",
                async: false,
                url : "${pageContext.request.contextPath}/employee/save",
                data:$("#form-employee-add").serialize(),
                success : function(data) {
                	console.log("SUCCESS: ", data);
                	flag = data.flag;
                	console.info("1 -- : " + flag);
                	if(flag=="1"){                		
                		closeItemA();
                		
                	}
                	
                }
            });
        }
        function closeItemA(){
        	window.location.href ="<%=basePath%>employee?state=${state}";
        	
        }

        $("input[name='entrydate']").datetimepicker({
            format: "yyyy-mm-dd",
            minView: "month",
            autoclose: true
        });

        $("input[name='physicaldate']").datetimepicker({
            format: "yyyy-mm-dd",
            minView: "month",
            autoclose: true
        });
    </script>
</body>
</html>
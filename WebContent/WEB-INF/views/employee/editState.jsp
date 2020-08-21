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
        <form class="form-horizontal m" id="form-employee-edit" th:object="${employee}">
            <input name="id"  value="${employee.id}"   type="hidden">
          
             
             <div class="form-group">    
                <label class="col-sm-3 control-label">员工状态：</label>
                <div class="col-sm-8">
                     <select name="state" value="${employee.state}" class="form-control m-b" id="state">
                 
                                    <option value="1" <c:if test="${employee.state==1}"> selected</c:if>>在职</option>
                                     <option value="0" <c:if test="${employee.state==0}"> selected</c:if>>离职</option>
                   <option value="2" <c:if test="${employee.state==2}"> selected</c:if>>调入</option>
                                     <option value="3" <c:if test="${employee.state==3}"> selected</c:if>>调出</option>
                  
                   </select>
                    </div>
            </div> 
            
        </form>
    </div>
     <!-- 
      <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="submitHandler()" ><i class="fa fa-check"></i>保 存</button>&nbsp;
            <button type="button" class="btn btn-sm btn-danger" onclick="closeItemA()"><i class="fa fa-reply-all"></i>关 闭 </button>
        </div>
    </div>
     -->
     <th:block th:include="include :: footer" />
    <script type="text/javascript">
    var ctx ="<%=basePath%>" ;
    var prefix = ctx + "employee"
       
       /* $("#form-employee-edit").validate({
            focusCleanup: true
        });*/
        function closeItemA(){
        	var state=$("#state").val();
        	window.location.href ="<%=basePath%>employee?state="+state;
        	
        }

        function submitHandler() {        	
           
                $.operate.save(prefix + "/editSaveState", $('#form-employee-edit').serialize());
          
        }
    </script>
</body>
</html>
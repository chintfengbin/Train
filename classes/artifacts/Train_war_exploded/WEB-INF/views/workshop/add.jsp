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
<body class="white-bg">
    <div class="wrapper wrapper-content animated fadeInRight ibox-content">
        <form class="form-horizontal m" id="form-workshop-add">
            <div class="form-group">    
                <label class="col-sm-3 control-label">${modalName1}名称：</label>
                <div class="col-sm-8">
                    <input name="name" class="form-control" type="text">
                     <input name="type" value="${type}" type="hidden">
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
   
   <th:block th:include="include :: footer" />
    <script type="text/javascript">
    var ctx ="<%=basePath%>" ;
    var prefix = ctx + "/workshop"
   
      function submitHandler() {
    	  $.operate.save(prefix + "/save", $('#form-workshop-add').serialize());
          
        /*  if ($.validate.form()) {
              $.operate.save(prefix + "/add", $('#form-workshop-add').serialize());
          }*/
      }
      function closeItemA(){
      	window.location.href ="<%=basePath%>workshop";
      	
      }
    </script>
</body>
</html>
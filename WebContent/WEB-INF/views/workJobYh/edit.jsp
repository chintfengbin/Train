<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.WorkJobYh"%>
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
        <form class="form-horizontal m" id="form-yh-edit" th:object="${workJobYh}">
            <input name="id" value="${workJobYh.id}" type="hidden">
            <div class="form-group">    
                <label class="col-sm-3 control-label">车间：</label>
                <div class="col-sm-8">
                    <input name="workshopid" value="${workJobYh.workshopid}" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">岗位：</label>
                <div class="col-sm-8">
                    <input name="jobid" value="${workJobYh.jobid}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">危害因素：</label>
                <div class="col-sm-8">
                    <input name="yhid" value="${workJobYh.yhid}"  class="form-control" type="text">
                </div>
            </div>
        </form>
    </div>
    <th:block th:include="include :: footer" />
    <script type="text/javascript">
    var ctx ="<%=basePath%>" ;
    var prefix = ctx + "/workshop"
       
      /*  $("#form-yh-edit").validate({
            focusCleanup: true
        });*/

        function submitHandler() {
        	 $.operate.save(prefix + "/edit", $('#form-yh-edit').serialize());
             
           /* if ($.validate.form()) {
                $.operate.save(prefix + "/edit", $('#form-yh-edit').serialize());
            }*/
        }
    </script>
</body>
</html>
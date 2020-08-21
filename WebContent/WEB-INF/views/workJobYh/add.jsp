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
        <form class="form-horizontal m" id="form-yh-add">
            <div class="form-group">    
                <label class="col-sm-3 control-label">车间：</label>
                <div class="col-sm-8">
                   
                  <div class="input-group">
				      <input class="form-control" type="text"  id="workshopName"  readonly="true" >
				    <input id="workshopid"   name="workshopid"    type="hidden" />
				        <span class="input-group-addon" onclick="selectWorkshop(0,'车间')"><i class="fa fa-search"></i></span>
                   </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">岗位：</label>
                <div class="col-sm-8">                   
                   <div class="input-group">
				      <input class="form-control" type="text"  id="jobName"  readonly="true" >
				    <input id="jobid"   name="jobid"    type="hidden" />
				        <span class="input-group-addon" onclick="selectWorkshop(1,'岗位')"><i class="fa fa-search"></i></span>
                   </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">危害因素：</label>
                <div class="col-sm-8">                    
                 <div class="input-group">
				      <input class="form-control" type="text"  id="yhName"  readonly="true" >
				    <input id="yhid"   name="yhid"    type="hidden" />
				        <span class="input-group-addon" onclick="selectWorkshop(2,'危险因素')"><i class="fa fa-search"></i></span>
                   </div>
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
    var prefix = ctx + "workJobYh";
       /* $("#form-yh-add").validate({
            focusCleanup: true
        });*/

        function submitHandler() {
           /* if ($.validate.form()) {
                $.operate.save(prefix + "/add", $('#form-yh-add').serialize());
            }*/
        	$.operate.save(prefix + "/save", $('#form-yh-add').serialize());
            
        }
        
        function selectWorkshop(workshopType,workshopName) {          	
			var url = prefix + '/selectWorkshop?type='+workshopType;
		    //$.modal.open("选择用户", url);
		    var options = {
				title: workshopName+'选择',
				//width: "380",
				url: url,
				callBack: doSubmit
			};
		    $.modal.open("选择"+workshopName, url);
			
		}
        function doSubmit(index, layero){
			var body = layer.getChildFrame('body', index);
   			
   			layer.close(index);
		}
    </script>
</body>
</html>
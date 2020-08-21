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
                <label class="col-sm-3 control-label">员工ID：</label>
                <div class="col-sm-8">
                    <input name="employeeid" value="${employee.employeeid}"   class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">员工姓名：</label>
                <div class="col-sm-8">
                    <input name="employeename" value="${employee.employeename}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">入岗日期：</label>
                <div class="col-sm-8">
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="entrydate" value="<fmt:formatDate value="${employee.entrydate}" pattern="yyyy-MM-dd" />"  class="form-control"  type="text">
                    </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检日期：</label>
                <div class="col-sm-8">
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="physicaldate" value="<fmt:formatDate value="${employee.physicaldate}" pattern="yyyy-MM-dd" />"   class="form-control" placeholder="yyyy-MM-dd" type="text">
                    </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">性别：</label>
                <div class="col-sm-8">
                    <select name="ssex" value="${employee.ssex}" class="form-control m-b">
                        <option value="">所有</option>
                         <option value="0"   
                         <c:if test="${employee.ssex==0}"> selected</c:if>>男</option>
                                     <option value="1" <c:if test="${employee.ssex==1}"> selected</c:if>>女</option>
                                   
                    </select>
                   </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">
身份证信息：</label>
                <div class="col-sm-8">
                    <input name="identitynumber" value="${employee.identitynumber}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">是否签核职业危害告知书：</label>
                <div class="col-sm-8">
                    <select name="ishazards" value="${employee.ishazards}"  class="form-control" type="text">
                <option value="">不确定</option>
                                    <option value="Y" <c:if test="${employee.ishazards==Y}"> selected</c:if>>已签订</option>
                                     <option value="N" <c:if test="${employee.ishazards==N}"> selected</c:if>>未签订</option>
                 </select>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">部门：</label>
                <div class="col-sm-8">
                   
                     <select name="dept" id="dept"  value="${employee.dept}" class="form-control">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${deptList}">
                                    <option value="${workshop.id}"
                                    <c:if test="${workshop.id==employee.dept}">
                                   selected
                                    </c:if>
                                    
                                    >${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">车间：</label>
                <div class="col-sm-8">
                     <select name="workshop" id="workshop"  value="${employee.workshop}" class="form-control">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${wsList}">
                                    <option value="${workshop.id}"
                                    <c:if test="${workshop.id==employee.workshop}">
                                   selected
                                    </c:if>
                                    
                                    >${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">岗位名称：</label>
                <div class="col-sm-8">
                    <select name="postname" id="postname"  value="${employee.workshop}" class="form-control">
                                 <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${jobList}">
                                    <option value="${workshop.id}"
                                    <c:if test="${workshop.id==employee.postname}">
                                   selected
                                    </c:if>
                                    
                                    >${workshop.name}</option>
                                     </c:forEach> 
                                     </select>
                
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">是否外来务工人员：</label>
                <div class="col-sm-8">
                    <input name="ifMigrant" value="${employee.ifMigrant}" class="form-control" type="text">
                </div>
            </div>  
	    <div class="form-group">    
                <label class="col-sm-3 control-label">是否劳务派遣：</label>
                <div class="col-sm-8">
                    <input name="ifDispatch" value="${employee.ifDispatch}" class="form-control" type="text">
                </div>
            </div>  
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
              <div class="form-group">    
                <label class="col-sm-3 control-label">备注：</label>
                <div class="col-sm-8">
                    <input name="remark" value="${employee.remark}" class="form-control" type="text">
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
       
       /* $("#form-employee-edit").validate({
            focusCleanup: true
        });*/
        function closeItemA(){
        	var state=$("#state").val();
        	window.location.href ="<%=basePath%>employee?state="+state;
        	
        }

        function submitHandler() {
          /*  if ($.validate.form()) {
                $.operate.save(prefix + "/edit", $('#form-employee-edit').serialize());
            }*/
        	 $.ajax({
                 type : "POST",
                 dataType:"json",
                 async: false,
                 url : "${pageContext.request.contextPath}/employee/editSave",
                 data:$("#form-employee-edit").serialize(),
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
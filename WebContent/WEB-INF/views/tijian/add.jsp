<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 

<%@ include file="/pages/common/taglibs.jsp"%>
<%@page import="com.EHC.model.Tijian"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" >
<head>
   <%@ include file="/pages/common/meta.jsp"%>
   <title>体检</title>
    
   <%@ include file="/pages/common/comm.jsp"%>
   
</head>
<body class="white-bg">
    <div class="wrapper wrapper-content animated fadeInRight ibox-content">
        <form class="form-horizontal m" id="form-tijian-add" method="post" action="<%=basePath%>tijian/save">
            <div class="form-group">    
                <label class="col-sm-3 control-label">工号：</label>
                <div class="col-sm-8">
                <div class="input-group">
                    <input name="gonghao" class="form-control" id="gonghao"  type="text" readonly="true">                   
				     <input id="empid"   name="empid"    type="hidden" />
				    
				        <span class="input-group-addon" onclick="selectEmp()"><i class="fa fa-search"></i></span>
                   
                   </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">身份证号：</label>
                <div class="col-sm-8">
                    <input name="cardno" id="cardno" class="form-control" type="text" readonly="true">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检日期：</label>
                <div class="col-sm-8">
                     <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="tjdate" class="form-control" placeholder="yyyy-MM-dd" type="text">
                    </div>
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检项目：</label>
                <div class="col-sm-8">                    
                    <!--  
                    <select  name="yixm" id="yixm" class="form-control">
                                   <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${yhList}">
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                    </select>
                                    -->
                                <c:forEach var="workshop"  items="${yhList}">
							   <label class="check-box">								
								<input name="yixm" type="checkbox" value="${workshop.id}" >
								${workshop.name}
							</label>
							 </c:forEach> 
						 </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检类型：</label>
                <div class="col-sm-8">
                    <select name="yitype" class="form-control m-b">
                        <option value="">所有</option>                                    
                                    <option value="0">岗前</option>
                                     <option value="1">在岗</option>
                                     <option value="2">离岗</option>                                   
                    </select>
                    </div>
            </div>
             <div class="form-group">    
                <label class="col-sm-3 control-label">体检时所在的单位：</label>
                <div class="col-sm-8">
                    <input name="tjdw" class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检结论：</label>
                <div class="col-sm-8">                    
                <select name="tjresult" class="form-control">
                                    <option value="">所有</option>
                                    <option value="0">目前未见异常</option>
                                     <option value="1">其他疾病或异常</option>
                                     <option value="2">复查</option>
                                     <option value="3">疑似职业病</option>
                                    <option value="4">职业病</option>
                                    <option value="5">其他</option>
                                    
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
        /*var prefix = ctx + "s4hc/tijian"
        $("#form-tijian-add").validate({
            focusCleanup: true
        });*/
        var prefix ="<%=basePath%>tijian";
       
        function closeItemA(){
        	window.location.href ="<%=basePath%>tijian";
        	
        }

        function submitHandler() {
        	$.ajax({
                type : "POST",
                dataType:"json",
                async: false,
                url : "${pageContext.request.contextPath}/tijian/save",
                data:$("#form-tijian-add").serialize(),
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
        $("input[name='tjdate']").datetimepicker({
            format: "yyyy-mm-dd",
            minView: "month",
            autoclose: true
        });
        function selectEmp() {          	
			var url = prefix + '/selectEmp';
		    //$.modal.open("选择用户", url);
		    var options = {
				title: '员工选择',
				//width: "380",
				url: url,
				callBack: doSubmit
			};
		    $.modal.open("选择员工", url);
			
		}
        function doSubmit(index, layero){
			var body = layer.getChildFrame('body', index);
   			
   			layer.close(index);
		}
       
    </script>
</body>
</html>
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
        <form class="form-horizontal m" id="form-tijian-edit" >
            <input name="id" value="${tijian.id}"  type="hidden">
            <div class="form-group">    
                <label class="col-sm-3 control-label">工号：</label>
                <div class="col-sm-8">
                 <div class="input-group">
                    <input name="gonghao" class="form-control" id="gonghao"  value="${tijian.gonghao}" type="text" readonly="true">                   
				     <input id="empid"   name="empid"    type="hidden" />
				    
				        <span class="input-group-addon" onclick="selectEmp()"><i class="fa fa-search"></i></span>
                   
                   </div>
                   <!--  
                    <input name="gonghao" value="${tijian.gonghao}" class="form-control" type="text">
                -->
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">身份证号：</label>
                <div class="col-sm-8">
                    <input name="cardno" value="${tijian.cardno}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检日期：</label>
                <div class="col-sm-8">
                     <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input name="tjdate" value="<fmt:formatDate value="${tijian.tjdate}" pattern="yyyy-MM-dd" />"  class="form-control"  type="text">
                    </div>
               
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检项目：</label>
                <div class="col-sm-8">  
                <c:forEach var="workshop"  items="${yhList}">
							   <label class="check-box">								
								<input name="yixm" type="checkbox" value="${workshop.id}"  <c:if test="${workshop.flag==true}"> checked="checked"</c:if>>
								${workshop.name}
							</label>
							 </c:forEach> 
							
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检时所在的单位：</label>
                <div class="col-sm-8">
                    <input name="tjdw" value="${tijian.tjdw}"  class="form-control" type="text">
                </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检类型：</label>
                <div class="col-sm-8">
                    <select name="yitype" value="${tijian.yitype}" class="form-control m-b">
                        <option value="">所有</option>
                                    <option value="0" <c:if test="${tijian.yitype==0}"> selected </c:if>>岗前</option>
                                       
                                     <option value="1" <c:if test="${tijian.yitype==1}"> selected </c:if>>在岗</option>
                                     <option value="2" <c:if test="${tijian.yitype==2}"> selected </c:if>>离岗</option>                                   
                 
                    </select>
                     </div>
            </div>
            <div class="form-group">    
                <label class="col-sm-3 control-label">体检结论：</label>
                <div class="col-sm-8">
                     <select name="tjresult" class="form-control" value="${tijian.tjresult}">
                                    <option value="">所有</option>
                                    <option value="0"  <c:if test="${tijian.tjresult==0}"> selected</c:if>>目前未见异常</option>
                                     <option value="1" <c:if test="${tijian.tjresult==1}"> selected</c:if>>其他疾病或异常</option>
                                     <option value="2" <c:if test="${tijian.tjresult==2}"> selected</c:if>>复查</option>
                                     <option value="3" <c:if test="${tijian.tjresult==3}"> selected</c:if>>疑似职业病</option>
                                    <option value="4" <c:if test="${tijian.tjresult==4}"> selected</c:if>>职业病</option>
                                    <option value="5" <c:if test="${tijian.tjresult==5}"> selected</c:if>>其他</option>                                    
                                    </select>
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
        var prefix ="<%=basePath%>tijian";
        
        function closeItemA(){
        	window.location.href ="<%=basePath%>tijian";
        	
        }
      

        function submitHandler() {
           /* if ($.validate.form()) {
                $.operate.save(prefix + "/edit", $('#form-tijian-edit').serialize());
            }*/
            $.ajax({
                type : "POST",
                dataType:"json",
                async: false,
                url : "${pageContext.request.contextPath}/tijian/editSave",
                data:$("#form-tijian-edit").serialize(),
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
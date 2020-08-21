<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh"  >
<head>
   <!--  
    <link rel="stylesheet" href="<%=basePath%>assets/css/layui.css">
    -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
	<link href="<%=basePath%>css/jquery.contextMenu.min.css" rel="stylesheet"/>
	
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"/>
	<!-- bootstrap-table 表格插件样式 -->
	<link href="<%=basePath%>ajax/libs/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"/>
	
	
	<link href="<%=basePath%>css/animate.css" rel="stylesheet"/>
	<link href="<%=basePath%>css/style.css" rel="stylesheet"/>
	<link href="<%=basePath%>css/skins.css" rel="stylesheet"/>
	<link href="<%=basePath%>ajax/libs/datapicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
     
	<link href="<%=basePath%>ruoyi/css/ry-ui.css" rel="stylesheet"/>
    
    <script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
    
    <script src="<%=basePath%>assets/layui.all.js" type="text/javascript"  ></script>
  
   <script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/comm.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/common.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/jquery.contextMenu.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/bootstrap-table.min.js" type="text/javascript"></script>
     <script src="<%=basePath%>js/cert.js" type="text/javascript"></script>
    <script src="<%=basePath%>ajax/libs/blockUI/jquery.blockUI.js"" type="text/javascript"></script>
    <script src="<%=basePath%>/ajax/libs/datapicker/bootstrap-datetimepicker.min.js"></script>
    <%@ include file="/pages/common/meta.jsp"%>
    <title>体检</title>
   <%@ include file="/pages/common/comm.jsp"%>
</head>
<!--  
//当前页没有tab标签，在当前页加入tab标签，只显示当前页的标签，iframe
-->
<body class="gray-bg">
 <div class="row content-tabs">
            <button class="roll-nav roll-left tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs menuTabs">
               <div class="page-tabs-content" style="margin-left: 0px;">
                  
                <a href="javascript:;" class="menuTab active" data-id="/system/user">体检管理 <i class="fa fa-times-circle"></i></a></div>
           
            </nav>
            <button class="roll-nav roll-right tabRight">
                <i class="fa fa-forward"></i>
            </button>
             </div>
     <div class="container-div">
        <div class="row">
            <div class="col-sm-12 search-collapse">
                <form id="formId">
                    <div class="select-list">
                        <ul>
                            <li>
                                <p>工号：</p>
                                <input type="text" name="gonghao"/>
                            </li>
                            <li>
                                <p>身份证号：</p>
                                <input type="text" name="cardno"/>
                            </li>
                            <li>
                              
                             <li class="select-time">
                                <p>体检日期：</p>
                                <input type="text" class="time-input" id="startTime" placeholder="开始时间" name="params[beginTjdate]"/>
                                <span>-</span>
                                <input type="text" class="time-input" id="endTime" placeholder="结束时间" name="params[endTjdate]"/>
                            </li>
                            </li>
                            <li>
                                <p>体检项目：</p>      
                                                        
                                 <select name="yixm" id="yixm" >
                                   <option value="">所有</option>
                                    <c:forEach var="workshop"  items="${yhList}">
                                  
                                    <option value="${workshop.id}">${workshop.name}</option>
                                     </c:forEach> 
                                    </select>
                            </li>
                            <li>
                                <p>体检类型：</p>                              
                                 <select name="yitype">
                                    <option value="">所有</option>
                                    <option value="0">岗前</option>
                                     <option value="1">在岗</option>
                                     <option value="2">离岗</option>
                                    </select>
                               
                            </li>
                            <li>
                                <p>体检结论：</p>                               
                                 <select name="tjresult">
                                    <option value="">所有</option>
                                    <option value="0">目前未见异常</option>
                                     <option value="1">其他疾病或异常</option>
                                     <option value="2">复查</option>
                                     <option value="3">疑似职业病</option>
                                    <option value="4">职业病</option>
                                    <option value="5">其他</option>
                                    
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
                <a class="btn btn-success" target="mainframe" href="./tijian/add">
                    <i class="fa fa-plus"></i> 添加
                </a>
              
                <a class="btn btn-danger multiple disabled"   onclick="$.operate.removeAll()">
                    <i class="fa fa-remove"></i> 删除
                </a>
                <a class="btn btn-warning" onclick="$.table.exportExcel()">
                    <i class="fa fa-download"></i> 导出
                 </a>
            </div>
            <div class="col-sm-12 select-table table-striped">
                <table id="bootstrap-table"></table>
            </div>
        </div>
    </div>
    
    <script th:inline="javascript">
    var ctx ="<%=basePath%>" ;
        var editFlag ="";
        var removeFlag ="";
        var prefix ="<%=basePath%>tijian";
      
        
        $(function() {
        	queryUserList();
        });
        
        function queryUserList() {
        	 var options = {
                     url: prefix + "/list",
                     createUrl: prefix + "/add",
                     updateUrl: prefix + "/edit/{id}",
                     removeUrl: prefix + "/remove",
                     exportUrl: prefix + "/export",
                     modalName: "体检",
                     columns: [{
                         checkbox: true
                     },
                     {
                         field : 'id', 
                         title : '编号',
                         visible: false
                     },
                     {
                         field : 'employee.employeeid', 
                         title : '工号'
                     },
                     {
                         field : 'employee.identitynumber', 
                         title : '身份证号'
                     },
                     {
                         field : 'tjdateStr', 
                         title : '体检日期'
                     },
                     {
                         field : 'yhNames', 
                         title : '体检项目'
                     },
                     {
                         field : 'tjdw', 
                         title : '体检单位'
                     },
                     {
                         field : 'yitype', 
                         title : '体检类型',
                         formatter: function(value,row,index){
                         	if(value==1){
                         	return "在岗";
                         	}
                         	else if(value==2){
                             	return "离岗";
                             }
                         	else if(value==0){
                             	return "岗前";
                             }
                         	else {
                         	return value+"";
                         	}
                         }
                     },
                     {
                         field : 'tjresult', 
                         title : '体检结果',
                         formatter: function(value,row,index){
                          	if(value==0){
                          	return "目前未见异常";
                          	}
                          	else if(value==1){
                              	return "其他疾病或异常";
                              }
                          	else if(value==2){
                              	return "复查";
                              }
                              else if(value==3){
                              	return "疑似职业病";
                              }
                              else if(value==4){
                              	return "职业病";
                              }
                              else if(value==5){
                                	return "其他";
                                }
                          	else {
                          	return value+"";
                          	}
                          }
                     },
                     {
                    	 field: 'reportPathStr',
                         title : '体检报告',
                         formatter: function(value, row, index) {
                        	// return '<a href="javascript:void(0)" onclick="detail(\'' + row.dictId + '\')">体检报告</a>';
                        	//value体检报告地址
                        	if(value==null){
                        		return '';
                        	}
                        	else{
                             return '<a href="' +value + '" target="_blank" >体检报告</a>';
                        	}
                         }
                     },
                     {
                         field : 'remark', 
                         title : '其他信息'
                     },
                     {
                         title: '操作',
                         align: 'center',
                         formatter: function(value, row, index) {
                             var actions = [];
                           actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" target="mainframe" href="./tijian/edit/' + row.id +'"><i class="fa fa-edit"></i>编辑</a> ');
                               
                           actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                          // actions.push('<a class="ml5 btn btn-info btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.table.importExcel(\'' + row.id + '\')"><i class="fa fa-upload"></i>上传体检报告</a>');
                           actions.push('<a class="ml5 btn btn-info btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="importReport(\'' + row.id + '\')"><i class="fa fa-upload"></i>上传体检报告</a>');

                           return actions.join('');
                         }
                     }]
                 };
                 $.table.init(options);
		}
        
        function changeFrameSrc(title, url){
        	//alert("aaaaaaaaa");
        	$("#conFrame").src=url;
        }
        
        function importReport(numId,formId){
        	table.set();        	
        	var currentId = $.common.isEmpty(formId) ? 'importTpl' : formId;
        	layer.open({
        		type: 1,
        		area: ['400px', '230px'],
        		fix: false,
        		//不固定
        		maxmin: true,
        		shade: 0.3,
        		title: '导入' + table.options.modalName + '数据',
        		content: $('#' + currentId).html(),
        		btn: ['<i class="fa fa-check"></i> 导入', '<i class="fa fa-remove"></i> 取消'],
        		// 弹层外区域关闭
        		shadeClose: true,
        		btn1: function(index, layero){
        			var file = layero.find('#file').val();
        			//if (file == '' || (!$.common.endWith(file, '.xls') && !$.common.endWith(file, '.xlsx'))){
        				if (file == ''){        			
        				$.modal.msgWarning("请选择体检报告");
        				return false;
        			}
        			var index = layer.load(2, {shade: false});
        			$.modal.disable();
        			var formData = new FormData();
        			formData.append("file", $('#file')[0].files[0]);
        			formData.append("tianjianId", numId);
        			//var img = document.form.file.files[0];
        			//var a1= $('#file')[0].files[0];
        			//formData.append("reportFile", a1);
        			//formData.append("ccc", "sss");
        			
        			//alert(a1);
        			//formData.append("updateSupport", $("input[name='updateSupport']").is(':checked'));
        			//alert(table.options.importUrl);
        			$.ajax({
        				url: "${pageContext.request.contextPath}/tijian/uploadReport",
        				data: formData,
        				//data:$("#uploadForm").serialize(),
        				cache: false,
        				contentType: false,
        				processData: false,
        				type: 'POST',
        				success: function (result) {
        					if (result.code == web_status.SUCCESS) {
        						$.modal.closeAll();
        						$.modal.alertSuccess(result.msg);
        						$.table.refresh();
        					} else if (result.code == web_status.WARNING) {
        						layer.close(index);
        						$.modal.enable();
    	                        $.modal.alertWarning(result.msg)
    	                    } else {
        						layer.close(index);
        						$.modal.enable();
        						$.modal.alertError(result.msg);
        					}
        				}
        			});
        		}
        	});
        }
        
    </script>
</body>
<script id="importTpl" type="text/template">
<form id="uploadForm" enctype=“multipart/form-data” class="mt20 mb10">
	<div class="col-xs-offset-1">
		<input type="file" id="file" name="file"/>
		<input type="hidden" id="tijianId"/>
		
	</div>
</form>
</script>
</html>
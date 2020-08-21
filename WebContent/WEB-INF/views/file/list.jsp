<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.ssm.model.FileInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<c:set var="titleName" value="文件管理"/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<c:set var="imgSort" value="CN"/>

<html>
<head>
	<%@ include file="/pages/common/meta.jsp"%>
	<title>证书管理</title>
		<script type="text/javascript">
		
		window.base="<%=basePath%>";
		
		
	</script>
	
	<link rel="stylesheet" href="<%=basePath%>css/default.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath%>css/index.css" type="text/css">
	
	<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath%>css/blue.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css">
<script src="<%=basePath%>js/jquery/jquery-1.4.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/user/user.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/user/table.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/user/form.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/user/util.js" type="text/javascript"></script>
	
<style>

		.otable th {
			background-color: #169ada;
		}
		th div {
        position: relative;
       
        line-height: 18px;
       padding: 8px;
        color: #fff;
        text-align: left;
        white-space: nowrap;
        overflow: hidden;
    }
    .foottd{
    	font-size:14pt;
    }
    .foottd a{
    	font-size:14pt;
    }
    .btn-info, .btn-primary {
    background-color: #ff7100;
    
   }
 
   input[type="text"]{
   	height: 28px;
   }
    
		
	</style>
</head>

<body>
<div class="main-inner clearfix" style="min-height:232px;">

<%@ include file="/pages/common/top.jsp"%>
<table width="100%"  align="center" class="searchbg" cellpadding="1" cellspacing="0" >
	<tr>
		<td align="center" height="8" colspan="6"></td>
	</tr>
	<tr>
	<form id="mainForm" action="<%=basePath%>certificate/list" method="post">
		<td width="100" align="right">证书编号：</td>
		<td width="120" align="left"><input type="text" name="filter_EQS_username" id="filter_EQS_username" value="${param['filter_EQS_username']}" class="search_input"/></td>
		<td width="100" align="right">姓名：</td>
		<td width="120" align="left"><input type="text" name="filter_LIKES_uname" id="filter_LIKES_uname" value="${param['"filter_LIKES_uname"']}" class="search_input"/></td>
		
		<td>
			<!-- 查询按钮 -->
			&nbsp;
			<button type="button"  class="btn btn-info"   name="search"  onclick="form_onSearch()">查询</button>
						
		</td>
	</tr>
</table>


<br/>
<!-- 操作按钮 start -->
			<table width=100%  border="0" align="center" cellpadding="0"cellspacing="0">
				<tr>
					<td height="37" align="left" valign="middle" class="listbiaotifont"
						background="<%=basePath%>images/portal/main/menu_bg.gif">
						&nbsp;
						<button type="button"  class="btn btn-info" onclick="form_onInput('certificate')" >新增证书</button>
						
							<button type="button"  class="btn btn-info" onclick="form_onModify('ckb', 'certificate')" >修改证书</button>
						
						
						<button type="button"  class="btn btn-info" onclick="form_onDelete('ckb', 'certificate')" >删除</button>
						
						
						
					</td>
				</tr>
			</table>
 			<!-- 操作按钮 end -->

			
 			
 			<!-- 主内容 start -->
			<table width="99%"   class="otable-hover otable-striped otable-bordered otable" >
				<tr class="table_tr_bg" >
				    <th class="ckcol center" style="width:54px;">
				    <div>
						<input type="checkbox" style="height: 15" id="chkall"
							onclick="checkAll('ckb')" title="全选" class="checkboxs" />
					</div>
					</th>
					<th class="cmd center" style="width: 30px"><div>序号</div></th>
					<th class="cmd center"><div>文件名</div></th>
					
					
					
					
				</tr>
			 	
			 	
				<c:forEach items="${page.result}" var="item" varStatus="sta">
			 
					<tr class="tr_${sta.index%2}" onmouseover="this.style.backgroundColor='#BFDDFF';" onmouseout="this.style.backgroundColor='';">
						<td class="ckcol center" width="30" align="center" class="check_bg">
							<input type="checkbox" id="ckb" name="ckb"  value="${sta.index+1}" class="checkboxs" />
						</td>
						<td class="cmd center">&nbsp;${page.pageSize*(page.pageNo-1)+sta.index+1}</td>
						
						<td>&nbsp;${item.title}</td>
						
						
					</tr>
				</c:forEach>
				
				
				
			</table>
			
			<%@ include file="/pages/common/footer.jsp"%>
			<!-- 主内容 end -->
			
			


</form>
</div>

</body>
</html>

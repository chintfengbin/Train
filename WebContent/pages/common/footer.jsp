<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="/WEB-INF/f.tld"%>


<table  width="100%"  border="0">
	
	<tr border="0">
		<td class="foottd" align="left" width="30%" border="0">
			&nbsp;
		</td>
		<td class="foottd" align="right" border="0" style="border-left:0;border-bottom:0;">
			<a id="first" href="#" class="a" onclick="jumpPage(1)">首页</a>
			<c:if test="${ page.hasPre }">
				<a id="prev" href="#" onclick="jumpPage(${page.prePage})">上一页</a>
			</c:if>
			<c:if test="${ page.hasNext }">
				<a id="next" href="#" onclick="jumpPage(${page.nextPage})">下一页</a>
			</c:if>
			<a id="last" href="#" onclick="jumpPage(${page.totalPages})">末页</a> 共<font color="#FF0000">${page.totalCount}</font>条
			每页
			<input type="text" onChange="changePageCnt()" class="search_input" style="width:25pt;font-size:8pt;height:20pt;" value="${page.pageSize }" id="pageSize" name="pageSize"/>
			
			条 [当前第<font color="#FF0000">${page.pageNo}</font>页/共<font color="#FF0000">${page.totalPages}</font>页]
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="hidden" name="pageNo" id="pageNo" value="${page.pageNo}" />
			<input type="hidden" name="orderBy" id="orderBy" value="${page.orderBy}" />
			<input type="hidden" name="order" id="order" value="${page.order}" />
			<input type="hidden" name="totalCount" id="rownum" value="${page.totalCount}" />
			
		</td>
	</tr>
	
</table>
function changePageCnt() {
	
	$("#pageNo").val('1');
	$("#mainForm").submit();
}

/* 表格翻页 */
function jumpPage(pageNo){
	
	$("#pageNo").val(pageNo);
	$("#mainForm").submit();
}

function pageTo() {
	var jumpTo = $('#jumpTo').val();
	$("#pageNo").val(jumpTo);
	$("#mainForm").submit();
}

function pageTo_onEnter() {
	if( window.event.keyCode != "13" ) return; 
	pageTo();
}

/* 点击表头排序 */
function sort(orderBy,defaultOrder){
	if($("#orderBy").val()==orderBy){
		if($("#order").val()==""){
			$("#order").val(defaultOrder);}
		else if($("#order").val()=="desc"){
			$("#order").val("asc");}
		else if($("#order").val()=="asc"){
			$("#order").val("desc");}
	} else{
		$("#orderBy").val(orderBy);
		$("#order").val(defaultOrder);
	}

	$("#mainForm").submit();
}

function Table_getNextRowIndex(strTable_ID) 
{

	var objTable =  document.getElementById(strTable_ID);
	var nMax_ID = 0; 
	
	var nlength = objTable.rows.length;
	
	for(var i=0; i < nlength; i++ ) {
		var objRow = objTable.rows[i]; 
		
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		
		if( nRow_ID > nMax_ID ) nMax_ID = nRow_ID; 
	} 
	return nMax_ID+1; 
}

/* 表格增加行 */
function Table_addRow(strTable_ID){
	//messagebox( "Table_addRow Begin, table id:" + strTable_ID );
	
	var objTable = document.getElementById(strTable_ID);
	//messagebox("table: " + objTable.innerHTML + "");
	
	if( objTable == null ) return; 
	
   	var objHtmlSource = document.getElementById( strTable_ID+"_HTML" );
   	if( objHtmlSource == null ) return;

	var strHtmlTmpl = objHtmlSource.innerHTML; 
	//alert(strHtmlTmpl);
	
	var nRow_ID = Table_getNextRowIndex( strTable_ID );
	//===============================================================================
	// Process New Row and HTML Content
	//var objRow = objTable.insertRow( objTable.rows.length );
	//objRow.id = strTable_ID+"_"+nRow_ID; 	
	//var objCell = objRow.insertCell(-1);		
	//messagebox( strHtmlTmpl );
	
	//设置当前表格的行号
	var html = replace( strHtmlTmpl, "@Row_ID@", nRow_ID); 	
	//alert(html);
	//objCell.innerHTML = replace( strHtmlTmpl, "@Row_ID@", nRow_ID); 	
	//objCell.colSpan = 99; 	
	//messagebox( objTable.innerHTML );
	
	document.getElementById(strTable_ID+"_LastRow").value = nRow_ID;

	$("#" + strTable_ID).append(html);
	
	//Input_setValue( strTable_ID+"_LastRow", nRow_ID ); 
	
	return nRow_ID; 

}

function Table_delRow(strTable_ID, nRow_ID){

	//messagebox( "Table_deleteRow Begin" );

	var objTable = document.getElementById(strTable_ID);
	
//	if (objTable.rows.length <= 1) 
//	{
//		return;
//	}
	
	for (var i=0; i < objTable.rows.length; i++) {
		var objRow = objTable.rows[i];
		//messagebox( objRow.id + " == " + nRow_ID );
		if (objRow.id == strTable_ID+"_"+nRow_ID) {
			objTable.deleteRow(i);
			break;
		}
	} // for i
	
	
}

/* 带回调函数的表格删除行 方法，避免因回调函数导致问题 */
function Table_delRowWithCallBack(strTable_ID, nRow_ID){

	Table_delRow(strTable_ID, nRow_ID);
	
	Table_delRow_CallBack(nRow_ID);
}

/*删除行的回调函数*/
function Table_delRow_CallBack(nRow_ID){
	//主要用于合计部分的修改
}

/* 删除所有行 */
function Table_delAllRow(strTable_ID){
	//alert('Table_delAllRow-' + strTable_ID);
	var objTable = document.getElementById(strTable_ID);
	
	for (var i=objTable.rows.length-1; i >=1 ; i--) {
		var objRow = objTable.rows[i];
		//messagebox( objRow.id);
		objTable.deleteRow(i);
	} // for i
	
	//Table_addRow(strTable_ID)
}


/* 行单击事件，选中或取消复选框 */
function row_onClick(rowId,checkBoxId){
	var chkObj = Input_get(checkBoxId + rowId);
	chkObj.checked = !chkObj.checked;
}

/*
	在表中得到存在行的行序号
	rowNum		当前行序号
	last		后缀名称
	maxRowNum	表的最大行
*/
function getDefinedRow(rowNum,last,maxRowNum){
	var obj = "" ;
	for(var i = rowNum ;i <= maxRowNum; i++){
		obj  = "Item_"+ i + "_" + last;
		if(typeof(Input_getEx(obj))!= "undefined" ){
			return i;
		}
	}
	return parseInt(maxRowNum)+1;
}

function clearBr(key) 
{ 
    key = key.replace(/<\/?.+?>/g,""); 
    key = key.replace(/[\r\n]/g, ""); 
    return key; 
} 
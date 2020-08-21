var win;
function Document_onLoad(){	
	if( typeof(Document_OnData) != "undefined" )    Document_OnData(); 	
	var len = Input_get("detailTable").rows.length;
	
	if(len < 2 ) { Table_addRow('detailTable'); }

	if( window.readonly ){
		
		$('input').attr("readonly", "readonly");
	}
	
	
	if( typeof(Document_OnButtonDisplay) != "undefined" )    Document_OnButtonDisplay();

}

/* 操作按钮显示控制 默认方法，默认只显示返回按钮 */
function Document_setReadOnlyButtonDisplay(){
	//alert("Document_OnButtonDisplay start");
	$('.bnt').hide();
	$('#imgOpen').hide();
	$('#addRow').hide();
	$("img[name$='delete']").hide();
	
	$("img[name='back']").show();
	$("img[name='create']").show();
	$("img[name='print']").show();
	$("img[name='close']").show();
	$("img[name='offset']").show();
	$("img[name='cancel']").show();
}

function Detail_onItemInvalid( nRow_ID, strInput_ID, strInput_Label, strMessage ){
	//alert("Detail_onItemInvalid");
	if( strMessage == null ) strMessage = $lang.validate_null; 
	
	objFocus = Input_get(strInput_ID);
	return $word.row + " ["+nRow_ID+"] "+$word.column+" ["+strInput_Label+"] " + strMessage;
}

/*  产品重复验证  */
function Product_onValid(strTable_ID){
	//alert("Product_onValid start.");
	var prefix = "Item";
	var objTable = Input_get( strTable_ID );
	var invalid = false;
	
	//alert("Table rows:" + objTable.rows.length);
	for(var i=0; i < objTable.rows.length; i++ ) {
		var objRow = objTable.rows[i]; 
		if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		
		var prodInput_id = prefix+"_"+nRow_ID+"_prodId"; 
		var prodVal = $('#' + prodInput_id).val();
		//alert("ProdId:" + prodVal);
		var remarkVal = $('#' + prefix+"_"+nRow_ID+"_remark").val();
		
		var p1 = prodVal.charAt(0);
		//alert("前缀：" + p1);
		
		for(var j=i+1; j<objTable.rows.length; j++) {
			var jobjRow = objTable.rows[j]; 
			if( jobjRow.id.indexOf(strTable_ID) < 0 ) continue; 
			var jnRow_ID = parseInt(replace( jobjRow.id, strTable_ID+"_", "" ));
			
			var jprodInput_id = prefix+"_"+jnRow_ID+"_prodId"; 
			var jprodVal = $('#' + jprodInput_id).val();
			var jremarkVal = $('#' + prefix+"_"+jnRow_ID+"_remark").val();
			
			//alert("prodVal:" + prodVal +", jprodVal:" + jprodVal);
			
			if(p1 == "T") {
				//alert("特产品需要验证产品编码和备注");
				if(prodVal == jprodVal && remarkVal == jremarkVal) {
					messagebox($word.row + " [" + nRow_ID+"] "+$word.row+" ["+jnRow_ID+"] " + $lang.duplicate_product);
					invalid = true;
					break;
					//$('#' + jprodInput_id).focus();
				}
			} else {
				//alert("不是特产品需要验证产品编码和备注");
				if(prodVal == jprodVal) {
					messagebox($word.row + " [" + nRow_ID+"] "+$word.row+" ["+jnRow_ID+"] " + $lang.duplicate_product);
					invalid = true;
					break;
					//$('#' + jprodInput_id).focus();
				}
			}
		}
		
		//alert("invalid:" + invalid);
		//如果有一个重复，直接跳出循环，不检查其他数据
		if(invalid) return true;//重复
		
	} // for i
	
	if(invalid) return true;//重复
	else return false;//不重复
}


/* 按钮无效 */
function Toolbar_onHide(){
	//alert("Toolbar_onHide");
	//$(":button").attr("disabled","true");
	$("#mainForm").mask($lang.process);
}

/* 按钮有效 */
function Toolbar_onEnable(){
//alert("Toolbar_onEnabl");	

	//$(":button").attr("disabled","");
	$("#mainForm").unmask();
}

/* 设置默认首页 */
function form_setHomePage(homePage) {
//alert("form_setHomePage");
	if(homePage.length==0){
		messagebox($lang.index_page_fail);
		return;
	}
	if(confirm($lang.confirm_indexPage)){
		$.getJSON(window.base+'/sys/user/saveHomePage.action', 
			{'homePage': homePage},
			function(data) {
				//alert(data.msg);
				messagebox($lang.index_page_success);
			}
		);
	}
}

/* 添加收藏 */
function form_addFavorite(moduleName, url){

	if(confirm($lang.confirm_collect)){
		$.post(window.base+'/sys/favorite/saveFav.action', {'moduleName': moduleName, 'url':url},
			function(data) {
				
				var myData = eval('(' + data + ')');
				alert(myData.result);
			}
		);
	}
}

/* 表单保存按钮事件 */
function form_onSave(){
	//alert("form_onSave start.");
	
	Toolbar_onHide();
	
	//alert("Detail_onValidate start");
	var strException = Detail_onValidate();//验证
	//alert("Detail_onValidate end");
	//var strException = "";
	
	if( strException != "" ) {
		messagebox(strException);

		Toolbar_onEnable();
		
		if( objFocus != null && typeof(objFocus.focus) != "undefined" ){ 
			objFocus.focus();
			
			if( typeof(objFocus.select) != "undefined" ){ 
				objFocus.select();
			} 
		} 

		return false; 
	}
	
	mainForm.submit();
}

/* 表单提交按钮事件 
	带提交验证(rapid-validation)
*/
function form_onValidSave(){
	//alert(checkCertificateNo());
	var certFlag=$("#certFlag").val();	
	if(certFlag=="0"){
		$("#inputForm").submit();
	}
	
	
	
}
function openWid(msg){
	var layer = layui.layer;
	layui.use('layer', function () {
				var titleInfo=''
					titleInfo+='<a data-toggle="collapse" data-parent="#version" href="#v41">证书系统提示</a><code class="pull-right"></code>';
				
				layer.open({
					type: 1,
					title: false,
					closeBtn: true,
					area: '300px;',
					shade: 0.8,
					id: 'LAY_layuipro',
					btn: ['确   定'],
					btnAlign: 'c',
					moveType: 1,
					content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+msg+'^_^</div>',
					
				});
			})
	 }
function checkCertificateNo(){	
	 var certificateNo = $("#certificateNo").val();
     $.ajax({
         async:false,
         url:window.base+'/certificate/checkCertificateNo',
         data:{"certificateNo":certificateNo},
        type:"POST",
         dataType:"json",
         success:function(data) {
        	 var flag=data.msg;        	 
        	 if(flag=="1"){        		 
        		 openWid("证书编号"+certificateNo+"已存在");
        		 $("#certFlag").val("1");
        		 return false;
        	 }
        	 else{
        		 $("#certFlag").val("0");
        		 return true; 
        	 }
             
         }  
 
     });
	
}

//导入表格
function form_onImport(ckbInputId, actionName){    
	if( typeof(functionName) == "undefined" ){
		functionName = "input";
}

navTo(window.base + actionName + '/importExcel');
}
//导入pdf
function form_onPdf(ckbInputId, actionName){    
	if( typeof(functionName) == "undefined" ){
		functionName = "input";
}

navTo(window.base + actionName + '/importPdf?certificateNo='+ckbInputId);
}





function form_onSubmit() {
		//alert("form_onSubmit");
	
	if(validation .validate()) {
		mainForm.submit();
	}
}


function form_onInput(actionName, functionName) {

	if( typeof(functionName) == "undefined" ){
			functionName = "input";
	}
	
	
	var url=actionName + '/' + functionName;
	
	window.location.href=window.base+url;
	
}


/* 修改按钮事件*/
function form_onModify(ckbInputId, actionName, functionName){	

	if(typeof(functionName) == 'undefined') {
		functionName = 'edit';
	}
	
	var obj = document.getElementsByName(ckbInputId);
	var len = obj.length;
	
    var count=0;
    var id="";

	for(var i=0;i<len;i++){
	  	if(obj[i].checked==true){
	  		id = obj[i].value;
	   		count++;
	  	}
	}
	
  	//alert(id);
    if(count==0){
      	alert("请选择要处理的数据");
    } else if(count>1){
      	alert($lang.select_record_more);
    } else{
  	 	var url=actionName + '/' + functionName + '?id=' +id;
	
	     window.location.href=window.base+url;  	 	
  	 
  	 
    }
}

function form_onModifyEdit(ckbInputId, actionName, functionName){	

	if(typeof(functionName) == 'undefined') {
		functionName = 'edit';
	}
	
	var url=actionName + '/' + functionName + '?id=' +ckbInputId;
	
    window.location.href=window.base+url;  
	
 
}
function form_onuploadPdf(ckbInputId, actionName, functionName){	

	if(typeof(functionName) == 'undefined') {
		functionName = 'edit';
	}
	
	var url=actionName + '/' + functionName + '?id=' +ckbInputId;
	
    window.location.href=window.base+url;  
	
 
}



function form_onMultiModify(ckbInputId, actionName){
	
	var obj = document.getElementsByName(ckbInputId);
	
	
    var count=0;
	count=getCheckedCnt(ckbInputId);//得到勾选的checkbox数量
  
    if(count==0){
      	alert("请选择要处理的数据");
    } else{
    	var multiId=getCheckedValues(ckbInputId);//得到勾选的checkbox的值
    	//alert(multiId);
  	 	window.navigate(window.base + actionName + '/input.action?id='+multiId);
    }
}


/* 删除按钮操作*/
function form_onDelete(ckbInputId, actionName){
	//if(confirm('确认删除？')){

		var obj = document.getElementsByName(ckbInputId);
		var len = obj.length;
		
	    var count=0;
	    var ids="";
	
		for(var i=0;i<len;i++){
		  	if(obj[i].checked==true){
		  		ids +=obj[i].value +",";
		   		count++;
		  	}
		}
	  	
	    if(count==0){
	    	alert("请选择要处理的数据");
	    } else {
	    	ids = ids.substring(0, ids.length-1);
	    	var url =actionName + "/delete?id=" + ids;	 
	    
	     window.location.href=window.base+url;
	    	
	    }
    //}
}


function form_onDeleteEdit(ids,ckbInputId,actionName){
	if(confirm('确认删除？')){

		var url =actionName + "/delete?id=" + ids;	 
		
	    
	     window.location.href=window.base+url;
	    	
	    }
    }



function form_onReturn(actionName) {
//alert("form_onReturn");
	navTo(window.base + actionName);
}




/* 数据导出 */
function form_onExport(actionName, functionName){
	
	if(confirm($lang.confirm_export)){
		if( typeof(functionName) == "undefined" ){
			functionName = "export";
		}
		
		var oldAction = mainForm.action ;
		mainForm.target='_blank';
		mainForm.action = window.base + actionName + "/" + functionName + ".action" ;
	    mainForm.submit();
	    mainForm.action = oldAction;
	    mainForm.target='';
    }

   
}

/* 上传数据 */
/*function form_onImport(template,titleName){
//alert("form_onImport");
	//if(confirm("是否确实上传数据？")){
		 fopenWindow(window.base + '/pages/common/file-upload.jsp?template='+template+'&titleName='+titleName,'','');
	//}
}*/

/* 表单打印 */
function form_onPrint(actionName, id){
//alert("form_onPrint");
	fopenWindow(window.base + actionName + '/print/'+id, '', '');
}

/* 冲销按钮事件*/
function form_onOffset(id, actionName){
	//alert("form_onOffset");
	if(confirm($lang.confirm_reversal)) {
		if($('#billStatus').val() != '1'){
			alert($lang.reversal_fail);
			return ;
		}
		
		navTo(window.base + actionName + '/offset/'+id);
	}
}

/* 单据编号回车事件，根据单号查询单据 */
function form_onBillNoEnterClick(actionName){

	if( window.event.keyCode != "13" ) return; 
	var billNo = $('#billNo').val();
	navTo(window.base + actionName + '/input.action?billNo='+billNo);
	//window.navigate();
}

/* 按回车，跳到下一个输入框 */
function form_onEnterToNext(nextInputId){
//alert("form_onEnterToNext");
	if( window.event.keyCode != "13" ) return; 
	objInput = document.getElementById(nextInputId); 
	var lastRow=document.getElementById("detailTable_LastRow").value;
	var nRowId=0;
 
    for(var i=0;i<=lastRow;i++) 
    {   
          
        if(objInput==null){
	        nRowId = i + 1;
		    nextInputId = "Item_"+ nRowId +"_spec";
		    objInput = document.getElementById(nextInputId); 
	    }
   }
	if(objInput!=null){
		Input_focus(nextInputId);
	}else{
	    
	}
}

function form_onEnterToNextInput(nextInputId){
//alert("form_onEnterToNextInput");
	if( window.event.keyCode != "13" ) return; 
	objInput = document.getElementById(nextInputId); 
	
	objInput.focus();
}

/* 清楚空明细表中的空行 
function form_onClearItem(prefix, objTable, strTable_ID) {
	//alert("form_onClearItem");
	var rowNum = objTable.rows.length;
	for(var i=0; i < rowNum; i++ ) {
		var objRow = objTable.rows[i]; 
		if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		var strInput_ID = prefix+"_"+nRow_ID+"_prodId"; 
		
		if(Input_getValue(strInput_ID) == ""){
			//通过产品编码判断此行数据是否有效，无效直接删除，不进行其他验证
			//alert("Table_delRow");
		 	Table_delRow(strTable_ID, nRow_ID);
		 	rowNum=rowNum-1;
         	i=i-1;
		}
	}
}
*/

function form_onClearItem(prefix, objTable, strTable_ID, columnId) {

	if( typeof(columnId) == "undefined" ){
		columnId = "prodId";
	}

	var rowNum = objTable.rows.length;
	for(var i=0; i < rowNum; i++ ) {
		var objRow = objTable.rows[i]; 
		if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		var strInput_ID = prefix+"_"+nRow_ID+"_" + columnId; 
		
		if(Input_getValue(strInput_ID) == ""){
			//通过产品编码判断此行数据是否有效，无效直接删除，不进行其他验证
			//alert("Table_delRow");
		 	Table_delRow(strTable_ID, nRow_ID);
		 	rowNum=rowNum-1;
         	i=i-1;
		}
	}
}

/* 通过回车键 批量设置明细表格的某个字段的值*/
function form_onEnterBatchSetValue(prefix, strTable_ID, inputId, valueInputId){
	
	if( window.event.keyCode != "13" ) return; 
	form_onBatchSetValue(prefix, strTable_ID, inputId, valueInputId);
}


function form_onBatchSetValue(prefix, strTable_ID, inputId, valueInputId){
	
	var objTable = Input_get(strTable_ID);
	var rowNum = objTable.rows.length;
	
	var inputValue = Input_getValue(valueInputId);
	
	 
	if(isNonNegativeFloat(inputValue)&&inputValue!=""){
	    
		alert($lang.invalid_value);
		Input_focus(valueInputId);
	} else {
		for(var i=0; i < rowNum; i++ ) {
			var objRow = objTable.rows[i]; 
			if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
			var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
			var strInput_ID = prefix+"_"+nRow_ID+"_" + inputId; 
			
			Input_setValue(strInput_ID, inputValue);
		}
	}
}

function form_onSumValue(prefix, strTable_ID, inputId){

	var objTable = Input_get(strTable_ID);
	var rowNum = objTable.rows.length;
	
	var result = 0;
	
	for(var i=0; i < rowNum; i++ ) {
		var objRow = objTable.rows[i]; 
		if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		var strInput_ID = prefix+"_"+nRow_ID+"_" + inputId; 
		
		
		var v = parseFloat(Input_getValue(strInput_ID));
		
		if( isNaN(v) ){
			
		} else {
			result = (result).add(v);
		}
		
	}
	
	return result;
}

/* 表格数据的重复验证 */
function form_onValidOverlapForDetail(prefix, strTable_ID, columnName, value){
	
	var objTable = Input_get(strTable_ID);
	var rowNum = objTable.rows.length;
	 
	for(var i=0; i < rowNum-1; i++ ) {
		var objRow = objTable.rows[i]; 
		if( objRow.id.indexOf(strTable_ID) < 0 ) continue; 
		
		var nRow_ID = parseInt(replace( objRow.id, strTable_ID+"_", "" ));
		var strInput_ID = prefix+"_"+nRow_ID+"_" + columnName; 
		
		if(Input_getValue(strInput_ID) == value) {
			alert($word.row + " [" + nRow_ID + "] " + $lang.already_exist);
			return false;
		}
		
	}
	return true;
}

/* 优惠率设置 -  批量设置优惠率 */
function form_onSetDiscount() {
	
	var valueInputId = 'batchValue';
	var startDateInputId = 'batchStartDate';
	var endDateInputId = 'batchEndDate';
	
	var prefix = "Item";
	var strTable_ID = 'detailTable';
	var objTable = Input_get(strTable_ID);
	var rowNum = objTable.rows.length;
	
	var inputValue = Input_getValue(valueInputId);
	var startDate = Input_getValue(startDateInputId);
	var endDate = Input_getValue(endDateInputId);
	
	//判断设置的值是否有效
	if(inputValue == "" && startDate == "" && endDate == ""){
		alert("设置内容不能为空");
		Input_fs(valueInputId);
	} else {
	
		var rowIds = $('input[name=checkbox_check]').checkbox();
		
		for (x in rowIds)
		{
			//alert(rowIds[x]);
			
			var nRow_ID = rowIds[x];
			if(nRow_ID == '@Row_ID@') continue;
			
			//设置 优惠率
			if(inputValue != ""){
				var strInput_ID = prefix+"_"+nRow_ID+"_discount"; 
				Input_setValue(strInput_ID, parseFloat(inputValue));
			}
			
			//设置有效时间段
			if(startDate != ""){
				var strStartInput_ID = prefix+"_"+nRow_ID+"_startDate"; 
				Input_setValue(strStartInput_ID, startDate);
			}
			
			if(endDate != ""){
				var strEndInput_ID = prefix+"_"+nRow_ID+"_endDate"; 
				Input_setValue(strEndInput_ID, endDate);
			}
		}

		if(rowIds.length == 0) {
			alert($lang.select_item);
		}
	}
}

/* 有效标识，复选框控制 */
function validFlag_onClick(ckb){
//alert("validFlag_onClick");
	var checked = $('#' + ckb).attr("checked");
	if(checked){
		$('#validFlag').val(1);
	} else {
		$('#validFlag').val(0);
	}
}

function checkbox_onClick(ckb, hiddenInputId) {
//alert("checkbox_onClick");
	var checked = $('#' + ckb).attr("checked");
	if(checked){
		$('#' + hiddenInputId).val(1);
	} else {
		$('#' + hiddenInputId).val(0);
	}
}

function checkbox_onClickre(ckb, hiddenInputId) {
	var checked = $('#' + ckb).attr("checked");
	if(checked){
		$('#' + hiddenInputId).val(0);
	} else {
		$('#' + hiddenInputId).val(1);
	}
}
/*编辑页面 使用 快捷键
	[alt+1] 提交
	[alt+2] 保存
	[alt+3] 新增
	[alt+4] 结算
	[alt+r] 返回
*/
function Form_onEditShortcut(){ 
	//alert(event.keyCode);
	if (event.altKey == true && event.keyCode == "49"){   
		//alt+1
		$('#subm').click();
		
	} else if (event.altKey == true && event.keyCode == "50"){   
		//alt+2
		$('#save').click();
	}  else if (event.altKey == true && event.keyCode == "51"){   
		//alt+3
		$('#create').click();
	}  else if (event.altKey == true && event.keyCode == "52"){   
		//alt+4
		$('#balance').click();
	} else if (event.altKey == true && event.keyCode == "82"){   
		//alt+r
		$('#back').click();
	}
	//else if (event.keyCode == "48"){   
		//print
	//	$('#print').click();
	//} 
	return ;
}

/*
	管理页面 使用 快捷键
	[alt+n] 新增
	[alt+e] 编辑
	[Delete]删除
	[alt+x] 导出
	[alt+P] 打印
	[Page Up]上页
	[Page Down]下页
	[Home] 首页
	[End]  末页
*/
function Form_onMainShortcut(){ 
	//alert(event.keyCode);
	if (event.altKey == true && event.keyCode == "78"){   
		//alt+n
		$('#create').click();
		
	} else if (event.altKey == true && event.keyCode == "69"){   
		//alt+e
		$('#edit').click();
	}  else if (event.keyCode == "46"){   
		//delete
		$('#delete').click();
	}
	
	else if (event.altKey == true && event.keyCode == "88"){   
		//alt+x
		$('#export').click();
		/*
	}  else if (event.keyCode == "38"){   
		//上方向键 上页
		$('#export').click();
	}  else if (event.keyCode == "40"){   
		//下方向键 下页
		$('#export').click();
		*/
	} else if (event.keyCode == "33"){   
		//page up 上页
		$('#prev').click();
	} else if (event.keyCode == "34"){   
		//page down 下页
		$('#next').click();
	} else if (event.keyCode == "36"){   
		//home 首页
		$('#first').click();
	} else if (event.keyCode == "35"){   
		//end 末页
		$('#last').click();
	}
	
	return ;
}

//============================================================================
// 弹出窗口回调函数

function fshowModalDialog(endtarget,width,height, args){
	if(width==''){ width="700"; }
    if(height==''){ height="430"; }

	var features =	'dialogWidth:'+width+'px;' +
					'dialogHeight:'+height+'px;' +
					'directories:no; localtion:no; menubar=yes; status=no; toolbar=no;scrollbars:no;resizable=yes';
	return window.showModalDialog(endtarget, args, features );
}
 

function fopenWindow(endtarget,width,height){
    if(width==''){ width="720"; }
    if(height==''){ height="360"; }
    
    if(win==null || win.closed){ 
    	win = window.open( encodeURI(endtarget), "", "left=50, top=50, width="+width+"px, height="+height+"px, scrollbars=1, resizable=1, menubar=0, location=0, status=1, toolbar=0, " );
    } else {
		win.focus();    
    }
}

//====================================================================
//从url中解析参数
function GetUrlParms()    
{
    var args=new Object();   
    var query=location.search.substring(1);
    //alert(query);
    var pairs=query.split("&");
    //alert(pairs);
    for(var i=0;i<pairs.length;i++)   
    {   
        var pos=pairs[i].indexOf('=');
        if(pos==-1)   continue;
        var argname=pairs[i].substring(0,pos);
        var value=pairs[i].substring(pos+1);
        args[argname]=unescape(value);
    }
    return args;
}

function Dialog_onDblClick(rtnval)
{
	//var rtnval = {prodId: prodId, prodName: prodName};
	 
	var args = new Object();
	args = GetUrlParms();
	var cmp = args['cmp']
	
	window.opener.openCallback(cmp, rtnval); 
	window.close();
}

window.openCallback = fopenCallback;

function fopenCallback(cmp, retval){
	
	//alert("call back start." + cmp);
	
	var obj = eval('(' + cmp + ')');
	
	for(var e in obj ){
		//alert(obj[e]);
		//alert(retval[obj[e]]);
		document.getElementById(obj[e]).value = retval[obj[e]];
	}
}

//=========================================================================
//带前缀的对话框调用

function Dialog_onDynClick(rtnval)
{
	//alert("Dialog_onDynClick");
	var args = new Object();
	args = GetUrlParms();
	
	var cmp = args['cmp'];
	if(typeof(cmp)=="undefined") {
		alert("param[cmp] is undefined");
	}
	//alert(cmp);
	var prefix = args['prefix'];
	//alert(prefix);
	var zindex = args['zindex'];
	//alert(zindex);
	window.opener.openDynCallback(cmp, prefix, rtnval, zindex); 
	window.close();
}

window.openDynCallback = fopenDynCallback;

function fopenDynCallback(cmp, prefix, retval, zindex){
	
	//alert("call back start." + cmp);
	var obj = eval('(' + cmp + ')');
	//alert(cmp);
	if(typeof(prefix)=='undefined') {
		prefix = "";
	}
	//alert(retval);
	for(var e in obj ){

		var input_id = prefix + obj[e];
		//alert(input_id+","+e+","+retval[e]);
		Input_setValue(input_id, retval[e]);
	}

	fdetailDynCallBack(prefix, zindex);
}

function fdetailDynCallBack(prefix, zindex){
	alert("fdetailDynCallBack--" + prefix +", zindex:" + zindex);
	
}

//=====================================================================
//对话框多行选择 start
function Dialog_onMultiClick(rtnval,cflag)
{
	var strCmp = $('#cmp').val();
	//alert("cmp:[" +strCmp +"]");
	
	var strPrefix = $('#prefix').val();
	//alert(strPrefix);
	//alert(window.opener.openMultiCallback);
	window.opener.openMultiCallback(strCmp, strPrefix, rtnval, cflag); 
	window.close();
}

window.openMultiCallback = fopenMultiCallback;

function fopenMultiCallback(cmp, prefix, retval, cflag){
	
	//alert("call back start. cmp:[" + cmp +"], prefix:[" + prefix +"]");
	//alert(retval);
	if(typeof(cmp)=="undefined" || cmp =='') {
		alert("Cmp json is null.");
		return;
	}
	
	var objCmp = eval('(' + cmp + ')');
	if(typeof(prefix)=="undefined") {
		prefix = "";
	}
	
	var pos = prefix.indexOf("_");
	
	var pre = prefix.substring(0, pos);
	//alert("pre:" + pre);
	
	var strRowId = prefix.substring(pos+1, prefix.length-1);
	//alert("strRowId:" + strRowId);
	
	var nRowId = parseInt(strRowId);
	
	//设置完成产品返回后的焦点
	var strFocusPrefix = pre + "_" + strRowId +"_";
	
	var objRetval = eval('(' + retval + ')');
	
	var retvalLen = objRetval.length;
	
	$.each(objRetval,function(entryIndex,entry){   
		var validFlag = true;
		//alert("index: " + entryIndex);

		if(typeof(entry['prodId']) != 'undefined') {
			var prodId = entry['prodId'];
			//alert("entry['prodId']:" + prodId);
			var p1 = prodId.charAt(0);
			//alert("前缀：" + p1);
			if(p1 == "T" || cflag != undefined) {
				//alert("不需要验证重复");
			} else {
				for(var i=1; i <= nRowId; i++ ) {
					var strProdId = pre+"_"+i+"_prodId";
					var prodIdO = Input_getValueEx(strProdId);
					//alert("prodIdO, strProdId:" + prodIdO + ", " + strProdId );
					if(prodId == prodIdO) {
						alert($word.row + "[" + i + "] "+$word.column+" [" + prodId +"] " + $lang.duplicate_validate);
						//Input_setValue(strInput_ID, "");
						validFlag = false;
						break;
					}
				}
			}
		}
		
		if(validFlag){
			for(var e in objCmp ){
				//alert(objCmp[e]);
				var key = objCmp[e];
				var input_id = prefix + key;
				//alert(objCmp[e] + '--' + entry[e]);
				var val = restorestr(entry[e]);
				if(typeof(val)=="undefined") alert($lang.key_not_exist + key);
				if(key=='spec'){
					val=restorestr(val);
				}
				Input_setValueEx(input_id, val);
			}
			 
			fdetailCallBack(prefix);
			 
			nRowId = nRowId+1
			prefix = pre + "_"+ nRowId + "_";
			
			if(entryIndex < retvalLen-1) {
				
				if(pre == 'Item') {
					Table_addRow('detailTable');
				} else {
					Table_addRow('detailTableIn');
				}
				
			}
			
		}
    }); 
	
	//设置焦点
	//Input_fsEx(strFocusInputId);
	Data_onFocus(strFocusPrefix); 	
}

/* 默认焦点设置方法，如果需要设置到其他输入框，用户可重载此方法 */
function Data_onFocus(strFocusPrefix) {
	//alert('default Data_onFocus,' + strFocusPrefix);
	Input_focus(strFocusPrefix + 'qty');
	//alert('Data_onFocus end');
}

/* 多行对话框 自定义回调函数 */
function fdetailCallBack(prefix){
	alert("fdetailCallBack--" + prefix);
}

//对话框多行选择 end
//==================================================================


//========================== 复选框操作 ===============================
/*
function checkAll(strCheckBoxNames){
	//alert("check all_start");
	var objCheckAll = document.getElementById("chkall");
	
	var obj = document.getElementsByName(strCheckBoxNames);
	var len = obj.length;
	for(var i=0;i<len;i++){
		obj[i].checked = objCheckAll.checked;

	}	

}
*/

function checkAll(strCheckBoxNames, strChkallInputId){
	//alert("check all_start");
	if(typeof(strChkallInputId)=='undefined'){
		strChkallInputId = "chkall";
	}
	var objCheckAll = document.getElementById(strChkallInputId);
	
	var obj = document.getElementsByName(strCheckBoxNames);
	var len = obj.length;
	for(var i=0;i<len;i++){
		obj[i].checked = objCheckAll.checked;
	}
	
 	var e1 = document.getElementById(strCheckBoxNames+"_0");
   	//alert(e1);
   	if(e1!=null && e1!=""){
   	  e1.focus();
   	}else{
   	    var e2 = document.getElementById(strCheckBoxNames+"_1");
   	  	if(e2!=null && e2!=""){
   	       e2.focus();
   	    }
	}
}

//count of checkbox which is true 
function CheckAll(form)  {
  	for (var i=0;i<form.elements.length;i++)    {
    	var e = form.elements[i];
    	if (e.name != 'chkall')       
    		e.checked = form.chkall.checked; 
   	}
  
	          
}

function getCheckedCnt(ckbInputId){
	if(ckbInputId == '') ckbInputId = 'checkbox_check';
	var obj = document.getElementsByName(ckbInputId);
	var len = obj.length;
	
	var nCnt = 0;
	
	for(var i=0;i<len;i++){
	  	if(obj[i].checked==true){
	   		nCnt += 1;
	  	}
	}
	
	return nCnt;
}

//get  value  of   checked checkbox 
//v3.0 zxz at 20091218
function getCheckedValues(ckbInputId){
	//alert("start getCheckIds");
	var obj = document.getElementsByName(ckbInputId);
	var len = obj.length;
	
	var checkValues = "";
	//alert("start getcheckValues");
	for(var i=0;i<len;i++){
	  	if(obj[i].checked==true){
	   		checkValues=checkValues+obj[i].value+",";
	  	}
	}
	if(checkValues.length>0){
		checkValues=checkValues.substr(0,checkValues.length-1);
	}
	
	return checkValues;
}

/* 得到打钩的checkbox的value，返回打钩checkbox的value数组*/
function getCheckedValueArray(ckbName){
	//alert("start getCheckedValueArray");
	var obj = document.getElementsByName(ckbName);
	var len = obj.length;
	var ckbArray = new Array()
	var nCnt = 0;
	//alert("start getcheckValues");
	for(var i=0;i<len;i++){
	  	if(obj[i].checked==true){
	  		
	   		ckbArray[nCnt]=obj[i].value;
	   		nCnt++;
	  	}
	}	
	return ckbArray;
}


//=====================================================================================

/* 
	@Description 得到从表合计
	@Param masteField 合计字段
	@Param subField	  被合计字段
	zxz 2010-01-13
 */
function getMasterSum(subField){
	//alert("start getMasterSum");
	var rowNum=Input_getValue("detailTable_LastRow");
	//alert(rowNum);
	var masterSum=0;
	
	for(var i=1;i<=rowNum;i++){
	
		var subName = "Item_"+ i +"_"+subField;
		var subObject = document.getElementById(subName); 
		
		if(subObject!=null&&isNumeric(subObject.value)){
			masterSum = masterSum.add(parseFloat(subObject.value)) ;
		}
	}
	
	return masterSum;
}
function form_onSearch() {
	
	$("#pageNo").val('1');
	  var type1=$("#type1").val();
	  var type2=$("#type2").val();
	  var type3=$("#type3").val();
	  var type4=$("#type4").val();
	  if(type1=="类型1"){
		  $("#type1").val("");
	  }
	  if(type2=="类型2"){
		  $("#type2").val("");
	  }
	  if(type3=="类型3"){
		  $("#type3").val("");
	  }
	  if(type4=="类型4"){
		  $("#type4").val("");
	  }
	//  var name=$("#filter_LIKES_certificateNo").val();
	//  $("#filter_LIKES_name").val(name);
		mainForm.submit();
	
}
function form_reset() {
	
	//$("#pageNo").val('1');
	$("#filter_LIKES_certificateNo").val("");
	$("#filter_LIKES_name").val("");
	$("#type1").val("");
	$("#type2").val("");
	$("#type3").val("");
	$("#type4").val("");
		//mainForm.submit();
	
}
/*
打印提示
*/
function printTip() {
	var printFlag = $('#printFlag').val();
	if(printFlag=='true') {
		if(confirm($lang.confirm_print)){
			$('#print').click();
		}
	}
}

/* 
	@Description 快捷键弹出窗口
	xiangbw 2010-03-01
 */
function openKeyBoard(){
		window.open('../pages/common/keyboard.jsp','','height=475,width=650,top=200,left=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	
/* 
	@Description 按钮的亮度切换功能
	xiangbw 2010-03-01
 */	
function showOrHidden(the,sortid)
{
   var thesrc= the.src;
   if(sortid=="hui"){
   	   thesrc=thesrc.replace("hui","liang"); 
   	   the.src=thesrc;
   	    
   }else
   {
       thesrc=thesrc.replace("liang","hui"); 
   	   the.src=thesrc;
   }
}
function showOrHidden2(the,sortid)
{
   var thesrc= the.src;
   if(sortid=="Button"){
   	   thesrc=thesrc.replace("Button","Button/liang"); 
   	   the.src=thesrc;
   	    
   }else
   {
       thesrc=thesrc.replace("Button/liang","Button"); 
   	   the.src=thesrc;
   }
}	


/* 
	@Description 清除所有文本内容
	xiangbw 2010-03-016
 */	
 
function clean(url){
      
	var aa = document.getElementById("search").getElementsByTagName("input");
		for(var i=0;i<aa.length;i++){
		if (aa[i].type=="text"||aa[i].type=="hidden"){
			aa[i].value="";
		}
		if (aa[i].type=="checkbox"){
			aa[i].checked=false;
		}
	}
	var bb = document.getElementById("search").getElementsByTagName("select");
		for(var i=0;i<bb.length;i++){
		 bb[i].value="";
		 
		// if(stateid=="0"){
		//	 if(bb[i].id=="filter_EQ_prplanStatus.id"||bb[i].id=="filter_EQ_billStatus.id"){
		//	    bb[i].value="0";
		//	 }
		// }
		 
	}
	 
}
/* 
	@Description 默认指针的指向对象
	xiangbw 2010-03-018
 */	
function loadset()
{
   // alert(document.activeElement.name);
    if(document.activeElement.name==null){
		if(typeof(mainForm.chkall) != 'undefined'){
	       mainForm.chkall.focus();
	    }
    } 
}

/* 
	@Description 选择产品 鼠标上下左右移动
	xiangbw 2010-03-017
 */	
function moveChkRow(row,trid,checkid)
{
			
	if(row=="all"){
  		if(event.keyCode==40){//下
     		var e1 = document.getElementById(checkid+"_0");
     		if(e1==null){
            	e1=document.getElementById("ticket_0");
           	}
           	if(e1!=null){
     			var ide = document.getElementById(trid+"_0");
        		ide.style.backgroundColor='#BFDDFF';
        		e1.focus();
        	}
  		}
  		else if(event.keyCode==39){//右
        	var e1 = document.getElementById(checkid+"_0");
          	e1.focus();
          	var e = document.getElementById("chkall");
          	//alert(checkid);
          	e.checked=true;   
       		checkAll(checkid);
        }
        else if(event.keyCode==37){//左
        	var e = document.getElementById("chkall");
       		e.checked=false;  
       		checkAll(checkid);
		} 

	}else{
	
		if(checkid==null){
		  	checkid="chk";
		}
		if(trid==null){
		   	trid="id";
		}
		if(event.keyCode==38){//上
        	if(row>0){
				var e = document.getElementById(checkid+"_"+(row));
               	var e1 = document.getElementById(checkid+"_"+(row-1));
               	if(e1==null){
                	e1=document.getElementById("ticket_"+(row-1));
                }
                if(e1!=null){
                  
               		var ide = document.getElementById(trid+"_"+(row));
               		var ide1 = document.getElementById(trid+"_"+(row-1));
              		// alert(ide1);
               		//e.checked=false;
               		ide1.style.backgroundColor='#BFDDFF';
               		ide.style.backgroundColor='';
               		e1.focus();
               }
			}else{
            	var ide = document.getElementById(trid+"_"+(row));
               	var e1 = document.getElementById("chkall");
               	ide.style.backgroundColor='';
               	e1.focus();
            }    
 		}else if(event.keyCode==40){//下
             if(row<mainForm.rownum.value-1){
                 var e = document.getElementById(checkid+"_"+(row+1));
                 if(e==null){
                    e=document.getElementById("ticket_"+(row+1));
                 }
                 if(e!=null){
              		//alert(row);
              		var ide = document.getElementById(trid+"_"+(row+1));
              		var ide1 = document.getElementById(trid+"_"+(row));
               		ide1.style.backgroundColor='';
               		ide.style.backgroundColor='#BFDDFF';
               		e.focus();
               }
          	}
 		}else if(event.keyCode==39){
        	var e = document.getElementById(checkid+"_"+(row));
            if(e!=null){
            	e.checked=true;
            }
       	}
        else if(event.keyCode==37){
			var e = document.getElementById(checkid+"_"+(row));
            if(e!=null){
           		e.checked=false;
            }
        }
        
       	else if(event.keyCode==13){
          form_onEnter();
        }
	}
}

/* 
	@Description 业务页面  鼠标上下左右移动
	xiangbw 2010-03-017
 */	
function arrow_onEnterClick(nRow_ID,last,now,next,vvv){

	var lastRow=document.getElementById("detailTable_LastRow").value; 
    //alert(lastRow)
    var item="Item";
    if(vvv!=null){
      item=vvv;
    }
    if(event.keyCode==38){//上
		var objInput =  null;
		var nRowId=0;
		for(var i=nRow_ID*1;i>1;i--) 
		{ 
			if(objInput==null){
			    nRowId=nRow_ID-1;
			    strInput_ID = item+"_"+nRowId+"_"+now;
			    objInput = document.getElementById(strInput_ID); 
		 	}
	 	}
			      
	    if(objInput!=null){
	    	var obj = Input_get(strInput_ID);
	      	obj.focus();
	    }
	 }else if(event.keyCode==40){//下
	 	//alert('start');
     	var objInput =  null;
        var nRowId=0
	  	for(var i=nRow_ID*1;i<=lastRow;i++) 
	  	{ 
        	if(objInput==null){
            	nRowId=nRow_ID*1+1;
                strInput_ID = item+"_"+nRowId+"_"+now;
                objInput = document.getElementById(strInput_ID); 
            }
        }
      
        if(objInput!=null) 
        {
 	    	var obj = Input_get(strInput_ID);
            obj.focus();
        }
		//alert('end');
	}else if(event.keyCode==39){//右
		if(next!=""){
			strInput_ID = item+"_"+nRow_ID+"_"+next;
	        var obj = Input_get(strInput_ID);
	        obj.focus();
	     }
	}
	else if(event.keyCode==37){//左
		if(last!=""){
    		strInput_ID = item+"_"+nRow_ID+"_"+last;
	        var obj = Input_get(strInput_ID);
	        obj.focus();
	     }
	}
	else if(event.keyCode==13){
		           
	}
}
      
 /* 明细数据，鼠标浮动事件
        xiangbw 2010-06-22
 */
function detail_onFocus(rowIndex,obj){
	obj.select();
}
/* 
	@Description 保存操作后的信息提示框  隐藏功能
	xiangbw 2010-04-30
 */	
function hiddenMessage()
{
   messageTable.style.display = "none";	    
}
/* 异步得到单位小数标识 */
function getUnitDecimalByProdSid(unitDecimal,prodSid){
		$.ajax({
		    url: window.base+'/bas/unit!getUnitDecimal.action?prodSid=' + prodSid ,
		    type: 'POST',
		    dataType: 'json',
		    error: function(){
		        alert('Error loading');
		    },
		    success: function(data){
		    	Input_setValue(unitDecimal, data.unitDecimal);
		    }
		});
}
		
function getMutilCheckBoxValue(id, checkBoxId){
	var obj = document.getElementById('_checkBox_item_'+checkBoxId);
	var v = Input_getValue(id);
	var iv = 0;
	if(v != null && v.trim() != "")
		iv = parseInt(v);
	if(obj.checked){
		Input_setValue(id, iv + Math.pow(2,parseInt(checkBoxId)));
	}
	else{
		Input_setValue(id, iv - Math.pow(2,parseInt(checkBoxId)));
	}
}

/* 货架异步级联下拉 */
function stock_OnChange(pid,bid,itemType){
	var stockId = $('#'+pid).select();
	//alert(stockId);
	/* jquery ajax 加载下级产品类别 */	
	$.post(window.base+'/bas/prod-stock/getItems.action', {'pcode': stockId,'itemType':itemType},
		function(data) {
			//返回结果类型为字符串。使用 var myData = JSON.parser(data);转换为json格式
			//alert("success");
			$("#"+bid).html(data); 
		}
	);
}

/* 销售区域异步级联下拉 */
function saleArea_OnChange(pid,bid){
	var saleAreaId = $('#'+pid).select();
	$.post(window.base+'/cm/sale-area/getItems.action', {'pid': saleAreaId},
		function(data) {
		    $("#"+bid).html(data); 
		}
	);
}

/* 计算结算金额 */
function calcDiscountSum(qty, normPrice, discountRate, discountPrice) {
	
	var ds = qty*normPrice * (100-discountRate)/100;
	//alert(ds);
	return roundFloat(ds, window.amountDecimal);
}

/* 显示帮助信息 */
function showHelpDiv(obj, display) {
	//alert("showHelpDiv");
	// 保存元素
	var el = obj;
	// 获得元素的左偏移量
	var left = obj.offsetLeft;
	// 获得元素的顶端偏移量
	var top = obj.offsetTop;
	
	// 循环获得元素的父级控件，累加左和顶端偏移量
	while (obj = obj.offsetParent) {
		left += obj.offsetLeft;
		top += obj.offsetTop;
	}
	//alert(left + "-" + top);
	
	//top=top+22
	// 设置层的坐标并显示
	if(typeof(document.all.helpDiv) != "undefined") {
		document.all.helpDiv.style.pixelLeft =left;
		// 层的顶端距离为元素的顶端距离加上元素的高
		document.all.helpDiv.style.pixelTop = top  + el.offsetHeight + 1; 
		document.all.helpDiv.style.display = display;
	} else {
		alert("无帮助信息");
	}
}

function hideHelpDiv() {
	document.all.helpDiv.style.display = 'none';
}

/* 导航到新页面 */
function navTo(url){
	window.location.href = url;
	
	
}


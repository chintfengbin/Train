

function login() {

	var username = $.trim($("input[name='username']").val());
    var password = $.trim($("input[name='password']").val());
  
    $.ajax({
        type: "post",
        url: ctx+"login/check",
        async:false,
        data: {
            "username": username,
            "password": password
        },
        success: function(r) {
        	//alert(r);
        	//alert(r.success);
        	//var u = eval('('+r+')');
        //	var robj=eval('('+r+')');
           // if (robj.success == 0) {
        	if (r.success == 0) {
            	var msg=robj.msg;
               // location.href ="${pageContext.request.contextPath}/login/login;
            $("#msg").html(msg);
            } else {
            	alert(ctx+"index");
            	location.href =ctx+"main/index";
            }
        }
    });
	//location.href =ctx+"index";
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                required: true
            }
        },
        messages: {
            username: {
                required: icon + "请输入您的用户名",
            },
            password: {
                required: icon + "请输入您的密码",
            }
        }
    })
}

function validateKickout() {
	if (getParam("kickout") == 1) {
	    layer.alert("<font color='red'>您已在别处登录，请您修改密码或重新登录</font>", {
	        icon: 0,
	        title: "系统提示"
	    },
	    function(index) {
	        //关闭弹窗
	        layer.close(index);
	        if (top != self) {
	            top.location = self.location;
	        } else {
	            var url  =  location.search;
	            if (url) {
	                var oldUrl  = window.location.href;
	                var newUrl  = oldUrl.substring(0,  oldUrl.indexOf('?'));
	                self.location  = newUrl;
	            }
	        }
	    });
	}
}



package com.training.action;

import com.training.common.core.controller.BaseController;
import com.training.model.Login;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;




@Controller
@RequestMapping("/login")
public class LoginController  extends BaseController{

	 private  String prefix = "login";
	
	 	@RequestMapping("/index")
	    public String add(ModelMap mmap)
	    {
	 		 return prefix + "/login";
	        
	    }

	 	@RequestMapping("/check")
	    @ResponseBody
	    public Map<String, Object> ajaxLogin(String username, String password)
	    {
		 String msg ="";	   
		 Login userInfo=new Login();
	     userInfo.setLoginName(username);
	     userInfo.setPassword(password);
	    
	     Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("flag", "1");
			//List<UserInfo> list = userInfoService.selectUserInfoList(userInfo);
	        
				
	    // if(list.size()>0) {
			if(username!=null) {
	    	// UserInfo user=list.get(0);
	    	 msg="success";
	    	 map.put("success", "1");
	    	 HttpSession session =getSession();
	    	//用作登录验证
				session.setAttribute("curUser",username);
				session.setAttribute("curUserId", username);
				session.setAttribute("curUserName", username);
			//	session.setAttribute("curName", user.getUserName());
				//session.setAttribute("loginName", domainName);
				session.setAttribute("loginUser", username);
				//session.setAttribute("roleId", "222");
	    	 
	     }
	     else {
	    	 msg = "用户或密码错误";
	    	 map.put("success", "0");
	    	 
	     }
	     map.put("msg", msg);
	     return map;
		 
	      
	       
	    }
		@RequestMapping("/logout")
public String logout(HttpServletRequest request) throws Exception {
	
	request.getSession().invalidate();
	
	return "redirect:/login/index";
}
	public void cross(HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Credentials", "true");
	}
	
}

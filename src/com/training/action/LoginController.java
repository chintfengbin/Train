package com.training.action;

import com.training.common.core.controller.BaseController;
import com.training.model.Login;
import com.training.model.User;
import com.training.service.LoginService;
import com.training.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;




@Controller
@RequestMapping("/login")
public class LoginController  extends BaseController{

	@Autowired
	UserService userService;

	@Autowired
	LoginService loginService;

	 private  String prefix = "login";
	
	 	@RequestMapping("/index")
	    public String add(ModelMap mmap)
	    {
	 		 return prefix + "/login";
	        
	    }

	    //注册，公司系统可能不会开放这个功能
		@RequestMapping("/register")
		@ResponseBody
		public Map<String, Object> register(@RequestParam String userName,
											@RequestParam String passwd) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(passwd)) {
				map.put("msg", "用户名和密码不能为空");
				return map;
			}
			// 验证用户名是否已经注册
			User exsitUser = userService.selectByName(userName);
			if (exsitUser != null) {
				map.put("msg", "该用户名已存在!");
				return map;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(new Date());
			User user = new User();
			Login login=new Login();
			user.setUsername(userName);
	//		user.setRegistTime(format);
	//		user.setStatus("1");
	//		user.setPasswd(Md5Util.MD5(passwd) + userName);
			user.setPassword(passwd);

			login.setLoginName(userName);
			login.setPassword(passwd);

			userService.add(user);
			loginService.add(login);

			map.put("msg", "注册成功");
			return map;
		}

		//登录验证
	 	@RequestMapping("/check")
	    @ResponseBody
	    public Map<String, Object> ajaxLogin(String username, String password,HttpSession session) {

		 Map<String,Object> msg =new HashMap<String,Object>();
		 if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
		 	msg.put("msg","用户名或密码不能为空");
		 	return msg;
		 }

		 User user = userService.selectByName(username);

		 if (user==null){
		 	msg.put("msg","该用户不存在，请注册!");
		 	return msg;
		 }else{

		 	if (user.getPassword().equals(password)){
		 		msg.put("msg","登录成功!");
		 		session.setAttribute("curUser",user);
		 		return msg;
			}else {
		 		msg.put("msg","密码错误请检查后重新输入!");
			}
		 }

		 msg.put("msg","未知错误请联系管理员!");

		 return msg;
	    }


		@RequestMapping("/logout")
		@ResponseBody
		public String logout(HttpServletRequest request) throws Exception {

			request.getSession().invalidate();

			return "success!";
		}


		public void cross(HttpServletResponse response){
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Credentials", "true");
		}
	
}

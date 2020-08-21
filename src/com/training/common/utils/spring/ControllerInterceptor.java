package com.training.common.utils.spring;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.training.common.utils.RequestUtil;
import com.training.common.utils.StringUtils;
import com.training.common.utils.UrlUtils;
import com.ug.secutiry.web.util.AntUrlPathMatcher;





public class ControllerInterceptor implements HandlerInterceptor{

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	//验证忽略列表

	private List<String> ignoreList = Arrays.asList(
			"/login/index",
			"/source/uploadpage",
			"/source/list",
			"/source/listjson",
			"/source/uploade",
			"/user/addpage",
			"/user/add",
			"/login/check"
			
			
	);
	
	//========================================================================
	
	/**
	 * @param request
	 * @param response
	 * @param arg2
	 * @return
	 * @throws Exception
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {

		long startTime = System.currentTimeMillis();
		
		request.setAttribute("startTime", startTime);

		String formValueJson = RequestUtil.getFormValue(request);
		
//		String url = request.getRequestURI();
//		String queryString = request.getQueryString();
//		if(StringUtil.notEmpty(queryString)) {
//			url += "?" + queryString;
//		}
		String baseUrl = request.getServletPath();
		String url = UrlUtils.buildRequestUrl(request);		
		
		//登录url不在忽略之内，且登录用户为空，则转到登录页面
				String loginUser = RequestUtil.getLoginUserName(request);
				if(!urlMatch(baseUrl) && StringUtils.isEmpty(loginUser)) {
					
					logger.info("KM INFO[ControllerInterceptor Log] --> {} start, 验证失败，转到登录页面", url);
					RequestUtil.sendRedirect(request, response, "/login.jsp");
					return true;
				}
		//登录url不在忽略之内，且登录用户为空，则转到登录页面
	
		
		request.setAttribute("interUrl", url);
		request.setAttribute("formValueJson", formValueJson);
		
		logger.info("Interceptor Log --> Url:" + url + " start , Form value:" + formValueJson);
		//System.out.println("Url:" + url + ", Form value:" + formValueJson);
		
		//页面 访问授权

		/*	Module module = moduleManager.getUniqueByUrl(url);
		
		if( module != null ){
			Boolean isAuth =  roleUserManager.IsAuth(module.getId(), RequestUtil.getUser(request).getId() );
			if(isAuth == false){
				logger.info("KM INFO[ControllerInterceptor Log] --> {} start, 没有权限，请申请权限", url);
				RequestUtil.sendRedirect(request, response, "/pages/common/noright.jsp"); 
			}
		}*/


		return true;
		
	
	}
	
	/**
	 * @param request
	 * @param response
	 * @param arg2
	 * @param arg3
	 * @throws Exception
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3) throws Exception {
		
		long startTime = (Long)request.getAttribute("startTime");
		request.removeAttribute("startTime");
		
		long endTime = System.currentTimeMillis();
		
		long processTime = endTime - startTime;
		
		String url = (String)request.getAttribute("interUrl");
		String formValueJson = (String)request.getAttribute("formValueJson");
	
		
		//System.out.println("Handler time:" + (endTime - startTime) + "ms");
		logger.info("Interceptor Log --> Url:" + url + " end. Handler time:" + processTime + "ms");
		
		request.setAttribute("processTime", processTime);
	}
	
	/**
	 * 
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @param arg3
	 * @throws Exception
	 */
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	/**
	 * url 模糊匹配
	 * @param url
	 * @return
	 */
	public boolean urlMatch(String url) {
		AntUrlPathMatcher matcher = new AntUrlPathMatcher();
		
		boolean flag = false;
		
		for(String burl : ignoreList) {
			flag = matcher.pathMatchesUrl(burl, url);
			if(flag) {
				break;
			}
		}
		return flag;
	}
	
}

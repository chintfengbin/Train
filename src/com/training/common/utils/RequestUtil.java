package com.training.common.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.training.model.User;



public class RequestUtil {
	
	private final static Logger logger = LoggerFactory.getLogger(RequestUtil.class);
	
	/**
	 * 通过request得到session
	 * 
	 * @param request
	 * @return
	 */
	public static HttpSession getSession(HttpServletRequest request) {
		return 	request.getSession();
	}

	/**
	 * 获得session范围内的属性值
	 * @param request
	 * @param name
	 * @return
	 */
	public static Object getSessionAttribute(HttpServletRequest request, String name){
		return getSession(request).getAttribute(name);
	}
	
	/**
	 * 获取web站点中指定文件的 服务器路径
	 * @param request
	 * @param name
	 * @return
	 */
	public static String getRealPath(HttpServletRequest request, String name){

		return getSession(request).getServletContext().getRealPath(name);
	}

	
	/**
	 * 获得当前登录用户名
	 * 
	 * @param request
	 * @return
	 */
	public static String getLoginUserName(HttpServletRequest request){
		Object obj = getSession(request).getAttribute("loginUser");
		if(obj == null) return "";
		else return (String)obj;
	}
	
	
	/**
	 * 登录 用户 信息
	 * @param request
	 * @return
	 */
	public static User getUser(HttpServletRequest request){
		if(request == null) return null;
		Object obj = getSession(request).getAttribute("curUser");
		if(obj == null) return new User();
		else return (User)obj;
	}
	
	/**
	 * 获取 域名
	 * @param request
	 * @return
	 */
	public static String getDomain(HttpServletRequest request) {
		Object obj = getSession(request).getAttribute("domain");
		return (String)obj;
	}
	
	/**
	 * Null字符串处理成""
	 * @param strvalue
	 * @return
	 */
	public static String getStringValue(HttpServletRequest request, String paramId) {
		String value = request.getParameter(paramId);
		if (value == null) {
			return "";
		} else {
			return value.trim();
		}
	}
	
	
	public static Long getLong(HttpServletRequest request, String paramId) {
		String value = request.getParameter(paramId);
		if (value == null) {
			return null;
		} else {
			return Long.valueOf(value);
		}
	}
	
	/**
	 * 从 request 的attribute中获取数据
	 * @param request
	 * @param name
	 * @return
	 */
	public static String getAttributeValue(HttpServletRequest request, String name) {
		Object obj = request.getAttribute(name);
		if(obj == null) return "";
		else return obj.toString(); 
	}
	
	/**
	 * 从request中获取id字符串，并将结果转换为String 类型，用于作批量 操作（如：删除、作废）
	 * @param request
	 * @return
	 */
	public static String[] getParamsIdsForString(HttpServletRequest request) {
		String strIds = request.getParameter("id");
		String[] strIdsArr = strIds.split(",");

		return strIdsArr;
	}
	
	/**
	 * 从request中获取paramName变量名的字符串，并将结果转换为String 类型，用于作批量 操作（如：删除、作废）
	 * 通过[,] 分段
	 * @param request
	 * @param paramName
	 * @return
	 */
	public static String[] getParamsIdsForString(HttpServletRequest request, String paramName) {
		String strIds = request.getParameter(paramName);
		String[] strIdsArr = strIds.split(",");

		return strIdsArr;
	}
	
	/**
	 * 从request中获取id字符串，并将结果转换为long 类型，用于作批量 操作（如：删除、作废）
	 * @param request
	 * @return
	 */
	public static Long[] getParamsIdsForLong(HttpServletRequest request) {
		String strIds = request.getParameter("id");
		String[] strIdsArr = strIds.split(",");
		
		Long[] lidsArr = new Long[strIdsArr.length];
		
		for(int i=0; i<strIdsArr.length; i++) {
			lidsArr[i] = Long.valueOf(strIdsArr[i]);
		}
		
		return lidsArr;
	}
	/**
	 * 从request中获取id字符串，并将结果转换为Integer 类型，用于作批量 操作（如：删除、作废）
	 * @param request
	 * @return
	 */
	public static Integer[] getParamsIdsForInteger(HttpServletRequest request) {
		String strIds = request.getParameter("id");
		String[] strIdsArr = strIds.split(",");
		
		Integer[] lidsArr = new Integer[strIdsArr.length];
		
		for(int i=0; i<strIdsArr.length; i++) {
			lidsArr[i] = Integer.valueOf(strIdsArr[i]);
		}
		
		return lidsArr;
	}
	
	/**
	 * 页面重定向
	 * @param request
	 * @param response
	 * @param redirectUrl
	 * @throws Exception
	 */
	public static void sendRedirect(HttpServletRequest request, HttpServletResponse response, String redirectUrl){
		
		String url = request.getContextPath() + redirectUrl;
		
		logger.debug("Chint Debug[RequestUtil Log] --> sendRedirect to url[{}]", url);
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			logger.error("sendRedirect error,", e);
		}
		
	}
	
	/**
	 * 重定向 外部 页面
	 * @param request
	 * @param response
	 * @param redirectUrl
	 * @throws Exception
	 */
	public static void sendOuterRedirect(HttpServletRequest request, HttpServletResponse response, String redirectUrl) throws Exception {
		logger.debug("Chint Debug[RequestUtil Log] --> forward to url[{}]", redirectUrl);
		
		response.sendRedirect(redirectUrl);
	}

	
	/**
	 * 
	 * @param request
	 * @return
	 */
	public static String getDialogParamsString(HttpServletRequest request){
		//弹出式对话框，隐藏参数包含页面
		String cmp = request.getParameter("cmp");
		if(cmp==null) cmp = "";
		String prefix =  request.getParameter("prefix");
		if(prefix==null) prefix = "";
		String zindex =  request.getParameter("zindex");
		if(zindex==null) zindex = "";
		
		StringBuffer str = new StringBuffer();
		
		str.append("cmp=" + cmp );
		str.append("&prefix=" + prefix );
		str.append("&zindex=" + zindex);
		
		System.out.println(str.toString());
		
		return str.toString();
	}
	
	/**
	 * 获取 系统host 路径
	 * @param request
	 * @return
	 */
	public static String getHostBase(HttpServletRequest request) {
		String servername = request.getServerName();
		int serverport = request.getServerPort();
		String base = request.getContextPath();
		
		return "http://" + servername + ":" + serverport + base;
	}

	/**
	 * 获取当前登录用户所使用的语言
	 * 
	 * 在用户登录的时候获取，有两种方式
	 * 1、用户选择
	 * 2、 根据IE的地区设置
	 * 
	 * @param request
	 * @return
	 */
	public static String getLanguage(HttpServletRequest request) {
		return (String)getSession(request).getAttribute("language_FK");
	}
	
	/**
	 * 获取form 提交过来的所有参数
	 * 
	 * @param request
	 * @return
	 */
	public static String getFormValue(HttpServletRequest request) {
		Enumeration paramNames = request.getParameterNames();
		Map params = new TreeMap();

		while (paramNames != null && paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();

			String[] values = request.getParameterValues(paramName);
			if (values == null || values.length == 0) {
				// Do nothing, no values found at all.
			}
			else if (values.length > 1) {
				params.put(paramName, values);
			}
			else {
				params.put(paramName, values[0]);
			}
		}
		
		return JSONUtil.objectToJson(params);
	}
	
	/**
	 * 获取form 提交过来的所有参数
	 * 
	 * @param request
	 * @return Map
	 */
	public static Map getFormValueMap(HttpServletRequest request) {
		Enumeration paramNames = request.getParameterNames();
		Map params = new TreeMap();

		while (paramNames != null && paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();

			String[] values = request.getParameterValues(paramName);
			if (values == null || values.length == 0) {
				// Do nothing, no values found at all.
			}
			else if (values.length > 1) {
				params.put(paramName, values);
			}
			else {
				params.put(paramName, values[0]);
			}
		}
		return params;
	}
	
}

package com.training.common.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JSONUtil {

	private static final Logger logger = LoggerFactory.getLogger(JSONUtil.class);
	

	
	
	public static String objectToJson(Object obj){
		String json = JSONObject.fromObject(obj).toString();
		logger.info("Render:" + json);
		return json;
	}
	
	/**
	 * collection type convert to json
	 * @param collection
	 * @return
	 */
	public static String collectionToJson(Collection collection) {
		String json = JSONArray.fromObject(collection).toString();
		logger.info("Render:" + json);
		return json;
	}
	

	
	public static <T> T jsonToObject(String json, Class<T> clazz ) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		return (T)JSONObject.toBean(jsonObject, clazz);
	}
	
	/**
	 * json string convert to Collection type object(eg. List)
	 * @param jsonString
	 * @param beanClass
	 * @return
	 */
	public static Collection jsonToCollection(String jsonString, Class beanClass){
		
		long start = System.currentTimeMillis();
		
		JSONArray arr = JSONArray.fromObject(jsonString);
		Collection coll = JSONArray.toCollection(arr, beanClass);
		long end = System.currentTimeMillis();
		
		long processTime = end-start; //����action��������ʱ��
		logger.debug("Chint Debug[JSONUtil.jsonToCollection] --> process time(ms): " + processTime);
		return coll;
	}
	
	

	public static void main(String[] args) {
		Map map = new HashMap();
		map.put("result", "1");
		String json = JSONUtil.objectToJson(map);
		System.out.println(json);
		Object obj = JSONUtil.jsonToObject(json, Map.class);
		Map m = (Map)obj;
		System.out.println(m.get("result"));
	}
	
}

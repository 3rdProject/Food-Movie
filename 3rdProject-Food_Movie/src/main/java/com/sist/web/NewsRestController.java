package com.sist.web;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.manager.*;
@RestController
public class NewsRestController {
	
	@Autowired
	private NewsManager nMgr;
	
	@RequestMapping(value="news/rest_news_find.do",produces="text/plain;charset=UTF-8")
	public String rest_news_find(String ss)
	{
		String json="";
		List<NewsVO> list=nMgr.newsFindData(ss); 
		
		try
		{
			JSONArray arr=new JSONArray(); 
			for(NewsVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("title", vo.getTitle());
				obj.put("desc", vo.getDescription());
				obj.put("author", vo.getAuthor());
				obj.put("link", vo.getLink());
				obj.put("poster", vo.getPoster());
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch(Exception ex) {}
		return json;
	}
}

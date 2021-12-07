package com.sist.web;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.dao.*;

@RestController
@CrossOrigin("http://localhost:3000")
public class MapRestController {
	@Autowired
	private MapDAO dao;
	
	@RequestMapping(value="map/rest_map_main.do",produces="text/plain;charset=UTF-8")
	public String rest_map_main(String page){
		String json="";
		Map map=new HashMap();
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=5;
		int start=rowSize*curpage-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<FoodVO> list=dao.mapListData(map);
		int total=dao.mapTotal();
		int totalpage=dao.mapTotalpage();
		int i=0;
		try {
			JSONArray arr=new JSONArray();
			// no, poster, rname, score, address, tel, rtype, price, openhour
			for(FoodVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("rname", vo.getRname());
				obj.put("score", vo.getScore());
				String addr=vo.getAddr();
				addr=addr.substring(0,addr.indexOf("지"));
				obj.put("addr", addr);
				String poster=vo.getPoster();
				poster=poster.substring(0,poster.indexOf("^"));
				obj.put("poster", poster);
				obj.put("tel",vo.getTel());
				obj.put("rtype", vo.getRtype());
				obj.put("price",vo.getPrice());
				obj.put("openhour", vo.getOpenhour());
				if(i==0) {
					obj.put("totalpage", totalpage);
					obj.put("total", total);
				}
				arr.add(obj);
				i++;
			}
			json=arr.toJSONString();
		}catch(Exception ex) {}
		
		return json;
	}
	@RequestMapping(value="map/rest_map_search.do",produces="text/plain;charset=UTF-8")
	public String rest_map_search(String page,String ss) {
			String json="";
			Map map=new HashMap();
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=20;
			int start=rowSize*curpage-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("ss", ss);
			List<FoodVO> list=dao.searchListData(map);
			int totalpage=dao.searchTotalpage(map);
			int total=dao.searchTotal(map);
			int i=0;
			try {
				JSONArray arr=new JSONArray();
				for(FoodVO vo:list){
					JSONObject obj=new JSONObject();
					obj.put("no", vo.getNo());
					obj.put("rname", vo.getRname());
					obj.put("score", vo.getScore());
					obj.put("addr", vo.getAddr());
					obj.put("tel", vo.getAddr());
					obj.put("tel",vo.getTel());
					obj.put("rtyoe", vo.getRtype());
					obj.put("price",vo.getPrice());
					obj.put("openhour", vo.getOpenhour());
					if(i==0) {
						obj.put("totalpage", totalpage);
						obj.put("total", total);
					}
					arr.add(obj);
					i++;
				}
				json=arr.toJSONString();
			}catch(Exception ex) {}
			return json;
	}
}

package com.sist.web;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FoodRestController {
	@Autowired
	private FoodDAO dao;
	
	@GetMapping(value="restaurant/rest_list.do",produces="text/plain;charset=UTF-8")
	public String rest_list(int rno, int page)
	{
		System.out.println("rno="+rno);
		String json="";
		try
		{
			int curpage=page;
			int rowSize=12;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=(rowSize*curpage);
			
			Map map=new HashMap();
			map.put("rno",rno);
			if(rno==1) {
				map.put("start", start);
				map.put("end", end);
			}
			else if(rno==2) {
				map.put("start", start+200);
				map.put("end", end+200);
			}
			List<FoodVO> list=dao.foodSelectData(map);
			int totalpage=dao.foodTotalPage(rno);
			
			JSONArray arr=new JSONArray();
			int i=0;
			
			for(FoodVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("rno", vo.getRno());
				obj.put("no", vo.getNo());
				obj.put("rname", vo.getRname());
				String poster=vo.getPoster();
				poster=poster.substring(0,poster.indexOf("^"));
				obj.put("poster", poster);
				obj.put("score", vo.getScore());
					
				if(i==0)
				{
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				i++;
			}
			json=arr.toJSONString();
			System.out.println(json);
		}catch(Exception ex) {ex.printStackTrace();}
		return json;
	}
	
	@GetMapping(value="restaurant/rest_detail.do",produces="text/plain;charset=UTF-8")
	public String rest_detail(int rno)
	{
		String json="";
		try
		{
			JSONArray arr=new JSONArray();
			List<FoodVO> list=dao.categoryFoodData(rno);
			//List<FoodVO> list=dao.foodDetailData(no);
			for(FoodVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("rno", vo.getRno());
				obj.put("rname", vo.getRname());
				obj.put("addr", vo.getAddr().substring(0,vo.getAddr().indexOf("지")));
				obj.put("poster", vo.getPoster().substring(0,vo.getPoster().indexOf("^")));
				obj.put("tel", vo.getTel());
				obj.put("openhour", vo.getOpenhour());
				obj.put("parking", vo.getParking());
				obj.put("rtype", vo.getRtype());
				obj.put("menu", vo.getMenu());
				obj.put("price", vo.getPrice());
				obj.put("good", vo.getGood());
				obj.put("soso", vo.getSoso());
				obj.put("bad", vo.getBad());
				obj.put("score", vo.getScore());
				obj.put("rtag", vo.getRtag());
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch(Exception ex) {}
		return json;
	}
	
	@RequestMapping(value="restaurant/rest_info.do",produces="text/plain;charset=UTF-8")
	public String rest_info(int rno)
	{
		String json="";
		try
		{
			JSONObject obj=new JSONObject();
			FoodVO vo=dao.categoryInfoData(rno);
			obj.put("rname", vo.getRname());
			obj.put("score", vo.getScore());
			json=obj.toJSONString();
		}catch(Exception ex) {}
		return json;
	}
	
	@RequestMapping(value="restaurant/rest_detail2.do",produces="text/plain;charset=UTF-8")
	public String rest_detail2(int no)
	{
		String json="";
		try
		{
			FoodVO vo=dao.foodDetailData(no);
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("rname", vo.getRname());
			obj.put("poster", vo.getPoster());
			obj.put("addr", vo.getAddr());
			obj.put("tel", vo.getTel());
			obj.put("openhour", vo.getOpenhour());
			obj.put("parking", vo.getParking());
			obj.put("rtype", vo.getRtype());
			obj.put("menu", vo.getMenu());
			obj.put("price", vo.getPrice());
			obj.put("good", vo.getGood());
			obj.put("soso", vo.getSoso());
			obj.put("bad", vo.getBad());
			obj.put("score", vo.getScore());
			obj.put("rtag", vo.getRtag());
			
			json=obj.toJSONString();
		}catch(Exception ex) {}
		return json;
	}

}

package com.sist.web;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.manager.MovieManager;
import com.sist.manager.NewsManager;
import com.sist.vo.*;

@RestController
public class MovieRestController {
	@Autowired
	private MovieDAO dao;
	
	@Autowired
	private MovieManager mgr;
	
	// 영화 목록
	@RequestMapping(value="movie/rest_list.do", produces="text/plain;charset=UTF-8")
	public String movie_list(int cno, int page)
	{
		System.out.println("cno="+cno);
		String json="";
		try
		{
//			if(spage==null)
//				spage="1";
//			int page=Integer.parseInt(spage);
			
			int curpage=page;
			int rowSize=12;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=(rowSize*curpage);
			
//			if(cno==null)
//				cno="1";
//			int no=Integer.parseInt(cno);
			
			Map map=new HashMap();
			map.put("cno", cno);
			if(cno==1) {
				map.put("start", start);
				map.put("end", end);
			}
			else if(cno==2) {
				map.put("start", start+92);
				map.put("end", end+92);
			}
			List<MovieVO> list=dao.movieListData(map);
			int totalpage=dao.movieTotalPage(cno);
			
			JSONArray arr=new JSONArray();
			int i=0;
			// mno, cno, title, director, grade, actor, regdate
			for(MovieVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("cno", vo.getCno());
				obj.put("mno", vo.getMno());
				String title=vo.getTitle();
				if(title.length()>22)
				{
					title=title.substring(0,22)+"...";
				}
				obj.put("title", title);
				String director=vo.getDirector();
				if(director.length()>8)
				{
					director=director.substring(0,8)+"...";
				}
				obj.put("director", director);
				obj.put("grade", vo.getGrade());
				String actor=vo.getActor();
				if(actor.length()>30)
				{
					actor=actor.substring(0,30)+"...";
				}
				obj.put("actor", actor);
				obj.put("regdate", vo.getRegdate());
				obj.put("genre", vo.getGenre());
				obj.put("poster", vo.getPoster());
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
	
	// 영화 상세보기
	@GetMapping(value="movie/rest_detail.do", produces="text/plain;charset=UTF-8")
	public String rest_detail(String no)
	{
		System.out.println("mno="+no);
		String json="";
		try
		{
			if(no==null)
				no="1";
			int mno=Integer.parseInt(no);
			MovieVO vo=dao.movieDetailData(mno);
			JSONObject obj=new JSONObject();
			obj.put("mno", vo.getMno());
			obj.put("cno", vo.getCno());
			obj.put("title", vo.getTitle());
			obj.put("grade", vo.getGrade());
			obj.put("reserve", vo.getReserve());
			obj.put("genre", vo.getGenre());
			obj.put("time", vo.getTime());
			obj.put("regdate", vo.getRegdate());
			obj.put("director", vo.getDirector());
			obj.put("actor", vo.getActor());
			obj.put("showuser", vo.getShowuser());
			obj.put("poster", vo.getPoster());
			obj.put("story", vo.getStory());
			obj.put("key", vo.getKey());
			obj.put("hit", vo.getHit());
			obj.put("score", vo.getScore());
			json=obj.toJSONString();
			System.out.println(json);
		}catch(Exception ex) {ex.printStackTrace();}
		return json;
	}
	
	// 영화 통합 검색
	@GetMapping(value="movie/rest_search.do", produces="text/plain;charset=UTF-8")
	public String movie_search(String ss)
	{
		String json="";
		try
		{
//			Map map=new HashMap();
//			map.put("fsArr", fs);
//			for(String s:fs)
//			{
//				System.out.println(s);
//			}
//			map.put("ss" , ss);
			int total=dao.searchTotal(ss);
			List<MovieVO> list=dao.movieAllSearchData(ss);
			System.out.println(ss);
			JSONArray arr=new JSONArray();
			int i=0;
			// mno, title, poster, director, regdate, grade, actor
			for(MovieVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("mno", vo.getMno());
				obj.put("title", vo.getTitle());
				obj.put("poster", vo.getPoster());
				obj.put("director", vo.getDirector());
				obj.put("regdate", vo.getRegdate());
				obj.put("grade", vo.getGrade());
				obj.put("actor", vo.getActor());
				if(i==0)
					obj.put("total", total);
				arr.add(obj);
				i++;
			}
			json=arr.toJSONString();
			
		}catch(Exception ex) {ex.printStackTrace();}
		return json;
	}
	
	// 실시간 영화 데이터
	@RequestMapping(value="movie/rest_chart.do", produces="text/plain;charset=UTF-8"/*한글이 넘어갈떄 사용*/)
	public String movie_rest_list(String no)
	{
		if(no==null)
			no="1";
		int ino=Integer.parseInt(no);
		String json=mgr.movieListData(ino);
		try
		{
			JSONArray temp=new JSONArray();
			JSONParser jp=new JSONParser();
			JSONArray arr=(JSONArray)jp.parse(json);
			for(int i=0; i<arr.size(); i++) 
			{
				JSONObject obj=(JSONObject)arr.get(i);
				String story=(String)obj.get("synop");
				story=story.replaceAll("[^A-Za-z가-힣0-9]", ""); 
				temp.add(obj);
			}
			json=temp.toJSONString();
		}catch(Exception ex) {}
		System.out.println(json);
		return json;
	}
}

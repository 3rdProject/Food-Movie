package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.dao.*;
@Controller
@RequestMapping("movie/")
public class MovieController {
	@Autowired
	private MovieDAO dao;
	
	// 영화 목록
	@GetMapping("list.do")
	public String rest_list(Model model)
	{
		model.addAttribute("main_jsp", "../movie/list.jsp");
		return "main/main";
	}
	
	// 영화 상세보기
	@GetMapping("detail.do")
	public String rest_detail(String no, Model model)
	{
		if(no==null)
			no="1";
		int mno=Integer.parseInt(no);
		model.addAttribute("no", mno);
		model.addAttribute("main_jsp", "../movie/detail.jsp");
		return "main/main";
	}
	
	// 영화 검색
	@GetMapping("search.do")
	public String rest_search(String[] fs, String ss, Model model)
	{
		model.addAttribute("ss", ss);
		model.addAttribute("main_jsp", "../movie/search.jsp");
		return "main/main";
	}
	
	@RequestMapping("chart.do")
	public String movie_chart(Model model)
	{
		model.addAttribute("main_jsp", "../movie/chart.jsp");
		return "main/main";
	}
}

package com.sist.web;
import java.util.*;
import com.sist.manager.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class NewsController {
	@Autowired
	private NewsManager mgr;
	
	@RequestMapping("news/news_find.do")
	public String news_find(Model model) // model => 전송 객체 
	{
//		if(ss==null)
//			ss="영화";
//		List<NewsVO> list=mgr.newsFindData(ss);
		model.addAttribute("main_jsp", "../news/news_find.jsp");
//		model.addAttribute("list", list);
		return "main/main";
	}
}

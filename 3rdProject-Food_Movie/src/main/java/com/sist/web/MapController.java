package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import java.util.*;
import com.sist.vo.*;

@Controller
public class MapController {
	@Autowired
	private MapDAO dao;
	
	@RequestMapping("map/map_main.do")
	public String map_main(String page,String rgn1Nm,Model model) {
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		
		
		List<FoodVO> list=dao.mapListData(map);
		int totalpage=dao.mapTotalpage();
		int total=dao.mapTotal();
		
		if(rgn1Nm!=null) {
			map.put("ss", rgn1Nm);
			list=dao.searchListData(map);
			totalpage=dao.searchTotalpage(map);
			total=dao.searchTotal(map);
		}
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		model.addAttribute("total",total);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("map_list", "../map/map_list.jsp");
		model.addAttribute("main_jsp", "../map/map_main.jsp");
		return "main/main";
	}
}

package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
@Controller
@RequestMapping("restaurant/")
public class FoodController {
	@Autowired
	private FoodDAO dao;

	@GetMapping("list.do")
	public String res_list(Model model)
	{
		model.addAttribute("main_jsp", "../restaurant/list.jsp");
		return "main/main";
	}
	
	@GetMapping("detail.do")
	public String res_detail(int no,Model model)
	{
		model.addAttribute("no", no);
		model.addAttribute("main_jsp", "../restaurant/detail.jsp");
		return "main/main";
	}
}

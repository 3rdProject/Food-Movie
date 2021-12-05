package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.FoodVO;
@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<FoodVO> foodSelectData(Map map)
	{
		return mapper.foodSelectData(map);
	}
	
	public List<FoodVO> foodListData(int rno)
	{
		return mapper.foodListData(rno);
	}
	
	public int foodTotal()
	{
		return mapper.foodTotal();
	}
	
	public FoodVO categorySelectData(int rno)
	{
		return mapper.categorySelectData(rno);
	}
	
	public int foodTotalPage(int rno)
	{
		return mapper.foodTotalPage(rno);
	}
	
	public FoodVO categoryInfoData(int rno)
	{
		return mapper.categoryInfoData(rno);
	}
	
	public List<FoodVO> categoryFoodData(int rno)
	{
		return mapper.categoryFoodData(rno);
	}
	
	public List<FoodVO> foodDetailData(int no)
	{
		return mapper.foodDetailData(no);
	}
}

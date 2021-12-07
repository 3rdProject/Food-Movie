package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import java.util.*;

@Repository
public class MapDAO {
	@Autowired
	private MapMapper mapper;
	
	public List<FoodVO> mapListData(Map map){
		return mapper.mapListData(map);
	}
	
	public FoodVO shopDetailData(int no) {
		return mapper.mapDetailData(no);
	}
	public List<FoodVO> searchListData(Map map){
		return mapper.searchListData(map);
	}
	public int mapTotalpage() {
		return mapper.mapTotalpage();
	}
	public int searchTotalpage(Map map) {
		return mapper.searchTotalpage(map);
	}
	
	public int searchTotal(Map map) {
		return mapper.searchTotal(map);
	}
	
	public int mapTotal() {
		return mapper.mapTotal();
	}
}

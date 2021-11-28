package com.sist.dao;
import java.util.*;
import com.sist.vo.*;


import org.apache.ibatis.annotations.Select;

public interface FoodMapper {
	
	@Select({
			"<script>"
			+"SELECT no,rno,poster,rname,score "
			+"FROM trip_r "
			+"WHERE "
			+"<if test='rno==1'>"
			+"no BETWEEN 1 AND 200"
			+"</if>"
			+"<if test='rno==2'>"
			+"no BETWEEN 201 AND 5000"
			+"</if>"
			+"</script>"})
	public List<FoodVO> foodSelectData(Map map);
	
	@Select("SELECT no,rname,score,poster "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public FoodVO categorySelectData(int rno);
	
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM trip_r")
	public int foodTotalPage(int rno);
	
	@Select("SELECT rname,score "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public FoodVO categoryInfoData(int rno);
	
	@Select("SELECT no,rname,addr,tel,rtype,poster "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public List<FoodVO> categoryFoodData(int rno);
	
	@Select("SELECT * FROM trip_r "
			+"WHERE rno=#{no}")
	public FoodVO foodDetailData(int no);
}

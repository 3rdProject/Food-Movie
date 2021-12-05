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
			+"no BETWEEN #{start} AND #{end}"
			+"</if>"
			+"<if test='rno==2'>"
			+"no BETWEEN #{start} AND #{end}"
			+"</if>"
			+"</script>"})
	public List<FoodVO> foodSelectData(Map map);
	
	@Select("SELECT no,rno,poster,rname,score "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public List<FoodVO> foodListData(int rno);
	
	@Select("SELECT COUNT(*) FROM trip_r")
	public int foodTotal();
	
	@Select("SELECT no,rname,score,poster "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public FoodVO categorySelectData(int rno);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM trip_r "
			+"WHERE rno=#{rno}")
	public int foodTotalPage(int rno);
	
	@Select("SELECT rname,score "
			+"FROM trip_r "
			+"WHERE rno=#{rno}")
	public FoodVO categoryInfoData(int rno);
	
	@Select("SELECT * "
			+"FROM trip_r "
			+"WHERE no=#{rno}")
	public List<FoodVO> categoryFoodData(int rno);
	
	@Select("SELECT * FROM trip_r "
			+"WHERE no=#{no}")
	public List<FoodVO> foodDetailData(int no);
}

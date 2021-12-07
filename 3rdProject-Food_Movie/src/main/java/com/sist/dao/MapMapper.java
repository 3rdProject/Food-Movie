package com.sist.dao;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
public interface MapMapper {
	@Select("SELECT no, poster, rname, score, addr, tel, rtype, price, openhour, num "
			+ "FROM (SELECT no, poster, rname, score, addr, tel, rtype, price, openhour,rownum as num "
			+ "FROM (SELECT no, poster, rname, score, addr, tel, rtype, price, openhour "
			+ "FROM trip_r)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FoodVO> mapListData(Map map);
	
	@Select("SELECT no, poster, rname, score, addr, tel, rtype, price, openhour WHERE no=#{no}")
	public FoodVO mapDetailData(int no);
	
	@Select("SELECT no, poster, rname, score, addr, tel, rtype, price, openhour, num "
			+ "FROM (SELECT no, poster, rname, score, addr, tel, rtype, price, openhour, rownum as num "
			+ "FROM (SELECT no, poster, rname, score, addr, tel, rtype, price, openhour "
			+ "FROM trip_r WHERE (rname||addr) like '%'||#{ss}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FoodVO> searchListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM trip_r")
	public int mapTotalpage();
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM trip_r WHERE (rname||addr) like '%'||#{ss}||'%'")
	public int searchTotalpage(Map map);
	
	@Select("SELECT COUNT(*) FROM trip_r WHERE (rname||addr) like '%'||#{ss}||'%'")
	public int searchTotal(Map map);
	
	@Select("SELECT COUNT(*) FROM trip_r")
	public int mapTotal();
}

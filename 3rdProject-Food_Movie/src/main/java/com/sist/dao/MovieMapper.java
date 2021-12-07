package com.sist.dao;
/*
 * MNO      NOT NULL NUMBER         
CNO               NUMBER         
TITLE    NOT NULL VARCHAR2(500)  
GRADE    NOT NULL VARCHAR2(100)  
RESERVE           VARCHAR2(50)   
GENRE    NOT NULL VARCHAR2(200)  
TIME              VARCHAR2(30)   
REGDATE           VARCHAR2(200)  
DIRECTOR NOT NULL VARCHAR2(100)  
ACTOR             VARCHAR2(1000) 
SHOWUSER          VARCHAR2(30)   
POSTER   NOT NULL VARCHAR2(350)  
STORY             CLOB           
KEY               VARCHAR2(50)   
HIT               NUMBER         
SCORE             NUMBER(3,2)
 */

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface MovieMapper {

	@Select({
		"<script>"
		+ "SELECT mno, cno, title, director, grade, actor, regdate, genre, poster "
		+ "FROM project_movie "
		+ "WHERE "
		+ "<if test='cno==1'>"
		+ "mno BETWEEN #{start} AND #{end}"
		+ "</if>"
		+ "<if test='cno==2'>"
		+ "mno BETWEEN #{start} AND #{end}"
		+ "</if>"
		+ "</script>"
	})
	public List<MovieVO> movieListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
			+ "WHERE cno=#{cno}")
	public int movieTotalPage(int cno);
	
	@Select("SELECT * FROM project_movie "
			+ "WHERE mno=#{mno}")
	public MovieVO movieDetailData(int mno);

	@Select("SELECT mno, title, poster, director, regdate, grade, actor "
			+ "FROM project_movie WHERE (title||actor||genre) LIKE '%'||#{ss}||'%'")
	public List<MovieVO> movieAllSearchData(String ss);
	
	@Select("SELECT COUNT(*) FROM project_movie WHERE (title||actor||genre) like '%'||#{ss}||'%'")
	public int searchTotal(String ss);
	
//	@Select({
//		"<script>"
//		+ "SELECT mno, title, poster, director, regdate, grade, actor "
//		+ "FROM project_movie "
//		+ "WHERE "
//		+ "<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">"
//		+ "<foreach collection=\"fsArr\" item=\"fs\">"
//		+ "<trim prefix=\"OR\">"
//		+ "<choose>"
//		+ "<when test=\"fs=='T'.toString()\">"
//		+ "title LIKE '%'||#{ss}||'%'"
//		+ "</when>"
//		+ "<when test=\"fs=='G'.toString()\">"
//		+ "genre LIKE '%'||#{ss}||'%'"
//		+ "</when>"
//		+ "<when test=\"fs=='D'.toString()\">"
//		+ "director LIKE '%'||#{ss}||'%'"
//		+ "</when>"
//		+ "<when test=\"fs=='A'.toString()\">"
//		+ "actor LIKE '%'||#{ss}||'%'"
//		+ "</when>"
//		+ "</choose>"
//		+ "</trim>"
//		+ "</foreach>"
//		+ "</trim>"
//		+ "</script>"
//	})
//	public List<MovieVO> movieAllSearchData(Map map);
//	
//
//	
//	// 제목
//	@Select("SELECT mno, title, poster, director, regdate, grade, actor, num "
//			+ "FROM (SELECT mno, title, poster, director, regdate, grade, actor, rownum as num "
//			+ "FROM (SELECT /*+ INDEX_ASC(project_movie pm_mno_pk)*/mno, title, poster, director, regdate, grade, actor "
//			+ "FROM project_movie "
//			+ "WHERE title LIKE '%'||#{title}||'%')) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<MovieVO> movieTitleSearchData(Map map);
//	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
//			+ "WHERE title LIKE '%'||#{title}||'%'")
//	public int movieTitleTotalPage(String title);
//	
//	// 장르
//	@Select("SELECT mno, title, poster, director, regdate, grade, actor, num "
//			+ "FROM (SELECT mno, title, poster, director, regdate, grade, actor, rownum as num "
//			+ "FROM (SELECT /*+ INDEX_ASC(project_movie pm_mno_pk)*/mno, title, poster, director, regdate, grade, actor "
//			+ "FROM project_movie "
//			+ "WHERE genre LIKE '%'||#{genre}||'%')) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<MovieVO> movieGenreSearchData(Map map);
//	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
//			+ "WHERE genre LIKE '%'||#{genre}||'%'")
//	public int movieGenreTotalPage(String genre);
//	
//	// 감독
//	@Select("SELECT mno, title, poster, director, regdate, grade, actor, num "
//			+ "FROM (SELECT mno, title, poster, director, regdate, grade, actor, rownum as num "
//			+ "FROM (SELECT /*+ INDEX_ASC(project_movie pm_mno_pk)*/mno, title, poster, director, regdate, grade, actor "
//			+ "FROM project_movie "
//			+ "WHERE director LIKE '%'||#{director}||'%')) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<MovieVO> movieDirectorSearchData(Map map);
//	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
//			+ "WHERE director LIKE '%'||#{director}||'%'")
//	public int movieDirectorTotalPage(String director);
//	
//	// 배우
//	@Select("SELECT mno, title, poster, director, regdate, grade, actor, num "
//			+ "FROM (SELECT mno, title, poster, director, regdate, grade, actor, rownum as num "
//			+ "FROM (SELECT /*+ INDEX_ASC(project_movie pm_mno_pk)*/mno, title, poster, director, regdate, grade, actor "
//			+ "FROM project_movie "
//			+ "WHERE actor LIKE '%'||#{actor}||'%')) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<MovieVO> movieActorSearchData(Map map);
//	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
//			+ "WHERE actor LIKE '%'||#{actor}||'%'")
//	public int movieActorTotalPage(String actor);
	
}

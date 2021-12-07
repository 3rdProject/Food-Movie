package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.MovieVO;

@Repository
public class MovieDAO {
	@Autowired
	private MovieMapper mapper;
	
	// 영화 리스트
	public List<MovieVO> movieListData(Map map)
	{
		return mapper.movieListData(map);
	}
	public int movieTotalPage(int cno)
	{
		return mapper.movieTotalPage(cno);
	}
	
	// 영화 상세보기
	public MovieVO movieDetailData(int mno)
	{
		return mapper.movieDetailData(mno);
	}
	
	// 검색
	public List<MovieVO> movieAllSearchData(String ss)
	{
		return mapper.movieAllSearchData(ss);
	}
	
	public int searchTotal(String ss)
	{
		return mapper.searchTotal(ss);
	}
/*	
	// 검색
	// 전체 검색
	public List<MovieVO> movieAllSearchData(Map map)
	{
		return mapper.movieAllSearchData(map);
	}
	// 제목 검색
	public List<MovieVO> movieTitleSearchData(Map map)
	{
		return mapper.movieTitleSearchData(map);
	}
	public int movieTitleTotalPage(String title)
	{
		return mapper.movieTitleTotalPage(title);
	}
	// 장르 검색
	public List<MovieVO> movieGenreSearchData(Map map)
	{
		return mapper.movieGenreSearchData(map);
	}
	public int movieGenreTotalPage(String genre)
	{
		return mapper.movieGenreTotalPage(genre);
	}
	// 감독 검색
	public List<MovieVO> movieDirectorSearchData(Map map)
	{
		return mapper.movieDirectorSearchData(map);
	}
	public int movieDirectorTotalPage(String director)
	{
		return mapper.movieDirectorTotalPage(director);
	}
	// 배우 검색
	public List<MovieVO> movieActorSearchData(Map map)
	{
		return mapper.movieActorSearchData(map);
	}
	public int movieActorTotalPage(String actor)
	{
		return mapper.movieActorTotalPage(actor);
	}
*/
}

package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.CinemaVO;

public interface CinemaDAO {
	
	// 영화관 검색
	@Select("select cinemaname from CINEMA where cinemaname=#{cinemaname}")
	public String cinemaSearch(String cinemaname);
	
	// 영화관 등록
	@Insert("insert into CINEMA values(#{cinemaname},#{tel},#{addr},#{local},#{content},#{oldname},#{newname},#{url})")
	public int cinemaInsert(CinemaVO cinemaVO);
	
	// 영화관 리스트
	@Select("select cinemaname from CINEMA order by cinemaname")
	public List<CinemaVO> cinemaList();
	
}

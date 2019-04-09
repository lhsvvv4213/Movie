package com.pot.dao;

import org.apache.ibatis.annotations.Insert;

import com.pot.dto.CinemaImgVO;
import com.pot.dto.CinemaVO;

public interface CinemaDAO {

	@Insert("insert into CINEMA values(#{cinemaname},#{tel},#{addr},#{local},#{content})")
	public int cinemaInsert(CinemaVO cinemaVO);
	
	@Insert("insert into CINEMAIMG values(#{cinemaname},#{oldname},#{newname},#{url})")
	public int cinemaImgInsert(CinemaImgVO cinemaImgVO);
	
}

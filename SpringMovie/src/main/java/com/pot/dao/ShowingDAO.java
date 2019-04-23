package com.pot.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.ShowingVO;

public interface ShowingDAO {
	
	// 상영정보 등록
	@Insert("insert into SHOWING select ifnull(max(showingcode)+1,11),#{moviename},#{cinemaname} from SHOWING")
	public int showingInsert(ShowingVO showingVO);
	
	// 상영코드 검색
	@Select("select showingcode from SHOWING where cinemaname=#{cinemaname} and moviename=#{moviename}")
	public String showingCodeSearch(ShowingVO showingVO);
	
}

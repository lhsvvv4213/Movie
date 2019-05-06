package com.pot.dao;

import java.util.List;

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
	
	// 예매할 영화관 리스트
	@Select("select cinemaname from SHOWING where moviename=#{moviename} order by cinemaname")
	public List<ShowingVO> cinemaList(String moviename); 
	
}

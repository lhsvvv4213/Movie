package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface SeatDAO {
	
	// 모든 좌석 가져오기
	@Select("select seat from SEAT where screencode=#{screencode} order by seat")
	public List<String> seatList(String screencode);

}

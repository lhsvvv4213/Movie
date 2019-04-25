package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pot.dto.JoinVO;

public interface ReserveDAO {

	// 영화예매 리스트
	@Select("select s.moviename,t.screencode,t.startdate,t.starttime,t.endtime,r.seatcount from RESERVE r,TIME t,SHOWING s where r.timecode=t.timecode and t.showingcode=s.showingcode and r.id=#{id} order by reservecode desc")
	public List<JoinVO> getReserveList(String id);
	
}

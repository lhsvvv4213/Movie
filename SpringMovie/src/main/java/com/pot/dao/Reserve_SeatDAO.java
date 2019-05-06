package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.Reserve_SeatVO;

public interface Reserve_SeatDAO {
	
	// 예매좌석 가져오기
	@Select("select seatcode from RESERVE_SEAT where timecode=(select timecode from TIME where startdate=#{startdate} and starttime=#{starttime} and screencode=#{screencode}) order by seatcode")
	public List<String> reserveSeatList(Map<String, Object> map);
	
	// 예매좌석 삽입
	@Insert("insert into RESERVE_SEAT select ifnull(max(reserve_seatcode)+1,1),#{seatcode},#{reservecode},#{timecode} from RESERVE_SEAT")
	public void reserveSeatInsert(Reserve_SeatVO reserve_seatVO);
	
	// 예매좌석 취소
	@Delete("delete from RESERVE_SEAT where reservecode=#{reservecode}")
	public void reserveSeatDelete(String reservecode);
	
}

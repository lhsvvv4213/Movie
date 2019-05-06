package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.JoinVO;
import com.pot.dto.ReserveVO;

public interface ReserveDAO {

	// 영화예매 리스트
	@Select("select s.moviename,m.newname,t.screencode,t.startdate,t.starttime,t.endtime,r.seatcount from RESERVE r,TIME t,SHOWING s,MOVIE m where m.moviename=s.moviename and r.timecode=t.timecode and t.showingcode=s.showingcode and r.id=#{id} order by reservecode desc")
	public List<JoinVO> getReserveList(String id);
	
	// 영화예매
	@Insert("insert into RESERVE values(#{reservecode},#{seatcount},#{price},#{point},#{id},#{timecode})")
	public int reserveInsert(ReserveVO reserveVO);
	
	// 예매코드
	@Select("select reservecode from RESERVE where id=#{id} and timecode=#{timecode}")
	public String reserveCode(Map<String, Object> map);
	
	// 예매 취소
	@Select("select reservecode,point from RESERVE where timecode=(select timecode from TIME where startdate=#{startdate} and starttime=#{starttime} and screencode=#{screencode}) and id=#{id} and seatcount=#{seatcount}")
	public ReserveVO reserveCheck(Map<String, Object> map);
	
	@Delete("delete from RESERVE where reservecode=#{reservecode}")
	public void reserveDelete(String reservecode);
}

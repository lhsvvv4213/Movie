package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.JoinVO;

public interface TimeDAO {
	
	// 영화시간 등록
	@Insert("insert into TIME select ifnull(max(timecode)+1,21),#{startdate},#{starttime},#{endtime},(select showingcode from SHOWING where cinemaname=#{cinemaname} and moviename=#{moviename}),#{screencode} from TIME")
	public int timeInsert(Map<String, Object> map);
	
	// 시간코드 검색
	@Select("select timecode from TIME where startdate=#{startdate} and starttime=#{starttime} and screencode=#{screencode}")
	public String timeCodeSearch(Map<String, Object> map);
	
	// 예매 영화시간 검색
	@Select("select startdate,starttime,endtime,screencode from TIME t,SHOWING s where t.showingcode=s.showingcode and cinemaname=#{cinemaname} and moviename=#{moviename} and startdate=#{startdate} order by screencode,starttime desc")
	public List<JoinVO> reserveTimeSearch(Map<String, Object> map);

}

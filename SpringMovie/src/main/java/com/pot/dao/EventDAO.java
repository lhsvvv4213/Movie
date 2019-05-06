package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.EventVO;

public interface EventDAO {
	
	// 전체 이벤트 리스트
	@Select("select * from EVENT order by eventcode desc")
	public List<EventVO> eventList();
	
	// 한개의 이벤트 정보
	@Select("select * from EVENT where eventcode=#{eventcode}")
	public EventVO getEvent(int eventcode);
	
	// 이벤트 삭제
	@Delete("delete from EVENT where eventcode=#{eventcode}")
	public void eventDelete(int eventcode);
	
	// 이벤트 등록
	@Insert("insert into EVENT select ifnull(max(eventcode)+1,1),#{subject},#{startdate},#{enddate},#{oldname},#{newname},#{url},#{d_oldname},#{d_newname},#{d_url},#{id} from EVENT")
	public int eventInsert(EventVO eventVO);
	
	// 이벤트 8개 
	@Select("select * from EVENT order by eventcode desc limit 8")
	public List<EventVO> eventEight();
	
	// 더보기
	@Select("select * from EVENT order by eventcode desc limit #{count},8")
	public List<EventVO> eventMore(int count);
	
}

package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.ReviewVO;

public interface ReviewDAO {
	
	// 리뷰 중복 확인
	@Select("select moviename from REVIEW where id=#{id} and moviename=#{moviename}")
	public String reviewCheck(Map<String, Object> map);

	// 리뷰 등록
	@Insert("insert into REVIEW select ifnull(max(reviewcode)+1,1),#{score},#{content},sysdate(),#{id},#{moviename} from REVIEW")
	public void reviewInsert(ReviewVO reviewVO);
	
	// 리뷰 전체 리스트
	@Select("select * from REVIEW where moviename=#{moviename} order by writedate desc")
	public List<ReviewVO> reviewList(String moviename);
	
}

package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.NoticeVO;

public interface NoticeDAO {

	// 공지사항 리스트
	@Select("select * from NOTICE")
	public List<NoticeVO> noticeList();
	
	// 공지사항 한 개의 정보
	@Select("select * from NOTICE where noticecode=#{noticecode}")
	public NoticeVO getNotice(int noticecode);
	
	// 공지사항 삭제
	@Delete("delete from NOTICE where noticecode=#{noticecode}")
	public void noticeDelete(int noticecode);
	
	// 공지사항 등록
	@Insert("insert into NOTICE select ifnull(max(noticecode)+1,1),#{subject},#{content},now(),#{id} from NOTICE")
	public void noticeInsert(NoticeVO noticeVO);
	
}

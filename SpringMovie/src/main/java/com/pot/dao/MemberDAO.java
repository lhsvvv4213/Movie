package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pot.dto.MemberVO;

public interface MemberDAO {

	// 회원리스트
	@Select("select * from member")
	public List<MemberVO> memberList();

	// 중복아이디 체크	
	@Select("select id from member where id=#{id}")
	public String idCheck(String id);

	// 회원가입
	@Insert("insert into member values(#{id},#{pw},#{name},#{email},#{phone},0,'guest')")
	public int memberInsert(MemberVO memberVO);
	
	@Insert("insert into login values(#{id},#{pw},1)")
	public int loginInsert(Map<String, Object> map);
	
	// 로그인
	@Select("select authority from login where id=#{id} and pw=#{pw}")
	public String login(Map<String, Object> map);

}

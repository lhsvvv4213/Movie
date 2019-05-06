package com.pot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pot.dto.LoginVO;
import com.pot.dto.MemberVO;

public interface MemberDAO {

	// 회원리스트
	@Select("select * from MEMBER")
	public List<MemberVO> memberList();

	// 중복아이디 체크	
	@Select("select id from MEMBER where id=#{id}")
	public String idCheck(String id);

	// 회원가입
	@Insert("insert into MEMBER values(#{id},#{pw},#{name},#{email},#{phone},0,'guest')")
	public int memberInsert(MemberVO memberVO);
	
	@Insert("insert into LOGIN values(#{id},#{pw},1)")
	public int loginInsert(Map<String, Object> map);
	
	// 로그인
	@Select("select id,authority from LOGIN where id=#{id} and pw=#{pw}")
	public LoginVO login(Map<String, Object> map);
	
	// 아이디 찾기
	@Select("select id from MEMBER where name=#{name} and email=#{email} and phone=#{phone}")
	public String idSearch(Map<String, Object> map);
	
	// 비밀번호 찾기
	@Select("select pw from MEMBER where id=#{id} and email=#{email}")
	public String passwordSearch(Map<String, Object> map);
	
	// 포인트 업데이트
	@Update("update MEMBER set point=point+#{point} where id=#{id}")
	public void pointUpdate(Map<String, Object> map);
	
	@Update("update MEMBER set point=point-#{point} where id=#{id}")
	public int pointCancel(Map<String, Object> map);
	
	// 한 명의 정보
	@Select("select * from MEMBER where id=#{id}")
	public MemberVO getMember(String id);
	
	// 관리자로 변경
	@Update("update MEMBER set grade='admin' where id=#{id}")
	public void memberUpdate(String id);
	
	@Update("update LOGIN set authority=0 where id=#{id}")
	public void loginUpdate(String id);
	
	@Update("insert into ADMIN values(#{id})")
	public void adminUpdate(String id);
	
	// 회원삭제
	@Select("select authority from LOGIN where id=#{id}")
	public int authoritySelect(String id);
	
	@Delete("delete from ADMIN where id=#{id}")
	public void adminDelete(String id);
	
	@Delete("delete from LOGIN where id=#{id}")
	public void loginDelete(String id);
	
	@Delete("delete from MEMBER where id=#{id}")
	public void memberDelete(String id);

}

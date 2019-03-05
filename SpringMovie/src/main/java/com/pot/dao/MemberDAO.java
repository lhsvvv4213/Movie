package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.pot.dto.MemberVO;

@MapperScan
public interface MemberDAO {
	
	@Select("select * from member")
	public List<MemberVO> memberList();
	
	@Select("select id from member where id=#{id}")
	public String idCheck(String id);
	
	@Insert("insert into member values(#{id},#{pw},#{name},#{email},#{phone},0,'guest')")
	public int memberInsert(MemberVO memberVO);
	
}

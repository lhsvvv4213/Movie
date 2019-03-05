package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pot.dto.MemberVO;

public interface MemberDAO {
	
	@Select("select * from member")
	public List<MemberVO> memberList();
	
}

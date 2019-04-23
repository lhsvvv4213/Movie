package com.pot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pot.dto.ScreenVO;

public interface ScreenDAO {
	
	// 상영관 리스트
	@Select("select screencode from SCREEN where screencode like concat(#{screencode},'%') order by screencode")
	public List<ScreenVO> screenList(String screencode);

}

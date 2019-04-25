package com.pot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MovieDAO;
import com.pot.dao.ReserveDAO;
import com.pot.dto.JoinVO;
import com.pot.dto.MovieVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private ReserveDAO reserveDAO;

	@RequestMapping(value = "/user/mypage", method = RequestMethod.POST)
	public String myPage(Model model, @RequestParam String id) {
		
		MovieVO member = movieDAO.getMovie(id);
		List<JoinVO> reserveList = reserveDAO.getReserveList(id);
		
		model.addAttribute("member", member);
		model.addAttribute("reserveList", reserveList);
		
		return "mypage";
	}
	
}

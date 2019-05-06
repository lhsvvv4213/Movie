package com.pot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MemberDAO;
import com.pot.dao.ReserveDAO;
import com.pot.dao.Reserve_SeatDAO;
import com.pot.dto.JoinVO;
import com.pot.dto.MemberVO;
import com.pot.dto.ReserveVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Autowired
	private Reserve_SeatDAO reserve_seatDAO;

	@RequestMapping(value = "/user/myPage", method = RequestMethod.POST)
	public String myPage(Model model, @RequestParam String id) {
		
		MemberVO member = memberDAO.getMember(id);
		List<JoinVO> reserveList = reserveDAO.getReserveList(id);
		
		model.addAttribute("member", member);
		model.addAttribute("reserveList", reserveList);
		
		return "myPage";
	}
	
	@RequestMapping(value = "/user/reserve_Cancel", method = RequestMethod.POST)
	public String reserveCancel(Model model, @RequestParam String startdate, @RequestParam String starttime, @RequestParam String screencode, @RequestParam int seatcount, @RequestParam String id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startdate", startdate);
		map.put("starttime", starttime);
		map.put("screencode", screencode);
		map.put("seatcount", seatcount);
		map.put("id", id);
		
		ReserveVO reserveVO =  reserveDAO.reserveCheck(map);
		
		map.put("point", reserveVO.getPoint());
		
		reserve_seatDAO.reserveSeatDelete(reserveVO.getReservecode());
		reserveDAO.reserveDelete(reserveVO.getReservecode());
		memberDAO.pointCancel(map);
		
		return "myPage";
	}
	
}

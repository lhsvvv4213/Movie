package com.pot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MemberDAO;
import com.pot.dto.MemberVO;

@Controller
public class RegisterController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value = "/user/agreement", method = RequestMethod.GET)
	public String agreement() {
		
		return "agreement";
	}
	
	@RequestMapping(value = "/user/register", method = RequestMethod.POST)
	public String register() {
		
		return "register";
	}
	
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.POST)
	public String idCheck(Model model, @RequestParam String id) {
		
		String memberId = memberDAO.idCheck(id);	
		int idCheck; // 중복확인 
		
		if(memberId == null) {
			idCheck = 0; // 회원이 존재하지 않음

		} else {
			idCheck = 1; // 회원존재
		}
		
		model.addAttribute("idCheck", idCheck);
		
		return "idCheck";
	}
	
	@RequestMapping(value = "/user/register_Success", method = RequestMethod.POST)
	public String registerSuccess(Model model, MemberVO memberVO) {
		
		int check = memberDAO.memberInsert(memberVO); // 회원가입
		
		if (check == 1) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", memberVO.getId());
			map.put("pw", memberVO.getPw());
			
			check = memberDAO.loginInsert(map);
			System.out.println("회원가입(check)=>" + check);
		}
		
		model.addAttribute("id", memberVO.getId());
		model.addAttribute("name", memberVO.getName());
		model.addAttribute("check", check);
		
		return "register_Success";
	}

}

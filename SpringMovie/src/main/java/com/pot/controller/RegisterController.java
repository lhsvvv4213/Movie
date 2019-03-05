package com.pot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MemberDAO;
import com.pot.dto.MemberVO;

@Controller
public class RegisterController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value = "user/agreement", method = RequestMethod.GET)
	public String agreement() {
		
		return "agreement";
	}
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String register() {
		
		return "register";
	}
	
	@RequestMapping(value = "user/idCheck", method = RequestMethod.POST)
	public String idCheck(Model model, @RequestParam("id") String id) {
		
		String idCheck = memberDAO.idCheck(id);
		System.out.println("idCheck=>" + idCheck);
		
		model.addAttribute("idCheck", idCheck);
		
		return "idCheck";
	}
	
	@RequestMapping(value = "user/register_Success", method = RequestMethod.POST)
	public String registerSuccess(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {
		
		int check = memberDAO.memberInsert(memberVO); // 회원가입
		System.out.println("회원가입(check)=>" + check);
		
		model.addAttribute("id", memberVO.getId());
		model.addAttribute("name", memberVO.getName());
		model.addAttribute("check", check);
		
		return "register_Success";
	}

}

package com.pot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pot.dao.MemberDAO;
import com.pot.dto.MemberVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping(value = "/admin/admin_Member")
	public String adminMember(Model model, HttpSession session) {
		
		String id = (String) session.getAttribute("id");		
		System.out.println("session.id=>" + id);
		
		List<MemberVO> memberList = memberDAO.memberList();
		int total = memberList.size();
		System.out.println("회원수(total)=>" + total);
		
		model.addAttribute("memberList", memberList);
		
		return "admin_Member";
	}
	
}

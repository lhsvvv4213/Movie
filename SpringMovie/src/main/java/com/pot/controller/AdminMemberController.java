package com.pot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pot.dao.MemberDAO;
import com.pot.dto.MemberVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping(value = "admin/admin_Member", method = RequestMethod.GET)
	public String adminMember(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("session.member_id=>" + member_id);
		
		List<MemberVO> memberList = memberDAO.memberList();
		int total = memberList.size();
		System.out.println("회원수(total)=>" + total);
		
		model.addAttribute("memberList", memberList);
		
		return "admin_Member";
	}
	
}

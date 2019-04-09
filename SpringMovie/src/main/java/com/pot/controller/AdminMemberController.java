package com.pot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/admin/admin_MemberChange", method = RequestMethod.POST)
	public String adminMemberChange(Model model, @RequestParam String id) {
		
		MemberVO member = memberDAO.getMember(id);
		
		model.addAttribute("member", member);
		
		return "admin_MemberChange";
	}
	
	@RequestMapping(value = "/admin/admin_MemberChangePro", method = RequestMethod.POST)
	public String adminMemberChangePro(Model model, @RequestParam String id) {
		
		memberDAO.memberUpdate(id);
		memberDAO.loginUpdate(id);
		memberDAO.adminUpdate(id);
		
		return "redirect:admin_Member.movie";
	}
	
	@RequestMapping(value = "/admin/admin_MemberDelete", method = RequestMethod.POST)
	public String adminMemberDelete(Model model, @RequestParam String id) {
		
		MemberVO member = memberDAO.getMember(id);
		
		model.addAttribute("member", member);
		
		return "admin_MemberDelete";
	}
	
	@RequestMapping(value = "/admin/admin_MemberDeletePro", method = RequestMethod.POST)
	public String adminMemberDeletePro(Model model, @RequestParam String id) {
		
		int authority = memberDAO.authoritySelect(id);
		
		if (authority == 0) {
			memberDAO.adminDelete(id);
			memberDAO.loginDelete(id);
			memberDAO.memberDelete(id);
		} else {
			memberDAO.loginDelete(id);
			memberDAO.memberDelete(id);
		}
		
		return "redirect:admin_Member.movie";
	}
	
}

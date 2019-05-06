package com.pot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pot.dao.MemberDAO;
import com.pot.dto.MemberVO;
import com.pot.util.MailTest;

@Controller
public class MemberController {
	
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
	
	@RequestMapping(value = "/user/id_Lost", method = RequestMethod.GET)
	public String idLost() {
		
		return "id_Lost";
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/id_LostPro", method = RequestMethod.POST)
	public String idLostPro(Model model, @RequestParam String name, @RequestParam String email, @RequestParam String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		map.put("phone", phone);
		
		String id = memberDAO.idSearch(map);
		
		return id;
	}
	
	@RequestMapping(value = "/user/password_Lost", method = RequestMethod.GET)
	public String passwordLost() {
		
		return "password_Lost";
	}
	
	@ResponseBody 
	@RequestMapping(value = "/user/password_LostPro", method = RequestMethod.POST)
	public String passwordLostPro(Model model, @RequestParam String id, @RequestParam String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		
		String pw = memberDAO.passwordSearch(map);
				
		if (pw != null) {
			new MailTest(pw, email);
		}
		
		return pw;
	}
	
}

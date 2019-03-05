package com.pot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainPageController {

	@RequestMapping(value = "user/mainPage", method = RequestMethod.GET)
	public String mainPage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("session.member_id=>" + member_id);
		
		return "mainPage";
	}
	
}

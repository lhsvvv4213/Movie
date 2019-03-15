package com.pot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

	@RequestMapping(value = "/user/mainPage")
	public String mainPage(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		System.out.println("session.id=>" + id);

		return "mainPage";
	}

}

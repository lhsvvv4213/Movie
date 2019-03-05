package com.pot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {
	
	@RequestMapping(value = "user/agreement", method = RequestMethod.GET)
	public String agreement() {
		
		return "agreement";
	}
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String register() {
		
		return "register";
	}

}

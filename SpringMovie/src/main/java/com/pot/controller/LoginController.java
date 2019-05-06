package com.pot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pot.dao.MemberDAO;
import com.pot.dto.LoginVO;

@Controller
@SessionAttributes("id")
public class LoginController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@ResponseBody
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(Model model, @RequestParam String id, @RequestParam String pw) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		
		LoginVO login = memberDAO.login(map);
		
		if (login != null) {
			model.addAttribute("id", login.getId());
			
			return login.getAuthority();
		}
					
		return null;
	}

}

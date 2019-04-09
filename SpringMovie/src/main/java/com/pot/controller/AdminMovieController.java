package com.pot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pot.dao.MovieDAO;

@Controller
public class AdminMovieController {

	@Autowired
	private MovieDAO movieDAO;
	
	@RequestMapping(value = "/admin/admin_Movie", method = RequestMethod.GET)
	public String adminMovie(Model model) {
		
		
		return "admin_Movie";
	}
	
}

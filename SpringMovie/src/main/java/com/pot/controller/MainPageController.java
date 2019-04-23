package com.pot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MovieDAO;
import com.pot.dto.MovieVO;

@Controller
public class MainPageController {
	
	@Autowired
	private MovieDAO movieDAO;

	@RequestMapping(value = "/user/mainPage")
	public String mainPage(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		System.out.println("session.id=>" + id);
		
		List<MovieVO> movieList = movieDAO.getMovieList();
		int total = movieList.size();
		System.out.println("영화수(total)=>" + total);
		
		model.addAttribute("movieList", movieList);

		return "mainPage";	
	}
	
	@RequestMapping(value = "/user/movie_Detail", method = RequestMethod.GET)
	public String movieDetail(Model model, @RequestParam String moviename) {
		
		MovieVO movie = movieDAO.getMovie(moviename);
		
		model.addAttribute("movie", movie);

		return "movie_Detail";	
	}

}

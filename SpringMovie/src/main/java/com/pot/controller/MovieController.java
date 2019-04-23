package com.pot.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.MovieDAO;
import com.pot.dto.JoinVO;
import com.pot.dto.MovieVO;
import com.pot.util.FileUtil;

@Controller
public class MovieController {

	@Autowired
	private MovieDAO movieDAO;
	
	@RequestMapping(value = "/admin/admin_Movie", method = RequestMethod.GET)
	public String adminMovie(Model model) {
		
		List<JoinVO> movieJoin = movieDAO.adminMovieList();
		int total = movieJoin.size();
		System.out.println("전체 상영영화=>" + total);
		
		model.addAttribute("movieJoin", movieJoin);
		
		return "admin_Movie";
	}
	
	@RequestMapping(value = "/admin/admin_MovieDelete", method = RequestMethod.GET)
	public String adminMovieDelete(Model model, @RequestParam String showingcode) {
		
		List<JoinVO> movieDeleteList = movieDAO.movieDeleteSearch(showingcode);
		
		model.addAttribute("movieDeleteList", movieDeleteList);
		model.addAttribute("showingcode", showingcode);
		
		return "admin_MovieDelete"; 
	}
	
	@RequestMapping(value = "/admin/admin_MovieDeletePro", method = RequestMethod.POST)
	public String adminMovieDeletePro(Model model, @RequestParam String showingcode) {
		
		movieDAO.timeDelete(showingcode);
		movieDAO.showingDelete(showingcode);
		
		return "redirect:admin_Movie.movie"; 
	}
	
	@RequestMapping(value = "/admin/admin_MovieRegister", method = RequestMethod.GET)
	public String adminMovieRegister(Model model) {
			
		return "admin_MovieRegister";
	}
	
	@RequestMapping(value = "/admin/admin_MovieRegisterPro", method = RequestMethod.POST)
	public String adminCinemaRegisterPro(Model model, HttpServletRequest request, MovieVO movieVO) throws Exception {
		
		if (movieVO.getGrade().equals("") || movieVO.getContent().trim().equals("")) {
			model.addAttribute("search", "exist");

			return "admin_Register";
		}
		
		String oldName = movieVO.getUpload().getOriginalFilename();
		String newName = FileUtil.rename(oldName);
		String url = FileUtil.uploadFile(newName, request, movieVO);
		
		movieVO.setContent(movieVO.getContent().trim());
		movieVO.setOldname(oldName);
		movieVO.setNewname(newName);
		movieVO.setUrl(url);
		
		String search = movieDAO.movieSearch(movieVO.getMoviename());
		
		if (search == null) {
			movieDAO.movieInsert(movieVO);
			movieVO.getUpload().transferTo(new File(url));
			
			return "redirect:admin_MovieRegister.movie";
		} else {
			model.addAttribute("search", search);
			
			return "admin_Register";
		}			
	}
	
}

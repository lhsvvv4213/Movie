package com.pot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pot.dao.CinemaDAO;
import com.pot.dao.MovieDAO;
import com.pot.dao.ScreenDAO;
import com.pot.dao.ShowingDAO;
import com.pot.dao.TimeDAO;
import com.pot.dto.CinemaVO;
import com.pot.dto.MovieVO;
import com.pot.dto.ScreenVO;
import com.pot.dto.ShowingVO;
import com.pot.dto.TimeVO;

@Controller
public class TimeController {

	@Autowired
	private CinemaDAO cinemaDAO;

	@Autowired
	private MovieDAO movieDAO;

	@Autowired
	private ScreenDAO screenDAO;

	@Autowired
	private ShowingDAO showingDAO;

	@Autowired
	private TimeDAO timeDAO;

	@RequestMapping(value = "/admin/admin_TimeRegister", method = RequestMethod.GET)
	public String adminTimeRegister(Model model) {

		List<CinemaVO> cinemaList = cinemaDAO.cinemaList();
		int total = cinemaList.size();
		System.out.println("영화관수=>" + total);

		List<MovieVO> movieList = movieDAO.movieList();
		int total2 = movieList.size();
		System.out.println("영화수=>" + total2);

		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("movieList", movieList);
		
		return "admin_TimeRegister";
	}
	
	@RequestMapping(value = "/admin/screenList", method = RequestMethod.GET)
	public String screenList(Model model, @RequestParam String screencode) {
		System.out.println("screencode=" + screencode);
		List<ScreenVO> screenList = screenDAO.screenList(screencode);
		int total3 = screenList.size();
		System.out.println("상영관수=>" + total3);
		
		model.addAttribute("screenList", screenList);
		
		return "screenList";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/admin_TimeRegisterPro", method = RequestMethod.POST)
	public String adminTimeRegisterPro(Model model, ShowingVO showingVO, TimeVO timeVO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaname", showingVO.getCinemaname());
		map.put("moviename", showingVO.getMoviename());
		map.put("startdate", timeVO.getStartdate());
		map.put("starttime", timeVO.getStarttime());
		map.put("endtime", timeVO.getEndtime());
		map.put("screencode", timeVO.getScreencode());
		
		String search = timeDAO.timeCodeSearch(map);
		
		if (search == null) {
			String showingcode = showingDAO.showingCodeSearch(showingVO);
			
			if (showingcode == null) {
				int insert = showingDAO.showingInsert(showingVO);
				
				if (insert == 1) {
					timeDAO.timeInsert(map);
				}
			} else {
				timeDAO.timeInsert(map);
			}		
		} 
		
		return search;
	}
	
}

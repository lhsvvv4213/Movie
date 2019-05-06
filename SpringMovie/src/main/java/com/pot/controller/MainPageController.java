package com.pot.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pot.dao.MemberDAO;
import com.pot.dao.MovieDAO;
import com.pot.dao.ReserveDAO;
import com.pot.dao.Reserve_SeatDAO;
import com.pot.dao.ReviewDAO;
import com.pot.dao.SeatDAO;
import com.pot.dao.ShowingDAO;
import com.pot.dao.TimeDAO;
import com.pot.dto.JoinVO;
import com.pot.dto.MemberVO;
import com.pot.dto.MovieVO;
import com.pot.dto.ReserveVO;
import com.pot.dto.Reserve_SeatVO;
import com.pot.dto.ReviewVO;
import com.pot.dto.ShowingVO;
import com.pot.dto.TimeVO;

@Controller
public class MainPageController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired
	private TimeDAO timeDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private ShowingDAO showingDAO;
	
	@Autowired
	private SeatDAO seatDAO;
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Autowired
	private Reserve_SeatDAO reserve_seatDAO;

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
		movie.setGrade(movie.getGrade().substring(0, 2));
		
		model.addAttribute("movie", movie);

		return "movie_Detail";	
	}
	
	@RequestMapping(value = "/user/reviewList", method = RequestMethod.GET)
	public String reviewList(Model model, @RequestParam String moviename) {
		
		List<ReviewVO> reviewList = reviewDAO.reviewList(moviename);
		
		model.addAttribute("reviewList", reviewList);

		return "reviewList";	
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/review", method = RequestMethod.POST)
	public String review(Model model, ReviewVO reviewVO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", reviewVO.getId());
		map.put("moviename", reviewVO.getMoviename());
		
		String search = reviewDAO.reviewCheck(map);
		
		if (search == null) {
			reviewDAO.reviewInsert(reviewVO);
		}
		
		return search;	
	}
	
	@RequestMapping(value = "/user/reserve_Cinema", method = RequestMethod.GET)
	public String reserveCinema(Model model, @RequestParam String moviename) {
		
		List<ShowingVO> cinemaList = showingDAO.cinemaList(moviename);
		
		model.addAttribute("cinemaList", cinemaList);
		
		return "reserve_Cinema";	
	}
	
	@RequestMapping(value = "/user/reserve_Time", method = RequestMethod.GET)
	public String reserveTime(Model model, @RequestParam String cinemaname, @RequestParam String moviename, @RequestParam String startdate) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaname", cinemaname);
		map.put("moviename", moviename);
		map.put("startdate", startdate);
		
		List<JoinVO> movieTimeList = timeDAO.reserveTimeSearch(map);
		
		model.addAttribute("movieTimeList", movieTimeList);
		
		return "reserve_Time";	
	}
	
	@RequestMapping(value = "/user/screen", method = RequestMethod.GET)
	public String screen(Model model, @RequestParam String startdate, @RequestParam String starttime, @RequestParam String screencode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startdate", startdate);
		map.put("starttime", starttime);
		map.put("screencode", screencode);
		
		List<String> spaceSeat = seatDAO.seatList(screencode);
		List<String> reserveSeat = reserve_seatDAO.reserveSeatList(map);
		
		for (int i = 0; i < spaceSeat.size(); i++) {
			for (int j = 0; j < reserveSeat.size(); j++) {
				if (spaceSeat.get(i).equals(reserveSeat.get(j))) {
					spaceSeat.remove(i);
				}
			}
		}
		
		TreeMap<String, Integer> seat = new TreeMap<String, Integer>();

		for (int i = 0; i < spaceSeat.size(); i++) {
			seat.put(spaceSeat.get(i), 0);
		}
		for (int i = 0; i < reserveSeat.size(); i++) {
			seat.put(reserveSeat.get(i), 1);
		}
		
		model.addAttribute("seat", seat);
		
		return "screen1";	
	}
	
	@RequestMapping(value = "/user/reserve_Success", method = RequestMethod.POST)
	public String reserveSuccess(Model model, MemberVO memberVO, ReserveVO reserveVO, Reserve_SeatVO reserve_seatVO, TimeVO timeVO, @RequestParam String cinema, @RequestParam String movie, @RequestParam String adult, @RequestParam String child, @RequestParam List<String> seat) {

		Date d = new Date();
		SimpleDateFormat reserveCode = new SimpleDateFormat("yyMMddHHmmss");
		
		String priceComma = String.format("%,d", reserveVO.getPrice());
		int point = (int) (reserveVO.getPrice() * 0.01);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", memberVO.getId());
		map.put("point", point);
		map.put("startdate", timeVO.getStartdate());
		map.put("starttime", timeVO.getStarttime());
		map.put("screencode", timeVO.getScreencode());
		map.put("timecode", timeDAO.timeCodeSearch(map));
		
		reserveVO.setReservecode(reserveCode.format(d));
		reserveVO.setPoint(point);
		reserveVO.setTimecode(Integer.parseInt(timeDAO.timeCodeSearch(map)));
		
		int reserve = reserveDAO.reserveInsert(reserveVO);
		
		if (reserve == 1) {
			memberDAO.pointUpdate(map);
		}
		
		String seatNum = "";

		reserve_seatVO.setReservecode(reserveDAO.reserveCode(map));
		reserve_seatVO.setTimecode(Integer.parseInt(timeDAO.timeCodeSearch(map)));

		for (int i = 0; i < seat.size(); i++) {
			reserve_seatVO.setSeatcode(timeVO.getScreencode() + " " + seat.get(i));
			reserve_seatDAO.reserveSeatInsert(reserve_seatVO);
			seatNum += seat.get(i) + " ";
		}
		
		model.addAttribute("cinema", cinema);
		model.addAttribute("movie", movie);
		model.addAttribute("startdate", timeVO.getStartdate());
		model.addAttribute("starttime", timeVO.getStarttime());
		model.addAttribute("screencode", timeVO.getScreencode());
		model.addAttribute("seatcount", reserveVO.getSeatcount());
		model.addAttribute("seatNum", seatNum);
		model.addAttribute("adult", adult);
		model.addAttribute("child", child);
		model.addAttribute("priceComma", priceComma);
		
		return "reserve_Success";	
	}
	
}

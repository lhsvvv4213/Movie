package com.pot.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pot.dao.CinemaDAO;
import com.pot.dto.CinemaImgVO;
import com.pot.dto.CinemaVO;
import com.pot.util.FileUtil;

@Controller
public class AdminCinemaController {
	
	@Autowired
	private CinemaDAO cinemaDAO;

	@RequestMapping(value = "/admin/admin_CinemaRegister", method = RequestMethod.GET)
	public String adminCinemaRegister() {
				
		return "admin_CinemaRegister";
	}
	
	@RequestMapping(value = "/admin/admin_CinemaRegisterPro", method = RequestMethod.POST)
	public String adminCinemaRegisterPro(Model model, HttpServletRequest request, CinemaVO cinemaVO, CinemaImgVO cinemaImgVO) {
		
		int check = 0;
		
		String oldName = cinemaImgVO.getUpload().getOriginalFilename();
		String newName = FileUtil.rename(oldName);
		String url = FileUtil.uploadFile(newName, request, cinemaImgVO);
		
		cinemaVO.setContent(cinemaVO.getContent().trim());
		cinemaImgVO.setOldname(oldName);
		cinemaImgVO.setNewname(newName);
		cinemaImgVO.setUrl(url);
		
		try {
			check = cinemaDAO.cinemaInsert(cinemaVO);
			
			if (check == 1) {
				check = cinemaDAO.cinemaImgInsert(cinemaImgVO);
				cinemaImgVO.getUpload().transferTo(new File(url));	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (check == 1) {
			return "redirect:admin_CinemaRegister.movie";
		} else {
			model.addAttribute("check", check);
			return "admin_CinemaRegisterPro";
		}		
	}
	
}

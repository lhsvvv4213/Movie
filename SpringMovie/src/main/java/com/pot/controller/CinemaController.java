package com.pot.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pot.dao.CinemaDAO;
import com.pot.dto.CinemaVO;
import com.pot.util.FileUtil;

@Controller
public class CinemaController {

	@Autowired
	private CinemaDAO cinemaDAO;

	@RequestMapping(value = "/admin/admin_CinemaRegister", method = RequestMethod.GET)
	public String adminCinemaRegister() {

		return "admin_CinemaRegister";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/admin_CinemaRegisterPro", method = RequestMethod.POST)
	public String adminCinemaRegisterPro(Model model, HttpServletRequest request, CinemaVO cinemaVO) throws Exception {

		String oldName = cinemaVO.getUpload().getOriginalFilename();
		String newName = FileUtil.rename(oldName);
		String url = FileUtil.uploadFile(newName, request, cinemaVO);

		cinemaVO.setContent(cinemaVO.getContent().trim());
		cinemaVO.setOldname(oldName);
		cinemaVO.setNewname(newName);
		cinemaVO.setUrl(url);

		String search = cinemaDAO.cinemaSearch(cinemaVO.getCinemaname());

		if (search == null) {
			cinemaDAO.cinemaInsert(cinemaVO);
			cinemaVO.getUpload().transferTo(new File(url));
		}
		
		return search;
	}

}

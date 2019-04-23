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

import com.pot.dao.EventDAO;
import com.pot.dto.EventVO;
import com.pot.util.FileUtil;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(value = "/admin/admin_Event", method = RequestMethod.GET)
	public String adminEvent(Model model) {
		
		List<EventVO> eventList = eventDAO.eventList();
		int total = eventList.size();
		System.out.println("이벤트수=>" + total);
		
		model.addAttribute("eventList", eventList);
		
		return "admin_Event";
	}
	
	@RequestMapping(value = "/admin/admin_EventRegister", method = RequestMethod.GET)
	public String adminEventRegister() {
				
		return "admin_EventRegister";
	}
	
	@RequestMapping(value = "/admin/admin_EventDelete", method = RequestMethod.GET)
	public String adminEventDelete(Model model, @RequestParam String eventcode) {
		
		EventVO event = eventDAO.getEvent(eventcode);
		
		model.addAttribute("event", event);
		
		return "admin_EventDelete"; 
	}
	
	@RequestMapping(value = "/admin/admin_EventDeletePro", method = RequestMethod.GET)
	public String admin_EventDeletePro(Model model, @RequestParam String eventcode) {
		
		EventVO event = eventDAO.getEvent(eventcode);
		
		File file = new File(event.getUrl());
		File d_file = new File(event.getD_url());
		
		if (file.exists() && d_file.exists()) {
			file.delete();
			d_file.delete();
		}		
		eventDAO.eventDelete(eventcode);
		
		return "redirect:admin_Event.movie"; 
	}
	
	@RequestMapping(value = "/admin/admin_EventRegisterPro", method = RequestMethod.POST)
	public String adminEventRegisterPro(Model model, HttpServletRequest request, EventVO eventVO) throws Exception {
		
		String oldName = eventVO.getUpload().getOriginalFilename();
		String newName = FileUtil.rename(oldName);
		String url = FileUtil.uploadFile(newName, request, eventVO);
		String d_oldName = eventVO.getD_upload().getOriginalFilename();
		String d_newName = FileUtil.rename(d_oldName);
		String d_url = FileUtil.uploadFile(d_newName, request, eventVO);
		
		eventVO.setOldname(oldName);
		eventVO.setNewname(newName);
		eventVO.setUrl(url);
		eventVO.setD_oldname(d_oldName);
		eventVO.setD_newname(d_newName);
		eventVO.setD_url(d_url);
		
		int insert = eventDAO.eventInsert(eventVO);

		if (insert == 1) {
			eventVO.getUpload().transferTo(new File(url));
			eventVO.getD_upload().transferTo(new File(d_url));
	
		}				
		return "redirect:admin_EventRegister.movie";
	}

}

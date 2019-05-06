package com.pot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pot.dao.NoticeDAO;
import com.pot.dto.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@RequestMapping(value = "/admin/admin_Notice", method = RequestMethod.GET)
	public String adminNotice(Model model) {
				
		List<NoticeVO> noticeList = noticeDAO.noticeList();
		int total = noticeList.size();
		System.out.println("공지사항수=>" + total);
		
		model.addAttribute("noticeList", noticeList);
		
		return "admin_Notice";
	}
	
	@RequestMapping(value = "/admin/admin_NoticeRegister", method = RequestMethod.GET)
	public String adminNoticeRegister() {
				
		return "admin_NoticeRegister";
	}
	
	@RequestMapping(value = "/admin/admin_NoticeRegisterPro", method = RequestMethod.POST)
	public String adminNoticeRegisterPro(Model model, NoticeVO noticeVO) {
		
		noticeVO.setContent(noticeVO.getContent().trim());
		
		noticeDAO.noticeInsert(noticeVO);
				
		return "redirect:admin_NoticeRegister.movie";
	}
	
	@RequestMapping(value = "/admin/admin_NoticeDelete", method = RequestMethod.GET)
	public String adminNoticeDelete(Model model, @RequestParam int noticecode) {
		
		NoticeVO notice = noticeDAO.getNotice(noticecode);
		
		model.addAttribute("notice", notice);
		
		return "admin_NoticeDelete"; 
	}
	
	@RequestMapping(value = "/admin/admin_NoticeDeletePro", method = RequestMethod.GET)
	public String adminNoticeDeletePro(Model model, @RequestParam int noticecode) {
		
		noticeDAO.noticeDelete(noticecode);
		
		return "redirect:admin_Notice.movie"; 
	}
	
	@RequestMapping(value = "/user/notice", method = RequestMethod.GET)
	public String notice(Model model) {
		
		List<NoticeVO> noticeList = noticeDAO.noticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice"; 
	}
	
	@RequestMapping(value = "/user/notice_Detail", method = RequestMethod.GET)
	public String noticeDetail(Model model, @RequestParam int noticecode) {
		
		NoticeVO notice = noticeDAO.getNotice(noticecode);
		NoticeVO pre = noticeDAO.preNotice(noticecode);
		NoticeVO next = noticeDAO.nextNotice(noticecode);
		
		model.addAttribute("notice", notice);
		model.addAttribute("pre", pre);
		model.addAttribute("next", next);
				
		return "notice_Detail"; 
	}

}

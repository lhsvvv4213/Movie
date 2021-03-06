package com.pot.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CinemaVO {

	private String cinemaname;
	private String tel;
	private String addr;
	private String local;
	private String content;
	private String oldname;
	private String newname;
	private String url;
	private MultipartFile upload;
	
}

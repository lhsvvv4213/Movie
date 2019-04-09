package com.pot.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CinemaImgVO {
	
	private String cinemaname;
	private String oldname;
	private String newname;
	private String url;
	private MultipartFile upload;
	
}

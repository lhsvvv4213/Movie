package com.pot.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {

	private String moviename;
	private String genre;
	private String opendate;
	private String runningtime;
	private String grade;
	private String director;
	private String actor;
	private String content;
	private String oldname;
	private String newname;
	private String url;
	private MultipartFile upload;
	
}

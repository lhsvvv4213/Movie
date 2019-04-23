package com.pot.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EventVO {

	private int eventcode;
	private String subject;
	private String startdate;
	private String enddate;
	private String oldname;
	private String newname;
	private String url;
	private String d_oldname;
	private String d_newname;
	private String d_url;
	private String id;
	private MultipartFile upload;
	private MultipartFile d_upload;

}

package com.pot.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	
	private int reviewcode;
	private int score;
	private String content;
	private Timestamp writedate;
	private String id;
	private String moviename;
	
}

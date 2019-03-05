package com.pot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private int point;
	private String grade;

}

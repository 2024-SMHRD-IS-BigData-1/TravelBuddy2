package com.smhrd.model;

public class Member {
	
	private String id;
	private String pw;
	private String name;
	private String nick;
	private String birthdate;
	private String gender;
	private String phone;
	private String eamil;
	private String date;
	private String role;
	
	public Member(String id, String pw, String name, String nick, String birthdate, String gender, String phone,
			String eamil, String date, String role) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.birthdate = birthdate;
		this.gender = gender;
		this.phone = phone;
		this.eamil = eamil;
		this.date = date;
		this.role = role;
	}
	
	

}

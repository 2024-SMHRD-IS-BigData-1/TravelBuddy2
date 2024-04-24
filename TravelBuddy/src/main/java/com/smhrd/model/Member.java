package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	@NonNull private String mem_id;
	@NonNull private String mem_pw;
	private String mem_name;
	private String mem_birthdate;
	private String mem_gender;
	private String mem_phone;
	private String mem_email;
	

//	public Member idCheck(String inputE) {
//		return null;
//	}
//	public Member login(Member member) {
//		return null;
//	}
	
	}
	
	
	
	
	



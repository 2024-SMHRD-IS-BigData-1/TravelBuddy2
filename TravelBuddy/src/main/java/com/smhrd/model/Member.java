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
	
	@NonNull
	private String id;
	@NonNull
	private String pw;
	private String name;
	private String birthdate;
	private String gender;
	private String email;
	private String phone;
	
	
	public Member idCheck(String inputE) {
		// TODO Auto-generated method stub
		return null;
	}
	public Member login(Member member) {
		// TODO Auto-generated method stub
		return null;
	}
	
	}
	
	
	
	
	



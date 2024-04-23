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
	private String phone;
	private String email;
<<<<<<< HEAD
	
=======
	private String date;
	private String role;
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-IS-BigData-1/TravelBuddy2
	
	public Member idCheck(String inputE) {
		return null;
	}
	public Member login(Member member) {
		return null;
	}
	
	}
	
	
	
	
	



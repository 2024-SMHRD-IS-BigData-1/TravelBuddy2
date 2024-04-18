package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

// @Data : 만능 - 기본생성자, getter, setter, toString...
@AllArgsConstructor // 모든 파라미터를 받는 생성자 메소드
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor // 필요한 파라미터를 받는 생성자
@Getter
@Setter
public class Member {
	
	@NonNull
	private String id;
	@NonNull private String pw;
	private String name;
	
}
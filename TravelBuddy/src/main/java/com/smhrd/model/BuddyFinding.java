package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class BuddyFinding {
	
	private int num; // 식별번호
	@NonNull private String place; // 여행지
	@NonNull private int lat; // 위도
	@NonNull private int lng; // 경도
	@NonNull private String title; // 제목
	@NonNull private String content; // 글
	@NonNull private String calender; // 여행일자
	@NonNull private String writer; // 닉네임
	private String date; // 글작성일

}

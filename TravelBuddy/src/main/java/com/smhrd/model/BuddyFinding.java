package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor

@Getter
@Setter

public class BuddyFinding {
	
	private int buddy_idx;
	 private String place_name;
	 private String lat;
	 private String lng;
	 private String title;
	 private String content;
	 private String travel_dt;
	 private String mem_id;

}

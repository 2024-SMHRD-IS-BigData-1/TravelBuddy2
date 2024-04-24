package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Follow {
	
	@NonNull private int follow_idx;
	private String follower;
	private String followee;
	private String followed_at;
	
	
}

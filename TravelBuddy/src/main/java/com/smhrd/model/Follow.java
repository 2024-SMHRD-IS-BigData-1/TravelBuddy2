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
public class Follow {
	
	private int follow_idx;
	@NonNull private String follower;
	@NonNull private String followee;
	private String followed_at;
	
	
	public void follow (String follower, String followee) {
		this.follower = follower;
		this.followee = followee;
	}
	
}

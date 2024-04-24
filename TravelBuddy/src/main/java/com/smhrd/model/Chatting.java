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
public class Chatting {
	
	private int chat_idx;
	@NonNull private String chatter;
	private String chat;
	private String emotion;
	private String chated_at;
	private String room_idx;
	

}

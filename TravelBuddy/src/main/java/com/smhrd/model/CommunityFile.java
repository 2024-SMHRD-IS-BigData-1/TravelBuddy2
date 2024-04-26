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
public class CommunityFile {
	
	private int file_idx;
	@NonNull private String file_name;
	@NonNull private int file_size;
	@NonNull private String file_ext;
	@NonNull private String uploaded_at;

}

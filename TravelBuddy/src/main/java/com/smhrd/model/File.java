package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class File {
    private String fileName;
    private String fileSize;
    private String fileExt;
    private String uploadedAt;
    private int bIdx; // 해당 파일이 속한 게시글의 식별자
}

package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class File {
    private String fileName;
    private long fileSize; // 파일 크기를 저장할 수 있도록 변경
    private String fileExt;
    private String uploadedAt; // 파일 업로드 시간을 저장할 수 있도록 변경
    private int bIdx;

    // 생성자 오버로딩을 통해 기본 생성자 추가
    public File() {
        this.fileName = "";
        this.fileSize = 0;
        this.fileExt = "";
        this.uploadedAt = "";
        this.bIdx = 0;
    }
}

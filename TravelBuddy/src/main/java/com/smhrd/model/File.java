package com.smhrd.model;

public class File {
    private String fileName;
    private String fileSize;
    private String fileExt;
    private String uploadedAt;
    private int bIdx; // 해당 파일이 속한 게시글의 식별자

    public File(String fileName, String fileSize, String fileExt, String uploadedAt, int bIdx) {
        this.fileName = fileName;
        this.fileSize = fileSize;
        this.fileExt = fileExt;
        this.uploadedAt = uploadedAt;
        this.bIdx = bIdx;
    }

    // Getter 및 Setter 메서드는 생략했습니다.
}

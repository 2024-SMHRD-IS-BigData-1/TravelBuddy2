package com.smhrd.model;

import java.util.List;

public class Community {
    private int bIdx;
    private String bCategory;
    private String bContent;
    private String createdAt;
    private String memId;
    private List<File> files; // 파일 정보를 담는 리스트

    public Community(int bIdx, String bCategory, String bContent, String createdAt, String memId, List<File> files) {
        this.bIdx = bIdx;
        this.bCategory = bCategory;
        this.bContent = bContent;
        this.createdAt = createdAt;
        this.memId = memId;
        this.files = files;
    }

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

    // Getter 및 Setter 메서드는 생략했습니다.
}

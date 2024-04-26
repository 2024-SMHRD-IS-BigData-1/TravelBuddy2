package com.smhrd.model;

import java.util.List; // List import 구문 추가

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Community {
    private int bIdx;
    private String bCategory;
    private String bContent;
    private String createdAt;
    private String memId;
    private String bTitle;
    private List<File> files;

    // 기본 생성자
    public Community() {}
}

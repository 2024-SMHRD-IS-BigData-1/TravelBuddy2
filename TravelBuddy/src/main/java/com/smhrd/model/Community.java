package com.smhrd.model;

import java.util.List; // List import 구문 추가

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Community {
    private int b_idx;
    private String b_category;
    private String b_content;
    private String created_at;
    private String mem_id;
    private String title;

    // 기본 생성자
    public Community() {}
}

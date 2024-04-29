package com.smhrd.model;

import java.util.List; // List import 구문 추가

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class Community {
    private int b_idx;
    @NonNull private String b_category;
    @NonNull private String b_content;
    private String created_at;
    @NonNull private String mem_id;
    @NonNull private String title;
    private String filename;

}

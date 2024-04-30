package com.smhrd.model;

import java.util.List; // List import 구문 추가

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Community {
    private int b_idx;
    @NonNull private String title;
    @NonNull private String mem_id;
    @NonNull private String b_category;
    @NonNull private String b_content;
    @NonNull private String filename;
    private String created_at;

}

package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
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
public class SurveyResult {
    private long result_idx; // 결과 식별자
    @NonNull
    private String mem_id; // 회원 아이디
    @NonNull
    private String tendency_result; // 여행 성향 테스트 결과
    private Date created_at; // 글 작성 일자
}

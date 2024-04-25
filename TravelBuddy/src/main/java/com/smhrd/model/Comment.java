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
public class Comment {
    private int comment_id; // 댓글 식별자
    private String mem_id; // 회원 아이디
    private String comment_content; // 댓글 내용
    private String comment_date; // 댓글 작성일자
    private int buddy_idx; // 게시글 인덱스
    private int parent_comment_id; // 부모 댓글의 식별자
}

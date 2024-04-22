package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//수정된 Board 모델 클래스
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {

 private int buddy_idx;
 private String place_name;
 private String lat;
 private String lng;
 private String title;
 private String content;
 private String travel_dt;
 private String mem_id;

 // place_name 속성에 대한 getter 메서드 추가


}

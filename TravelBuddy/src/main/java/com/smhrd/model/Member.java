package com.smhrd.model;

import java.security.Timestamp;


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
@Data
public class Member {
   
   @NonNull private String mem_id;
   @NonNull private String mem_pw;
   private String mem_name;
   private String mem_birthdate;
   private String mem_gender;
   private String mem_email;
   private String mem_phone;
   private String mem_nick;
   private String mem_info;
   private String mem_pic;
   private java.sql.Timestamp joined_at ;
   
   }
   
   
   
   
   


package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;

import java.io.InputStream;
import java.io.OutputStream;


import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

@WebServlet("/JoinService")
@MultipartConfig
public class JoinService extends HttpServlet {
	
	private String folderName = "imgPic";
	
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 회원가입 서비스
      request.setCharacterEncoding("UTF-8");
      
      String id = request.getParameter("mem_id");
      String pw = request.getParameter("mem_pw");
      String name = request.getParameter("mem_name");
      String year = request.getParameter("year");
      String month = request.getParameter("month");
      String date = request.getParameter("date");
      String gender = request.getParameter("mem_gender");
      String email = request.getParameter("mem_email");
      String phone = request.getParameter("mem_phone");
      
      String nick = request.getParameter("nick");
      String info = request.getParameter("info");
      
      String birthdate = year + month + date;
      
      Part filePart = request.getPart("imageFile");
      String fileName = makeFileName(filePart, id);
      
      if(uploadImage(filePart, fileName)) {
    	  
    	  String picData = folderName+"/"+fileName;
    	  
          Member member = new Member(id, pw, name, birthdate, gender, email, phone, nick, info, picData, null);
          
          System.out.println("[JOIN] : " + member.toString());        

          int cnt = new MemberDAO().join(member);
          
          if(cnt > 0) {
             response.sendRedirect("Login.jsp");
          }else {
             response.sendRedirect("Join.jsp");
          }    	  
      }


   }

   private String getSubmittedFileName(Part part) {
       for (String content : part.getHeader("content-disposition").split(";")) {
           if (content.trim().startsWith("filename")) {
               return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
           }
       }
       return null;
   }
   
  
   private String makeFileName(Part part, String id) {
	   String originName = getSubmittedFileName(part);
	   System.out.println(originName);
	   String[] splitStr = originName.split("\\.");
	   String resName = "pic_"+id+"."+ splitStr[splitStr.length-1];
	   return resName;
   }
   
   private boolean uploadImage(Part filePart, String fileName) throws IOException {
       // 업로드된 파일을 저장할 경로 설정
       String uploadPath = getServletContext().getRealPath("/"+folderName);
       File uploadDir = new File(uploadPath);
       if (!uploadDir.exists()) {
           uploadDir.mkdir(); // 폴더가 없으면 생성
       }

       // 파일 저장
       String filePath = uploadPath + File.separator + fileName;
       File existingFile = new File(filePath);
       if (existingFile.exists()) {
           existingFile.delete(); // 이미 존재하는 파일 삭제
       }

       try (InputStream input = filePart.getInputStream();
            OutputStream output = new FileOutputStream(filePath)) {
           byte[] buffer = new byte[1024];
           int bytesRead;
           while ((bytesRead = input.read(buffer)) != -1) {
               output.write(buffer, 0, bytesRead);
           }
       }catch (Exception e) {
    	   return false;
	}
       
       return true;
   }
   
  }


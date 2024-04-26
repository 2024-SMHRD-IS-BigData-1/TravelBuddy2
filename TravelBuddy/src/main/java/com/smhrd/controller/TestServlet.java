package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import javax.servlet.http.Part;

@MultipartConfig // 멀티파트 설정 추가
@WebServlet("/upload")
public class TestServlet extends HttpServlet {

	private static final String UPLOAD_DIRECTORY = "C:/Users/shmrd/Desktop/test_img";
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	System.out.println("업로드 진입!");
	
	   // 파일 업로드 처리
    String uploadPath = UPLOAD_DIRECTORY;
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }
    
    Part part = request.getPart("file");
    String fileName = getFileName(part);
    String filePath = uploadPath + File.separator + fileName;
    part.write(filePath);
    
    // 파일 업로드 경로를 로그에 출력
    System.out.println("Uploaded File Path: " + filePath);
	
	
	}
	
	  // 파일 이름 가져오기
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }

}

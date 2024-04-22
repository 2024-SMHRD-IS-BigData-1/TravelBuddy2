package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Community;
import com.smhrd.model.CommunityDAO;

@WebServlet("/CommunityService")
public class CommunityService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 커뮤니티 서비스
	 request.setCharacterEncoding("UTF-8");
	 
	 String path = request.getServletContext().getRealPath("./img");
	 System.out.println(path);
	 
	 int maxSize = 10*1024*1024;
	 
	 String encoding  = "UTF-8";
	 
	 DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
	 
	
	MultipartRequest multi = new MultipartRequest(request, path, maxSize,encoding);
	
	String content = multi.getParameter("content");
	String date = multi.getParameter("date");
	String id = multi.getParameter("id");
	String category = multi.getParameter("category");
	
	Community community = new Community(content, date, id, category);
	
	int cnt = new CommunityDAO().insertCommunity(community);
	
	if(cnt > 0) {
		System.out.println("파일업로드 성공");
	}else {
		System.out.println("파일업로드 실패");
	}
	
	}

}

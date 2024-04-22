package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/BuddyFindingService")
public class BuddyFindingService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 버디 찾기 서비스
	
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getServletContext().getRealPath("./B_img");
		System.out.println(path);
		
		int maxSize = 10*1024*1024;
		
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		 
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		
		String place = multi.getParameter("place");
		int lat = Integer.parseInt(request.getParameter("lat"));
		int lng = Integer.parseInt(request.getParameter("lng"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("cotent");
		String writer = multi.getParameter("writer");
		String filename = multi.getFilesystemName("filename");
		
	}

}

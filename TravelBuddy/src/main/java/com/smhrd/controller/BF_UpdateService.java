package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BF_UpdateService")
public class BF_UpdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 버디 찾기 글 수정
		
		String place_name = request.getParameter("place_name");
		int lat = Integer.parseInt(request.getParameter("lat"));
		int lng = Integer.parseInt(request.getParameter("lng"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String travel_dt = request.getParameter("travel_dt");
		String mem_id = request.getParameter("mem_id");
	
	}

}

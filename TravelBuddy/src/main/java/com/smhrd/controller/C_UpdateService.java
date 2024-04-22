package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Community;
import com.smhrd.model.CommunityDAO;

@WebServlet("/C_UpdateService")
public class C_UpdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		String id = request.getParameter("id");
		String category = request.getParameter("category");
		
		Community community = new Community(content,date,id,category);
		
		System.out.print(community.toString());
		
		int cnt = new CommunityDAO().update(community);
		
		if(cnt > 0) {
			System.out.println("수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("community1",community);
		}else {
			System.out.println("수정실패..");
		}
		response.sendRedirect("Main.jsp");
	
	}

}

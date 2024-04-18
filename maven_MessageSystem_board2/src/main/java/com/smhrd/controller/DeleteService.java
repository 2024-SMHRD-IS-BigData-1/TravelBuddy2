package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;


@WebServlet("/DeleteService")
public class DeleteService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//요청데이터 가져오기
		String email = request.getParameter("email");
		

		//요청데이터 -> DAO -> deleteMember(email)
		//정수 리턴 받기(cnt)
		int cnt = new MemberDAO().deleteMember(email);
		
		//cnt가 1이라면 "삭제 성공" 아니라면 "삭제 실패" 콘솔창에 출력
		if(cnt > 0) {
			System.out.println("삭제 성공");
			
		}else {
			System.out.println("삭제 실패...");
		
		}
		response.sendRedirect("ShowMember.jsp");
}
}

package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutService")
public class LogoutService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 서비스
	
		System.out.println("로그아웃 서비스 입성!");
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		
		response.sendRedirect("Login.jsp");
		
//		
//
//		    // 현재 세션을 가져옵니다.
//		    HttpSession session = request.getSession(false);
//		    if(session != null) {
//		        // 세션이 존재하면 세션을 무효화합니다.
//		        session.invalidate();
//		    }
//		    // 로그아웃 후 로그인 페이지로 리디렉션합니다.
//		    response.sendRedirect("Login.jsp");
//		

	}

}

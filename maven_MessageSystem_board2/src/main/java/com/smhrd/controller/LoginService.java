package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		Member member = new Member(email,pw);
		
		Member loginMember = new MemberDAO().login(member);
		
		if(loginMember != null) {
			System.out.println("로그인성공");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			
		}else {
			System.out.println("로그인실패");
		}
		
		response.sendRedirect("Main.jsp");
	}

}

package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member member = new Member(email, pw, tel, address);
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("JoinSuccess.jsp?email="+member.getEmail());
		}else {
			System.out.println("회원가입 실패!");
			response.sendRedirect("Main.jsp");
		}
	}

}

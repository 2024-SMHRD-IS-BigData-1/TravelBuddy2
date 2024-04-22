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
		// 회원가입 서비스
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String birthdate = request.getParameter("birthdate");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String date = request.getParameter("date");
		String role = request.getParameter("role");
		
		
		
		
        Member member = new Member(id, pw, name, nick,birthdate,gender,phone,email,date,role);
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("JoinSuccess.jsp?id="+member.getId());
		}else {
			System.out.println("회원가입 실패!");
			response.sendRedirect("Main.jsp");
		}
	}


	}



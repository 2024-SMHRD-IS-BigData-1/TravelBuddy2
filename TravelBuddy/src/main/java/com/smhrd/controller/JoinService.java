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
		String birthdate = request.getParameter("birthdate");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		
        Member member = new Member(id, pw, name,birthdate,gender,email,phone);
//        System.out.println("[JOIN] : " + member.toString());
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt > 0) {
			
			response.sendRedirect("JoinSuccess.jsp");
		}else {
			System.out.println("회원가입 실패!");
			response.sendRedirect("Join.jsp");
		}
	}


	}



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
		
		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		String name = request.getParameter("mem_name");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
//		String birthdate = request.getParameter("mem_birthdate");
		String gender = request.getParameter("mem_gender");
		String email = request.getParameter("mem_email");
		String phone = request.getParameter("mem_phone");
		
		String birthdate = year + month + date;
		
        Member member = new Member(id,pw,name,birthdate,gender,email,phone);
        System.out.println("[JOIN] : " + member.toString());
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt > 0) {
			response.sendRedirect("Login.jsp");
		}else {
			response.sendRedirect("Join.jsp");
		}
	}


	}



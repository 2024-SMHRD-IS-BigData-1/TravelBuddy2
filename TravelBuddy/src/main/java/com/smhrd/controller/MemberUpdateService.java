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

@WebServlet("/MemberUpdateService")
public class MemberUpdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone= request.getParameter("phone");
		
		
		
		Member member = new Member(id, pw, name,birthdate,gender,email,phone);
		System.out.println(member.toString());
		
		int cnt = new MemberDAO().update(member);
		
		if(cnt > 0) {
			System.out.println("수정성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
			
		}else{
			System.out.println("수정 실패..");
			
		}
		
		response.sendRedirect("Main.jsp");
		
	
	
	}

}

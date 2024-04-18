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


@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member member = new Member(email, pw, tel, address);
		
		System.out.println(member.toString());
		
		int cnt = new MemberDAO().update(member);
		
		if(cnt > 0) {
			System.out.println("수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
		}else {
			System.out.println("수정실패..");
		}
		
		response.sendRedirect("Main.jsp");
		
	}

}

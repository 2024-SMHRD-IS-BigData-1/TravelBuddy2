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
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// System.out.println(id+pw);
		
		Member member = new Member(id, pw);
		
		member = new MemberDAO().login(member);
		
		if(member != null) {
			// 로그인 성공
			// session에 저장
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			System.out.println("로그인 성공!");
		}else {
			// 로그인 실패
			System.out.println("로그인 실패!");
		}
		
		response.sendRedirect("Main.jsp");
	
	
	}

}

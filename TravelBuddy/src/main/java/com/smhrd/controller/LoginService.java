package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class LoginService implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 기능
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		// System.out.println(email + pw);

		Member member = new Member(email, pw);

		Member loginMember = new MemberDAO().login(member);

		if (loginMember != null) {
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
		} else {
			System.out.println("로그인 실패..");
		}

	//	response.sendRedirect("Main.jsp");

		return "Main.jsp";
	}

}

package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinService implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 기능
		
		// request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member member = new Member(email,pw,tel,address);
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt>0) {
			System.out.println("회원가입 성공!");
			// response.sendRedirect("JoinSuccess.jsp?email="+member.getEmail());
			return "JoinSuccess.jsp?email="+member.getEmail();
		}else {
			System.out.println("회원가입 실패!");
			// response.sendRedirect("Main.jsp");
			return "Main.jsp";
		}
		
	}

}

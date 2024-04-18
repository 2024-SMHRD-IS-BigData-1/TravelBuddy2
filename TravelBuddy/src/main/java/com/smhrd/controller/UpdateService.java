package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 회원 수정 기능
		// request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member member = new Member(email, pw, tel, address);
		System.out.println(member.toString());
		
		int cnt = new MemberDAO().update(member);
		
		if(cnt>0) {
			System.out.println("수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
		}else {
			System.out.println("수정 실패..");
		}
		
		// response.sendRedirect("Main.jsp");
		
		
		return "Main.jsp";
	}

}

package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;

public class LogoutService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 로그아웃 기능
		// 세션 값 삭제
		HttpSession session = request.getSession();
		session.invalidate();
		
		// response.sendRedirect("Main.jsp");
		
		
		return "Main.jsp";
	}

}

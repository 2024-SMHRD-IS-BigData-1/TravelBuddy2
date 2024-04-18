package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MemberDAO;

public class DeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//회원 삭제 기능
		// 요청데이터(email) 가져오기
		String email = request.getParameter("email");
		// 요청데이터 -> DAO -> deleteMember(email)
		int cnt = new MemberDAO().deleteMember(email);
		// 정수 리턴받기(cnt)
		if(cnt>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		
		// response.sendRedirect("ShowMember.jsp");
		
		
		return "ShowMember.jsp";
	}

}

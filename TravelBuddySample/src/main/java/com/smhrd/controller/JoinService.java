package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// post방식 인코딩
	request.setCharacterEncoding("UTF-8");
		
	// 요청데이터 가져오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
//	System.out.println(id+pw+name);
	
	Member member = new Member(id,pw,name);
	
	int cnt = new MemberDAO().join(member);
//	System.out.println("cnt:"+cnt);
	if(cnt>0) {
		// 회원가입 성공
		response.sendRedirect("Main.jsp?result=success");
	}else {
		// 회원가입 실패
		response.sendRedirect("Main.jsp?result=fail");
	}
	
	
	
	
	
	
	
	
	
	
	}

}

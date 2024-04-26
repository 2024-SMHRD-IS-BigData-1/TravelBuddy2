package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

@WebServlet("/MemberDelete")
public class MemberDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원삭제
		
//		String id = request.getParameter("id");
//		
//		//int cnt = new MemberDAO().deleteMember(id);
//		
//		if(cnt > 0 ) {
//			System.out.println("삭제성공");
//			
//		}else {
//			System.out.println("삭제실패");
//		}
//
//	
	}

}

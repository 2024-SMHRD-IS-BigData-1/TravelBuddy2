package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[EmailCheck]");
		String inputE = request.getParameter("inputE");
		
		System.out.println(inputE);
		
		Member member = new MemberDAO(). emailCheck(inputE);
		
		PrintWriter out  = response.getWriter();
		
		if(member == null) {
			//  사용가능한 이메일 -> true
			out.print(true);
		}else {
			//사용불가능한 이메일 -> false
			out.print(false);
		}
	}

}

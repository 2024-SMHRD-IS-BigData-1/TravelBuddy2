package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;



ervlet("/IDcheck")
public class IDcheck extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[IDCheck]");
		String inputE = request.getParameter("inputE");
		
		System.out.println(inputE);
		
		Member member = new MemberDAO().IDcheck(inputE);
		
		PrintWriter out = response.getWriter();
		
		if(member == null) {
			out.print(true);
		}else {
			out.print(false);
		}
	}
		
		
	}
		



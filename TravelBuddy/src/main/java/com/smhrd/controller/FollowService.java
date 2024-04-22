package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/follow")
public class FollowService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  response.setContentType("text/html;charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      
	      String my_id = request.getParameter("my_id");
	      String follow_id = request.getParameter("follow_id");
	      
	      System.out.println(my_id+follow_id);
	      System.out.println("[follow servlet]");
		
		
		
		
	}

}

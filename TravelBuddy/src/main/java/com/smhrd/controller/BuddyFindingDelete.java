package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BuddyFindingDAO;


@WebServlet("/BuddyFindingDelete")
public class BuddyFindingDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 버디 찾기 글 삭제
		int num = Integer.parseInt(request.getParameter("buddy_idx"));
		new BuddyFindingDAO().deleteBF(num);
		// response.sendRedirect("Main.jsp");

	}

}

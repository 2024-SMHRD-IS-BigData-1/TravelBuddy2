package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.BoardDAO;

public class BoardDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 게시물 개별 삭제
		int num = Integer.parseInt(request.getParameter("num"));
		new BoardDAO().boardDelete(num);
		//response.sendRedirect("BoardMain.jsp");
		
		return "BoardMain.jsp";
	}

}

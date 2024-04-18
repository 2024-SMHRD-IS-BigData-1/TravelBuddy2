package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MessageDAO;

public class DeleteMessage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 메세지 개별 삭제 기능
		int num = Integer.parseInt(request.getParameter("num"));
		new MessageDAO().deleteMessage(num);
	//	response.sendRedirect("Main.jsp");

		return "Main.jsp";
	}

}

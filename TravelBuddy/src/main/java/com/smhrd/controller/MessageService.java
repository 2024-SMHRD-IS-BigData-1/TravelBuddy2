package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Message;
import com.smhrd.model.MessageDAO;

public class MessageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 메세지 보내기 기능
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String message = request.getParameter("message");

		// System.out.println(sender + receiver + message);

		Message sendMessage = new Message(sender, receiver, message);

		int cnt = new MessageDAO().sendMessage(sendMessage);

		if (cnt > 0) {
			System.out.println("메세지 전송 성공!");
		} else {
			System.out.println("메세지 전송 실패..");
		}
		// response.sendRedirect("Main.jsp");

		return "Main.jsp";
	}

}

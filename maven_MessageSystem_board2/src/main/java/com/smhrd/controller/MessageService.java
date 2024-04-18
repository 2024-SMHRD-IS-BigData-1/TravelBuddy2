package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Message;
import com.smhrd.model.MessageDAO;


@WebServlet("/MessageService")
public class MessageService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String message = request.getParameter("message");
		
		// System.out.println(sender + receiver + message);
		
		Message sendMessage = new Message(sender,receiver,message);
		
		System.out.println(sendMessage.toString());
		
		int cnt = new MessageDAO().sendMessage(sendMessage);
		
		if(cnt > 0) {
			System.out.println("메세지 전송 성공");
		}else {
			System.out.println("메세지 전송 실패");
		}
		
	}

}

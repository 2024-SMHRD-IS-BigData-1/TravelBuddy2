package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class frontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[frontController]");
	
		// url mapping값 : *.do
		
		request.setCharacterEncoding("UTF-8");
		
		// 어디서 요청이 들어왔는지 확인
		String requestURI = request.getRequestURI();
		System.out.println("요청 들어온 주소 : " + requestURI);
		
		// 프로젝트 이름 확인
		String contextPath = request.getContextPath();
		System.out.println("ContextPath : " + contextPath);
		
		// 문자열 자르기 -> substring()
		// substring(start) : start 위치부터 끝까지 문자열 자르기
		// substring(start, end) : start 위치부터 end 전까지 문자열 자르기
		String resultURL = requestURI.substring(contextPath.length() + 1);
		
		System.out.println("요청 URL : " + resultURL);
		
		Command service = null;
		
//		if(resultURL.equals("LoginService.do")) {
//			service = new LoginService();
//		}else if(resultURL.equals("JoinService.do")) {
//			service = new JoinService();
//		}else if(resultURL.equals("BoardDelete.do")) {
//			service = new BoardDelete();
//		}else if(resultURL.equals("BoardService.do")) {
//			service = new BoardService();
//		}else if(resultURL.equals("DeleteMessage.do")) {
//			service = new DeleteMessage();
//		}else if(resultURL.equals("EmailCheck.do")) {
//			service = new EmailCheck();
//		}else if(resultURL.equals("LogoutService.do")) {
//			service = new LogoutService();
//		}else if(resultURL.equals("MessageService.do")) {
//			service = new MessageService();
//		}else if(resultURL.equals("UpdateService.do")) {
//			service = new UpdateService();
//		}else if(resultURL.equals("DeleteService.do")) {
//			service =  new DeleteService();
//		}
//		String moveURL = service.execute(request, response);
//		
//		if(moveURL != null) {
//			response.sendRedirect(moveURL);
//		}
		
		
		
		
		
	
	}

}

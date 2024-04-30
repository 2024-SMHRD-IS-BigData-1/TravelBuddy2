package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 로그인 기능
	    request.setCharacterEncoding("UTF-8");
	    String id = request.getParameter("mem_id");
	    String pw = request.getParameter("mem_pw");

        Member member = new Member(id, pw);
        Member loginMember = new MemberDAO().login(member);
        response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
        PrintWriter out = response.getWriter(); //선언


        if (loginMember != null) {
            System.out.println("로그인 성공!");
            System.out.println(id + pw);
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", loginMember);
            response.sendRedirect("Main.jsp");
            return; // 로그인 성공 시에는 여기서 메소드를 종료하고 리다이렉트된 후의 코드는 실행되지 않도록 합니다.
        }else {

             System.out.println("로그인 실패..");
              String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
                String str="";
                str = "<script language='javascript'>";
                str += "alert('"+ msg + "');";   //얼럿창 띄우기
                str += "location.href = 'Login.jsp';";
                str += "</script>";
                out.print(str);
                
               
                

        }
    }
}


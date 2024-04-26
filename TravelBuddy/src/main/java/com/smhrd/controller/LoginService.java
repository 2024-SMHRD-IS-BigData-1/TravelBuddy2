package com.smhrd.controller;

import java.io.IOException;
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

      if (loginMember != null) {
         System.out.println("로그인 성공!");
         System.out.println(id+pw);
         HttpSession session = request.getSession();
         session.setAttribute("loginMember", loginMember);
      } else {
         System.out.println("로그인 실패..");
      }

      response.sendRedirect("Finding_Buddy2.jsp");

    }
}
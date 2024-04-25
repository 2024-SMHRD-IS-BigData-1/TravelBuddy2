package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CommentDAO;
import com.smhrd.model.Member;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 파라미터의 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        // 로그인 상태 확인
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            // 로그인 되어있지 않으면 로그인 페이지로 이동
            response.sendRedirect("Login.jsp");
            return;
        }
        
        // 요청 파라미터에서 삭제할 댓글의 ID 가져오기
        int commentId = Integer.parseInt(request.getParameter("comment_id"));
        
        // 댓글 삭제하기
        CommentDAO commentDAO = new CommentDAO();
        commentDAO.deleteComment(commentId);
        
        // 삭제 후 이전 페이지로 리다이렉트
        response.sendRedirect(request.getHeader("referer"));
    }
}

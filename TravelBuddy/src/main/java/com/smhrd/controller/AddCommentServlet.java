package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.smhrd.model.Comment;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.Member;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
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
        
        // 요청 파라미터에서 댓글 내용과 게시글 인덱스 가져오기
        String commentContent = request.getParameter("comment-content");
        int buddyIdx = Integer.parseInt(request.getParameter("buddy_idx"));
        System.out.println("commentContent: " + commentContent);
        System.out.println("buddyIdx: " + buddyIdx);
        
     
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String commentDate = sdf.format(new Date());
        
      
        Comment comment = new Comment();
        comment.setMem_id(loginMember.getMem_id()); // 로그인 멤버의 아이디 설정
        comment.setComment_content(commentContent); // 댓글 내용 설정
        comment.setComment_date(commentDate); // 현재 날짜 및 시간으로 설정
        comment.setBuddy_idx(buddyIdx); // 부모 게시물의 인덱스 설정

        // 댓글 추가하기
        CommentDAO commentDAO = new CommentDAO();
        int insertedRows = commentDAO.insertComment(comment);
       
        
        if (insertedRows > 0) {
            // 댓글 추가 성공 시 게시글 페이지로 리다이렉트
            response.sendRedirect("post.jsp?buddy_idx=" + buddyIdx);
        } else {
            // 댓글 추가 실패 시 에러 페이지로 이동
            response.sendRedirect("error.jsp");
        }
    }
}

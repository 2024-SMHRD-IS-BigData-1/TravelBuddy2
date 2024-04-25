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

@WebServlet("/AddChildCommentServlet")
public class AddChildCommentServlet extends HttpServlet {
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
        
        // 요청 파라미터에서 댓글 내용과 부모 댓글 ID 가져오기
        String commentContent = request.getParameter("comment-content");
        int parentCommentId = Integer.parseInt(request.getParameter("parent_comment_id"));
        
        // 현재 시간을 형식화하여 댓글 작성일자로 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String commentDate = sdf.format(new Date());
        
        // 댓글 객체 생성 및 필드 값 설정
        Comment comment = new Comment();
        comment.setMem_id(loginMember.getMem_id()); // 로그인 멤버의 아이디 설정
        comment.setComment_content(commentContent); // 댓글 내용 설정
        comment.setComment_date(commentDate); // 현재 날짜 및 시간으로 설정
        comment.setParent_comment_id(parentCommentId); // 부모 댓글 ID 설정

        // 대댓글 추가하기
        CommentDAO commentDAO = new CommentDAO();
        int insertedRows = commentDAO.insertChildComment(comment);
        
        if (insertedRows > 0) {
            // 대댓글 추가 성공 시 이전 페이지로 리다이렉트
            response.sendRedirect(request.getHeader("referer"));
        } else {
            // 대댓글 추가 실패 시 에러 페이지로 이동
            response.sendRedirect("error.jsp");
        }
    }
}

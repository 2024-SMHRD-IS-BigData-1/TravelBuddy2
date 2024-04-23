package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;

@WebServlet("/BoardService")
public class BoardService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // post 방식 인코딩
        request.setCharacterEncoding("UTF-8");
        
        // 세션에서 mem_id 가져오기
        HttpSession session = request.getSession();
        String mem_id = (String) session.getAttribute("mem_id");
        
        if (mem_id == null) {
            // 로그인하지 않은 사용자 처리 (예: 로그인 페이지로 리다이렉트)
            response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉트하거나, 다른 방식으로 처리할 수 있습니다.
            return; // 메서드 종료
        }
        
        // 데이터 가져오기
        String place_name = request.getParameter("place_name");
        String lat = request.getParameter("lat");
        String lng = request.getParameter("lng");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String travel_dt = request.getParameter("travel_dt");
        
        System.out.println("place_name: " + place_name);
        System.out.println("lat: " + lat);
        System.out.println("lng: " + lng);
        System.out.println("title: " + title);
        System.out.println("content: " + content);
        System.out.println("travel_dt: " + travel_dt);
        System.out.println("mem_id: " + mem_id);

        // 생성자 수정
        Board board = new Board(0, place_name, lat, lng, title, content, travel_dt, mem_id);
        
        int cnt = new BoardDAO().insertBoard(board);
        
        if (cnt > 0) {
            System.out.println("게시글 등록 성공");
            // 성공 시 다른 페이지로 이동하거나 필요한 처리를 수행합니다.
        } else {
            System.out.println("게시글 등록 실패");
            // 실패 시 다른 페이지로 이동하거나 필요한 처리를 수행합니다.
        }
    }
}

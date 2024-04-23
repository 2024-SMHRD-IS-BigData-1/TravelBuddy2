package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BuddyFinding;
import com.smhrd.model.BuddyFindingDAO;

@WebServlet("/BoardService")
public class BuddyFindingService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// post 방식 인코딩
		request.setCharacterEncoding("UTF-8");

		// 데이터 가져오기
		String place_name = request.getParameter("place_name");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String travel_dt = request.getParameter("travel_dt");
		String mem_id = request.getParameter("mem_id");
		System.out.println("place_name: " + place_name);
		System.out.println("lat: " + lat);
		System.out.println("lng: " + lng);
		System.out.println("title: " + title);
		System.out.println("content: " + content);
		System.out.println("travel_dt: " + travel_dt);
		System.out.println("mem_id: " + mem_id);

		// 생성자 수정
		BuddyFinding board = new BuddyFinding(0, place_name, lat, lng, title, content, travel_dt, mem_id);

		int cnt = new BuddyFindingDAO().insertBF(board);

		if (cnt > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
	}
}

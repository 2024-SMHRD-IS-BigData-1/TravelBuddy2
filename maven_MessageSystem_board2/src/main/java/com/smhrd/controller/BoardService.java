package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;

@WebServlet("/BoardService")
public class BoardService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// post 방식 인고딩
		request.setCharacterEncoding("UTF-8");
		
		//파일업로드를 위한 변수 설정
		// 1. request 객체
		// 2. 파일을 저장할 경로(문자열)->상대경로
		// 요청에 관련된 정보이기 떄문에 request객체을 사용해서 상대경로 알아보기
		String path = request.getServletContext().getRealPath("./img");
		System.out.println(path);
		
		// 3. 파일 최대 크기(정수)
		int maxSize = 10*1024*1024; // 10MB
		
		// 4. 인코딩 타입 (문자열)
		String encoding = "UTF-8";
		
		// 5. 파일 이름 중복제거
		 DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		 
		 MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		 
		 // 데이터 가져오기
		 String title = multi.getParameter("title");
		 String writer = multi.getParameter("writer");
		 String filename = multi.getFilesystemName("filename");
		 String content = multi.getParameter("content");
		 
		// System.out.println(title + writer + filename + content);
		 
		Board board = new Board(title, writer, filename,content);
		
		int cnt = new BoardDAO().insertBoard(board);
		
		if(cnt > 0 ) {
			System.out.println("파일 업로드 성공");
		}else {
			System.out.println("파일 업로드 실패");
		}
		
		
		 
		 
	}

}

package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Community;
import com.smhrd.model.CommunityDAO;
import com.smhrd.model.Member;

@WebServlet("/CommunityService")
public class CommunityService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            // 로그인되지 않은 경우에 대한 처리
            response.sendRedirect("Login.jsp");
            return; // 빠져나갑니다.
        }

        String mem_id = loginMember.getMem_id();
        System.out.println("mem_id : " + mem_id);

        String uploadPath = request.getServletContext().getRealPath("/img/" + mem_id);
        File uploadDir = new File(uploadPath);

        // 해당 디렉토리가 없다면 디렉토리를 생성
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
            System.out.println("폴더 생성 완료: " + uploadPath);
        } else {
            System.out.println("폴더가 이미 존재합니다: " + uploadPath);
        }

        int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 10MB로 제한
        String encoding = "UTF-8";
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

        MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encoding, rename);

        String title = multi.getParameter("title");
        String category = multi.getParameter("b_category");
        String content = multi.getParameter("b_content");
        String filename = multi.getFilesystemName("filename");

        System.out.println("title: " + title);
        System.out.println("category: " + category);
        System.out.println("content: " + content);
        System.out.println("filename: " + filename);

        // 이미지 파일의 경로를 웹 페이지에 표시하기 위해 파일의 상대 경로를 구합니다.
        String imagePath = "img/" + mem_id + "/" + filename;

        // Community 객체 생성
        Community community = new Community(title, mem_id, category, content, filename);

        // CommunityDAO를 사용하여 데이터베이스에 게시글 정보 저장
        int cnt = new CommunityDAO().insertCommunity(community);

        if (cnt > 0) {
            System.out.println("게시글 업로드 성공");
        } else {
            System.out.println("게시글 업로드 실패");
        }

        // 업로드된 이미지 파일의 상대 경로를 세션에 저장
        session.setAttribute("uploadedImagePath", imagePath);

        // 이미지가 포함된 페이지로 리다이렉트
        response.sendRedirect("Community.jsp");
    }
}
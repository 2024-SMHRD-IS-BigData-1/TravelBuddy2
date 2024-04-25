package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Community;
import com.smhrd.model.CommunityDAO;
import com.smhrd.model.File;

@WebServlet("/CommunityService")
public class CommunityService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String uploadPath = getServletContext().getRealPath("/img");
        String path = uploadPath + "/img"; // "/TravelBuddy/src/main/webapp/img" 경로

        int maxSize = 10 * 1024 * 1024;
        String encoding = "UTF-8";
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

        MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);

        String content = multi.getParameter("content");
        String date = multi.getParameter("date");
        String id = multi.getParameter("id");
        String category = multi.getParameter("category");

        String fileName = multi.getOriginalFileName("file"); // 파일 이름 가져오기
        String fileSize = String.valueOf(multi.getFile("file").length()); // 파일 크기 가져오기
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1); // 파일 확장자 가져오기
        String uploadedAt = date; // 업로드 날짜는 게시글 작성 날짜와 같음

        File file = new File(fileName, fileSize, fileExt, uploadedAt, 0); // 게시글 식별자는 일단 0으로 설정
        List<File> files = new ArrayList<>();
        files.add(file);

        Community community = new Community(0, category, content, date, id, files);

        int cnt = new CommunityDAO().insertCommunity(community);

        if (cnt > 0) {
            System.out.println("게시글 업로드 성공");
        } else {
            System.out.println("게시글 업로드 실패");
        }
    }
}

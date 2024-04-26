package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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

@WebServlet("/CommunityService")
public class CommunityService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String category = request.getParameter("b_category");
        String content = request.getParameter("b_content");
        String id = request.getParameter("mem_id");
        
        String path = "C:\\Users\\Smhrd\\git\\TravelBuddy6\\TravelBuddy\\src\\main\\webapp\\img\\"+id; //폴더 경로
    	File Folder = new File(path);

    	// 해당 디렉토리가 없다면 디렉토리를 생성.
    	if (!Folder.exists()) {
    		try{
    		    Folder.mkdirs(); //폴더 생성합니다. ("새폴더"만 생성)
    		    System.out.println("폴더가 생성완료.");
    	        } 
    	        catch(Exception e){
    	        e.printStackTrace();
    		}        
             }else {
    		System.out.println("폴더가 이미 존재합니다..");
    	}
        
        path = getServletContext().getRealPath("./img./"+id);
        int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 10MB로 제한
        String encoding = "UTF-8";
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

        MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);

        String name = multi.getParameter("file_name");
        String size = multi.getParameter("file_size");
        String category = multi.getParameter("category");
        String id = multi.getParameter("mem_id"); // 사용자 아이디 정보를 어떻게 받아올 지에 따라 수정 필요


        // 파일 업로드 처리
        Enumeration<?> fileNames = multi.getFileNames();
        while (fileNames.hasMoreElements()) {
            String paramName = (String) fileNames.nextElement();
            String fileName = multi.getFilesystemName(paramName); // 변경된 파일 이름 가져오기
            String originalFileName = multi.getOriginalFileName(paramName); // 원본 파일 이름 가져오기
            String fileType = multi.getContentType(paramName); // 파일 타입 가져오기
            System.out.println("fileName: " + fileName);
            System.out.println("originalFileName: " + originalFileName);
            System.out.println("fileType: " + fileType);

            if (fileName != null) { // 파일이 선택되었는지 확인
                File file = new File(fileName, originalFileName, fileType); // 생성자 확인
                files.add(file);
            }
        }

        System.out.println("title: " + title);
        System.out.println("content: " + content);
        System.out.println("category: " + category);
        System.out.println("id: " + id);

        // Community 객체 생성
        Community community = new Community(0, category, content, null, id, title, files);

        // CommunityDAO를 사용하여 데이터베이스에 게시글 정보 저장
        CommunityDAO communityDAO = new CommunityDAO();
        int cnt = communityDAO.insertCommunity(community);

        if (cnt > 0) {
            System.out.println("게시글 업로드 성공");
        } else {
            System.out.println("게시글 업로드 실패");
        }
    }
}

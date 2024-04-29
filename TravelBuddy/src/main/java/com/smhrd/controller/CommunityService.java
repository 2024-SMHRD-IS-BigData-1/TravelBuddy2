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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Community;
import com.smhrd.model.CommunityDAO;
import com.smhrd.model.CommunityFile;
import com.smhrd.model.CommunityFileDAO;

@WebServlet("/CommunityService")
public class CommunityService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");

        int idx = Integer.parseInt(request.getParameter("b_idx"));
        String category = request.getParameter("b_category");
        String content = request.getParameter("b_content");
        String id = request.getParameter("mem_id");
        String title = request.getParameter("title");
        
        
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

        String filename = multi.getParameter("filename");

        // Community 객체 생성
        Community community = new Community(idx, title, id, category, content, filename, filename);

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

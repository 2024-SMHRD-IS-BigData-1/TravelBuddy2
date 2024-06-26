package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FollowDAO;
import com.smhrd.model.Follow;

@WebServlet("/FollowService")
public class FollowService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	System.out.println("FollowService 진입!");
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        // 가지고 오는 건 태그의 name 으로 가져옴
        // 실제 가지고 오는 값은 태그의 value 값
        String Follower = request.getParameter("Follower");
        String Followee = request.getParameter("Followee");
        String strIsFollowed = request.getParameter("isFollowed");
        
        boolean isFollowed = Boolean.parseBoolean(strIsFollowed);
        
        
        System.out.println("팔로우 상태 : " + isFollowed);
        System.out.println("입력받은 값" + "사용자 아이디 : " + Follower + " 팔로우 할 아이디 : " + Followee);
        
        String alertScript;
        
        if(!isFollowed) {	
        	Follow followVo = new Follow(Follower, Followee);
            FollowDAO dao = new FollowDAO();
            
            // 중복된 행이 없는지 다시 확인
            int resCnt = dao.insertFollow(followVo);
            
            if(resCnt > 0) {
            	alertScript = "<script>alert('팔로우가 완료되었습니다.'); history.go(-1); </script>";
            }else {
            	alertScript = "<script> alert('팔로우 실패'); history.go(-1);</script>";
            }
        }else {
        	alertScript = "<script>alert('이미 팔로우중입니다.');history.go(-1);</script>";
        }
        
       
       out.println(alertScript);
//        response.sendRedirect("followOnProfile.jsp?b_idx="+b_idx + "&isFollowed="+isFollowed);
    }
         
        

}
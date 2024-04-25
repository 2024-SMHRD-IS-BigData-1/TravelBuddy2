package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.smhrd.model.Follow;

public class FollowDAO {
	   
	   ResultSet rs = null;
	   PreparedStatement psmt = null;
	   Connection conn = null;
	   
	   
	   String TABLE_NAME = "S_FOLLOWING";
	   
	   String COLUMN_IDX = "FOLLOW_IDX";
	   String COLUMN_WER = "FOLLOWER";
	   String COLUMN_WEE = "FOLLOWEE";
	   

	   
	   
	
	   public boolean FollowCheck(String userId, String otherId) {
		   	boolean res = false;
			   
		      connection();
		      		      
		      String sql = "SELECT COUNT(*) AS cnt  "
		    		  +" FROM "+ TABLE_NAME + " " 
		    		  + " WHERE " + COLUMN_WER + " = ? "
		    		  + " AND " + COLUMN_WEE + " = ? ";
		      
		      
		      try {
		    	  
		         
		         psmt = conn.prepareStatement(sql);
		      
		         
		         // 변수 설정
		         psmt.setString(1, userId);
		         psmt.setString(2, otherId);
		         
		         
		         rs = psmt.executeQuery();

		         
		         int cnt = 0;
		         while(rs.next()) {
		        	 cnt = rs.getInt("cnt");
		        	 System.out.println("[checkFollowStat]팔로우 체크(0:팔로우아님/ 1:팔로우중) cnt => " + cnt);
		         }
		      
		         if(cnt > 0) {
		        	 res = true;
		         }
		         
		         
		      } catch (SQLException e) {
		    	 System.out.println("예외 발생 : " + e.toString());
		         e.printStackTrace();
		      } finally {
		         close();
		         System.out.println("finally");
		      }
		      
		      return res;
	   }

	  
	  
	   
	   // 팔로우하기
	   public int insertFollow(Follow vo) {      
	   
		   int cnt = 0;
		   
		   boolean isFollowCheck = FollowCheck(vo.getFollower(), vo.getFollowee());
		   
		   if(isFollowCheck) {
			   // true : 이미 동일한 row 존재
			   cnt = 1;
			   return cnt;
		   }else {
			   // false : insert 가능
			      connection();
			      
			      try {
			    	// false : insert 가능
			    		 String sql = "insert into " + TABLE_NAME + " ("+ COLUMN_IDX +" ," + COLUMN_WER +", " + COLUMN_WEE + ") values(FOLLOWING_SEQ.nextval, ?, ?)";
				         psmt = conn.prepareStatement(sql);
				      
				         
				         psmt.setString(1, vo.getFollower());
				         psmt.setString(2, vo.getFollowee());
				         
				         
				         cnt = psmt.executeUpdate();
				         System.out.println("insertFollow cnt 리턴 완료 : " + cnt);

			      } catch (SQLException e) {
			    	  System.out.println("예외 발생 : " + e.toString());
			    	  e.printStackTrace();
			      } finally {
			         close();
			         System.out.println("finally");
			      }
			      
			      return cnt;
		   }
	
	   }
	   
	   
	   // 데이터베이스 권한 확인 메소드
	   private void connection() {
		
	      try {
	    	  if(conn != null && !conn.isClosed()) {
	    		  return;
	    	  }
	         
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	         String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
	         String id = "campus_24IS_BIG3_P2_5";
	         String pw = "smhrd5";
	         conn = DriverManager.getConnection(url, id, pw);
	   
	         
	      } catch (ClassNotFoundException e) {
	         System.out.println("동적로딩실패");
	         e.printStackTrace();
	      } catch (SQLException e) {
	         System.out.println("권한확인실패");
	         e.printStackTrace();
	      }
	   }
	   

	   
	   // finally 
	   private void close() {
	      try {
	             if(rs != null) {
	             rs.close();
	             }
	             if(psmt != null) {
	                psmt.close();
	             }
	             if(conn != null) {
	                conn.close();
	             }
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	   }
	   
	   
	   
	}
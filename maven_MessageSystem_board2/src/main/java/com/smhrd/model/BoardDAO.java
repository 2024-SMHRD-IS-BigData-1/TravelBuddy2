package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 게시글 작성
	public int insertBoard(Board board) {
	SqlSession session = 	sqlSessionFactory.openSession(true);
	int cnt = session.insert("com.smhrd.db.BoardMapper.insertBoard", board);
	session.close();
	return cnt;
	}
	

}

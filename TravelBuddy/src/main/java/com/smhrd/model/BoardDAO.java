package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BoardDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 게시글 작성
	public int insertBoard(Board board) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.BoardMapper.insertBoard", board);
		session.close();
		return cnt;
	}
	
	// 게시글 전체 조회
	public List<Board> showBoard(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Board> boardList = session.selectList("com.smhrd.db.BoardMapper.showBoard");
		return boardList;
	}
	
	// 세부 게시글 조회
	public Board detailBoard(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Board board = session.selectOne("com.smhrd.db.BoardMapper.detailBoard",num);
		session.close();
		return board;
		
	}

	public void boardDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("com.smhrd.db.BoardMapper.boardDelete", num);
		session.close();
	}
	

}

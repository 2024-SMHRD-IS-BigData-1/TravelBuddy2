package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BuddyFindingDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 게시글 작성
	public int insertBF(BuddyFinding buddyFinding) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.BuddyFindingMapper.insertBF", buddyFinding);
		session.close();
		return cnt;
	}
	
	// 게시글 삭제
	public void deleteBF(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("com.smhrd.db.BuddyFindingMapper.deleteBF", num);
		session.close();
	}

}

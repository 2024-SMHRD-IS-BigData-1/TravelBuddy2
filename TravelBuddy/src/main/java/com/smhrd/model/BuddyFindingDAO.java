package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BuddyFindingDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertBF(BuddyFinding buddyFinding) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = 
		
		return null;
	}

}

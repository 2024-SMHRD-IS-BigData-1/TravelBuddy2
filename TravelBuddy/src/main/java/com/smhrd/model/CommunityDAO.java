package com.smhrd.model;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CommunityDAO {
	 SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public int insertCommunity(Community community) {
	SqlSession session = sqlSessionFactory.openSession(true);
	int cnt  =session.insert("com.smhrd.db.CommunityMapper.insertCommunity" , community);
	session.close();
	return cnt;
}


	public int update(Community community) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Member community1 = session.selectOne("com.smhrd.db.CommunityMapper.update",community);
		return 0;
	}
}

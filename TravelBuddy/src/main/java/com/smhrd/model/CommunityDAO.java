package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class CommunityDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int insertCommunity(Community community) {
    	SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.CommunityMapper.insertCommunity", community);
		session.close();
		return cnt;
    }
    
    public List<Community> showCommunity(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Community> communityList = session.selectList("com.smhrd.db.CommunityMapper.showCommunity");
		session.close();
		return communityList;
	}
    
    public Community detailCommunity(int b_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Community community = session.selectOne("com.smhrd.db.CommunityMapper.detailCommunity", b_idx);
		session.close();
		return community;
	}

}

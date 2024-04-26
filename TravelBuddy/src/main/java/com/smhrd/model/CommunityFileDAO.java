package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CommunityFileDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertCommunityFile(CommunityFile communityFile) {
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int Fcnt = session.insert("com.smhrd.db.CommunityFileMapper.insertCommunityFile", communityFile);
            return Fcnt;
        }

}
	
}

package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class CommunityDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int insertCommunity(Community community) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.db.CommunityMapper.insertCommunity", community);
            return cnt;
        }
    }
}

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

    public int insertFile(File file) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.db.CommunityMapper.insertFile", file);
            return cnt;
        }
    }

    public int update(Community community) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            Member community1 = session.selectOne("com.smhrd.db.CommunityMapper.update", community);
            return 0;
        }
    }
}

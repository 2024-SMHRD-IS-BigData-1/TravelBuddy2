package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class FileDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int insertFile(File file) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.db.FileMapper.insertFile", file);
            return cnt;
        }
    }
}

package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BuddyFindingDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 게시글 작성
    public int insertBF(BuddyFinding buddyFinding) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.db.BuddyFindingMapper.insertBF", buddyFinding);
            return cnt;
        }
    }

    // 게시글 삭제
    public void deleteBF(int buddy_idx) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            session.delete("com.smhrd.db.BuddyFindingMapper.deleteBF", buddy_idx);
        }
    }

    // mem_id에 해당하는 BuddyFinding 객체 조회
    public BuddyFinding getBuddyFindingByBuddyIdx(int buddy_idx) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("com.smhrd.db.BuddyFindingMapper.selectByBuddyIdx", buddy_idx);
        }
    }
    public List<BuddyFinding> showBoard(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BuddyFinding> boardList = session.selectList("com.smhrd.db.BuddyFindingMapper.showBoard");
		session.close();
		return boardList;
	}
    
    
}

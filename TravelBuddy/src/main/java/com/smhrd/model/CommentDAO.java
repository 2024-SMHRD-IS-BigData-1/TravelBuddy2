package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

import java.util.List;

public class CommentDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 댓글 추가
    public int insertComment(Comment comment) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.model.CommentMapper.insertComment", comment);
            return cnt;
        }
    }

    // 댓글 삭제
    public void deleteComment(int commentId) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            session.delete("com.smhrd.model.CommentMapper.deleteComment", commentId);
        }
    }

    // 특정 글에 대한 댓글 목록 가져오기
    public List<Comment> getCommentsByBuddyIdx(int buddyIdx) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("com.smhrd.model.CommentMapper.getCommentsByBuddyIdx", buddyIdx);
        }
    }
}

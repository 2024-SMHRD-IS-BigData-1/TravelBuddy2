package com.smhrd.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.smhrd.model.Member;
import java.util.List;


//MatchingDAO.java
import org.apache.ibatis.session.SqlSession;

//MatchingDAO.java
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MatchingDAO {
 private SqlSession sqlSession;

 public MatchingDAO(SqlSession sqlSession) {
     this.sqlSession = sqlSession;
 }

 public String selectTendencyResultByMemId(String memId) {
     return sqlSession.selectOne("MatchingMapper.selectTendencyResultByMemId", memId);
 }
 
 public List<String> selectAllTendencyResults() {
     return sqlSession.selectList("MatchingMapper.selectAllTendencyResults");
 }
}


package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class SurveyResultDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 설문조사 결과 삽입
    public int insertSurveyResult(SurveyResult surveyResult) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            int cnt = session.insert("com.smhrd.db.SurveyResultMapper.insertSurveyResult", surveyResult);
            return cnt;
        }
    }
    public SurveyResult getSurveyResultByMemId(String mem_id) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            SurveyResult surveyResult = session.selectOne("com.smhrd.db.SurveyResultMapper.getSurveyResultByMemId", mem_id);
            return surveyResult;
        }
    }

}

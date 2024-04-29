package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import com.smhrd.model.MatchingDAO;

@WebServlet("/MatchingService")
public class MatchingService {
 private MatchingDAO matchingDAO;

 public MatchingService(MatchingDAO matchingDAO) {
     this.matchingDAO = matchingDAO;
 }

 public List<String> findMatchingUsers(String loginMemId, String loginTendencyResult) {
     List<String> matchedUsers = new ArrayList<>();
     
     // 본인의 여행 성향 결과 조회
     String myTendencyResult = matchingDAO.selectTendencyResultByMemId(loginMemId);
     
     // 모든 사용자의 여행 성향 결과 조회
     List<String> allUsersTendencyResults = matchingDAO.selectAllTendencyResults();
     
     // 로그인된 사용자와 매칭되는 다른 사용자들의 여행 성향 결과 비교
     for (String userTendencyResult : allUsersTendencyResults) {
         if (!userTendencyResult.equals(myTendencyResult)) {
             matchedUsers.add(userTendencyResult);
         }
     }
     
     return matchedUsers;
 }
}

package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.SurveyResult;
import com.smhrd.model.SurveyResultDAO;

@WebServlet("/SurveyService")
public class SurveyService extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[SurveyService]");
        // 클라이언트로부터의 데이터 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 클라이언트로부터 데이터 가져오기
        String mem_id = request.getParameter("mem_id");

        // SurveyResultDAO를 통해 해당 사용자의 설문조사 결과 조회
        SurveyResultDAO surveyResultDAO = new SurveyResultDAO();
        SurveyResult existingSurveyResult = surveyResultDAO.getSurveyResultByMemId(mem_id);

        // 이미 설문조사를 한 사용자인 경우
        if (existingSurveyResult != null) {
            System.out.println("해당 사용자는 이미 설문조사를 완료했습니다.");
            response.sendRedirect("test(fail).jsp"); // 이미 설문조사를 한 경우의 페이지 경로에 맞게 수정
            return;
        }

        // 설문조사 결과를 문자열로 조합하여 객체에 저장
        String personality = request.getParameter("personality");
        String travelStyle = request.getParameter("travel_style");
        String[] preferredActivities = request.getParameterValues("preferred_activity");
        String photoPreference = request.getParameter("photo_preference");
        String transportationPreference = request.getParameter("transportation_preference");
        String walkingPreference = request.getParameter("walking_preference");
        String spendingHabit = request.getParameter("spending_habit");
        String alcoholPreference = request.getParameter("alcohol_preference");

        String surveyData = personality + "," + travelStyle + ",";
        if (preferredActivities != null && preferredActivities.length > 0) {
            surveyData += "(" + String.join(",", preferredActivities) + ")";
        }
        surveyData += "," + photoPreference + "," + transportationPreference + "," + walkingPreference + ","
                + spendingHabit + "," + alcoholPreference;

        System.out.println("mem_id " + mem_id);
        System.out.println("설문결과" + surveyData);

        // SurveyResultDAO를 통해 데이터베이스에 삽입
        SurveyResult surveyResult = new SurveyResult();
        surveyResult.setMem_id(mem_id);
        surveyResult.setTendency_result(surveyData);

        // SurveyResultDAO를 통해 데이터베이스에 삽입
        int rowsAffected = surveyResultDAO.insertSurveyResult(surveyResult);

        if (rowsAffected > 0) {
            System.out.println("설문 조사 데이터가 성공적으로 삽입되었습니다!");
            response.sendRedirect("test(result).jsp");
        } else {
            System.out.println("설문 조사 데이터 삽입에 실패했습니다.");
        }
    }
}

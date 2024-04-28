package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@WebServlet("/SendSms")
public class SendSmsService extends HttpServlet {

	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	System.out.println("SendSmsService 진입!");
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		String inputData = request.getParameter("phone");
		
		
		
		String smsNumber = createNumber();
		// 여기서 false 하면 실제 문자는 안 가고 콘솔 창에 뜬 번호로 테스트 할 수 있음
		boolean isSuccess = send(false, inputData, smsNumber);
		
		PrintWriter out = response.getWriter();
		
		if(isSuccess) {
			out.print(smsNumber);	
		}else {
			out.print(false);
		}
		
	       
	}

	// 인증번호 랜덤 생성
	public String createNumber() {		
        // Random 객체 생성
        Random random = new Random();
        // 1000부터 9999까지의 숫자 중 하나를 랜덤하게 선택
        int randomNumber = random.nextInt(9000) + 1000; // 0부터 8999까지의 숫자에 1000을 더해 1000부터 9999까지의 범위로 변환
        return String.valueOf(randomNumber); // 생성된 숫자를 문자열로 반환
	}
	
	
	public boolean send(boolean isReal, String to_phoneNumber, String randomNum) {
		
		to_phoneNumber = to_phoneNumber.replaceAll("[^\\d]", "");
		
		if(to_phoneNumber.length() != 11) {
			System.out.println("휴대폰 번호가 맞지 않음 -> " + to_phoneNumber);
			return false;
		}
		
		if(isReal) {
			// 최종 테스트나 프로젝트 발표할 때 isReal 을 true 로 한다. send(true) => 실제로 문자 전송됨.
			String api_key = "NCSXKWW4CFTGBGGV";
			String api_secret = "SVFW6XK9TOSTATC1PM39BXRU1TKHEKCM";
			Message coolsms = new Message(api_key, api_secret);

			String text  = "[Travel Buddy] 본인확인 인증번호\n\""+randomNum+"\"를 화면에 입력하세요.";
			// 필수 데이터 4개 (to, from, type, text)
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", to_phoneNumber); // 수신번호
			params.put("from", "01097489377"); // 발신번호
			params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
			params.put("text", text); // 문자내용
			
			
			try {
			     JSONObject obj = (JSONObject) coolsms.send(params);
			     System.out.println(obj.toString());
			     return true;
			   } catch (CoolsmsException e) {
			     System.out.println(e.getMessage());
			     System.out.println(e.getCode());
			     // 예외 발생 시 false 리턴. 문자 수신이 안 됐다고 알리기
			     return false;
			   }
			
			}else {
				// 테스트 시 isReal를 false 로 한다. -> 문자 전송 안됨.
				System.out.println("to:" + to_phoneNumber + "\n" + "number:" + randomNum);
				return true;
			}
		
	}
	

}

package com.smhrd.frontcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	// 인터페이스 : 를 ex) 이력서
	// 추상메소드 : 무조건 구현해야하는 메소드 ex) 이름, 전화번호, 주소 ...
	
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);

}

package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class EmailCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 중복체크 기능
		String inputE = request.getParameter("inputE");
		System.out.println(inputE);
		Member member = new MemberDAO().emailCheck(inputE);
		PrintWriter out;
		try {
			out = response.getWriter();
			if(member == null) {
				// 사용가능한 이메일 -> true
				out.print(true);
			}else {
				// 사용불가능한 이메일 -> false
				out.print(false);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}

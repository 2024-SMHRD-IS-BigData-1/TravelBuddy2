<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String result = request.getParameter("result");
		pageContext.setAttribute("result", result);
	%>

	<a href="Join.jsp"><button>회원가입</button></a>
	<%-- <%
		if(result != null){
			if(result.equals("success")){
				out.print("<h3>회원가입에 성공했습니다!</h3>");
			}else{
				out.print("<h3>회원가입에 실패했습니다..</h3>");
			}
		}
	%> --%>
	
	<!-- JSTL 태그  -->
	<c:if test="${!empty result }">
	
		<c:choose>
			
			<c:when test="${result eq 'success' }">
				<h3>회원가입에 성공했습니다!</h3>
			</c:when>
			<c:otherwise>
				<h3>회원가입에 실패했습니다..</h3>
			</c:otherwise>
			
		</c:choose>
	
	</c:if>
	
	<%
		Member member = (Member)session.getAttribute("member");
		if(member == null){ // 로그인 안한 상태
			out.print("<a href='Login.jsp'><button>로그인</button></a>");
		}else{ // 로그인을 한 상태
			out.print("<p>"+member.getName()+"님 환영합니다~</p>");
			out.print("<button>개인정보수정</button>");
			out.print("<button>회원탈퇴</button>");
			out.print("<button>로그아웃</button>");
		}
	
	%>
	
	
	
	
	




</body>
</html>
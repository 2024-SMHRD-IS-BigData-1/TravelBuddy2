<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, 
                initial-scale=1.0">
<title>버디매칭</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-color: #eee;
}

.navbar {
	display: flex;
	align-items: center;
	background-color: white;
	padding: 12px;
	margin-top: -25px;
}

.navbar img {
	margin-left: 275px;
}

.nav_menu {
	display: flex;
	list-style: none;
	justify-content: center;
	padding-right: 0;
	margin: 10px;
	margin-top: 0px;
}

.nav_menu li {
	margin: 22px;
}

.nav_menu li a {
	font-size: 22px;
	display: inline-block;
	text-decoration: none;
	padding: 0 25px;
	color: #2D2F7A;
}

.nav_menu li a:hover {
	color: #1e1f5e;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 200px;
}

h1 {
	text-align: center;
	color: #2D2F7A;
}

.message {
	text-align: center;
	margin-bottom: 20px;
}

.button-container {
	text-align: center;
}

button {
	padding: 10px 20px;
	background-color: #2D2F7A;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #1e1f5e;
}
</style>
</head>

<body>
	<nav class="navbar">
		<img src="images/bg23412.jpg" alt="Background Image">
		<ul class="nav_menu">
			<li><a href="Main.jsp"><b>메인화면</b></a></li>
			<li><a href="test.jsp"><b>버디매칭</b></a></li>
			<li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
			<li><a href="Communuity.jsp"><b>커뮤니티</b></a></li>
			<li><a href="Profile.jsp"><b>프로필</b></a></li>
		</ul>
	</nav>
	<div class="container">
		<h1>당신은 이미 하셨네요?</h1>
		<div class="message">
			<p>매칭만 하시면됩니다!</p>
		</div>
		<form action="MatchingService" method="post">
			<%@ page import="com.smhrd.model.Member"%>

			<%
			Member loginMember = (Member) session.getAttribute("loginMember");
			String mem_id = "";
			if (loginMember != null) {
				mem_id = loginMember.getMem_id();
			}
			%>
			<input type="hidden" value="board_write" name="command"> <input
				type="hidden" name="mem_id" value="<%=mem_id%>">
			<div class="button-container">
				<button onclick="startMatching()">매칭 시작하기</button>
			</div>
		</form>
	</div>
</body>
</html>

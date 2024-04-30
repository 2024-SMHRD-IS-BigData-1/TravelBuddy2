<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.smhrd.model.FollowDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 설정</title>
<style>
:root {
	--accent-color: #BAD7E9;
	--text-color: #2D2F7A;
	--background-color: #5e63f5;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	background-color: #f5f6f7;
	margin: 0;
}

main {
	max-width: 935px;
	margin: 0 auto;
	padding: 30px 20px 0px 20px;
}

@media only screen and (max-width: 735px) {
	main {
		padding: 0;
	}
}

.search-icon {
	background-image: url("/images/icons.png");
	background-size: 440px 411px;
	background-position: -428px -241px;
	width: 10px;
	height: 10px;
	display: block;
}

.arrow-right-icon {
	background-image: url("/images/icons.png");
	background-size: 440px 411px;
	background-position: -402px -207px;
	width: 24px;
	height: 24px;
	transform: rotate(180deg);
	display: block;
}

.media-icon {
	background-image: url("/images/icons-2.png");
	background-size: 65px 65px;
	background-position: 0 0;
	display: block;
	width: 32px;
	height: 32px;
}

button {
	all: unset;
	font-weight: 600;
	font-size: 14px;
	color: #1e1f5e;
	line-height: 18px;
	padding: 5px 9px;
	border-radius: 4px;
}

button.primary {
	background: #1e1f5e;
	color: white;
	-webkit-text-fill-color: white;
}

.verified-icon {
	background-image: url("/images/icons.png");
	background-position: -194px -351px;
	background-size: 440px 411px;
	width: 18px;
	height: 18px;
	display: block;
}

/* Utils */
.mobile-only {
	display: none;
}

@media only screen and (max-width: 735px) {
	.mobile-only {
		display: block;
	}
	.desktop-only {
		display: none;
	}
}

@import url("./reset.css");

@import url("./common.css");

/* Navigation */
nav .logo {
	height: 29px;
}

.search-guide .search-placeholder {
	color: hsl(0, 0%, 56%);
	font-size: 14px;
	margin-left: 6px;
}

.search-guide {
	width: 215px;
	background: hsl(0, 0%, 98%);
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 6px 26px;
	border-radius: 3px;
	border: 1px solid hsl(0, 0%, 86%);
}

.nav-content {
	max-width: 935px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	height: 54px;
	align-items: center;
}

@media only screen and (max-width: 735px) {
	.nav-content {
		padding: 0 20px;
	}
}

nav .fixed {
	background: white;
	position: fixed;
	z-index: 1;
	width: 100%;
	border-bottom: 1px solid hsl(0, 0%, 86%);
}

nav .mock {
	height: 54px;
}

/* Header */
header {
	margin-bottom: 44px;
}

@media only screen and (max-width: 735px) {
	header {
		margin-bottom: 0px;
	}
}

.header-grid {
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 20px;
}

@media only screen and (max-width: 735px) {
	.header-grid {
		display: flex;
		padding: 14px;
	}
}

.header-grid .profile-pic {
	height: 160px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.header-grid .profile-pic img {
	width: 150px;
	height: 150px;
	border-radius: 1000px;
	border: 1px solid hsl(0, 0%, 86%);
}

@media only screen and (max-width: 735px) {
	.header-grid .profile-pic {
		width: 77px;
		height: 77px;
		margin-right: 28px;
	}
	.header-grid .profile-pic img {
		width: 100%;
		height: 100%;
	}
}

.profile-info .title h2 {
	font-size: 28px;
	font-weight: 300;
}

.profile-info .title {
	display: flex;
	align-items: center;
}

.profile-info .title span {
	margin-left: 8px;
}

.profile-info .title button {
	margin-left: 20px;
}

@media only screen and (max-width: 735px) {
	.profile-info .title {
		display: block;
	}
	.profile-info .title h2 {
		display: inline-block;
		margin-bottom: 12px;
	}
	.profile-info .title span {
		display: inline-block;
	}
	.profile-info .title button {
		display: block;
		margin-left: 0px;
	}
}

.profile-info .details li {
	font-size: 16px;
	font-weight: 400;
	margin-right: 40px;
}

.profile-info .details li span {
	font-weight: 600;
}

.profile-info .details ul {
	display: flex;
}

.profile-info .description h1 {
	font-weight: 600;
	line-height: 24px;
}

.profile-info .description span {
	font-weight: 400;
	line-height: 24px;
}

.profile-info .description a {
	color: hsl(209, 100%, 21%);
}

@media only screen and (max-width: 735px) {
	.profile-info .description h1 {
		line-height: 20px;
	}
	.profile-info .description span {
		line-height: 20px;
	}
	.profile-info .description {
		font-size: 14px;
		padding-left: 16px;
		padding-bottom: 21px;
		margin-bottom: 0px !important;
	}
}

.profile-info .row {
	margin-bottom: 20px;
}

.profile-info .row.last {
	margin-bottom: 0px;
}

/* Story */
.story-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 10px 15px;
}

@media only screen and (max-width: 735px) {
	.story-item {
		padding: 0px 5px;
	}
}

.story-item .image img {
	width: 77px;
	height: 77px;
	border-radius: 1000px;
	display: block;
}

@media only screen and (max-width: 735px) {
	.story-item .image img {
		width: 56px;
		height: 56px;
	}
}

.story-item .image {
	border: 1px solid hsl(0, 0%, 86%);
	border-radius: 1000px;
	padding: 3px;
}

.story-item .title {
	font-size: 14px;
	font-weight: 600;
	padding-top: 15px;
	text-align: center;
	white-space: nowrap;
	width: 80px;
	overflow: hidden;
	text-overflow: ellipsis;
}

@media only screen and (max-width: 735px) {
	.story-item .title {
		font-size: 12px;
		font-weight: 400;
		width: 65px;
		padding-top: 8px;
	}
}

.stories {
	display: flex;
	padding: 0 24px;
	overflow-x: scroll;
	position: relative;
	margin-bottom: 44px;
}

@media only screen and (max-width: 735px) {
	.stories {
		padding: 0px;
		margin-bottom: 21px;
	}
}

.slider-button-next {
	position: sticky;
	right: 0;
	display: flex;
	align-items: center;
}

/* Tabs */
.tab-item span {
	font-size: 12px;
	font-weight: 600;
	color: hsl(0, 0%, 56%);
	margin-left: 6px;
}

.tab-item {
	display: flex;
	align-items: center;
	height: 52px;
	margin-right: 60px;
}

.tab-item.last {
	margin-right: 0px;
}

.tab-item.active span {
	color: hsl(0, 0%, 15%);
}

.tab-item.active {
	border-top: 1px solid hsl(0, 0%, 15%);
	margin-top: -1px;
}

.tabs {
	display: flex;
	justify-content: center;
	border-top: 1px solid hsl(0, 0%, 86%);
}

.mobile-tabs li {
	font-size: 14px;
	font-weight: 400;
	color: rgb(142, 142, 142);
	line-height: 18px;
	text-align: center;
}

.mobile-tabs li div {
	font-weight: 600;
	color: rgb(38, 38, 38);
}

.mobile-tabs ul {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	padding: 12px 0px;
	border-top: 1px solid rgb(219, 219, 219);
}

.mobile-tabs .actions {
	display: flex;
	justify-content: space-around;
	height: 44px;
	align-items: center;
	border-top: 1px solid rgb(219, 219, 219);
}

/* Gallery */
.gallery-item img {
	width: 100%;
	display: block;
}

.gallery-item {
	background: tomato;
	position: relative;
}

.gallery-item .media-icon {
	position: absolute;
	top: 0;
	right: 0;
}

.gallery {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 28px;
}

@media only screen and (max-width: 735px) {
	.gallery {
		gap: 3px;
	}
}

textarea[name="title"] {
	height: 25px;
}

textarea[name="name"] {
	height: 50px;
}

a {
	text-decoration: none;
	color: var(--text-color);
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
	padding: 8px 12px;
	margin-top: 0px;
}

.nav_logo i {
	color: var(--accent-color);
}

.nav_logo span {
	color: var(--accent-color);
}

.nav_menu {
	display: flex;
	list-style: none;
	justify-content: center;
	padding-right: 550px;
	margin: 0px;
}

.nav_menu li {
	margin: 0px;
}

.nav_menu li a {
	font-size: 22px;
	display: inline-block;
	padding: 0 55px;
}

.nav_menu li a:hover {
	color: var(--background-color);
}

.nav_icons {
	display: flex;
	color: #7dc0ff;
	list-style: none;
	padding-left: 0;
}

.nav_icons li {
	padding: 8px 5px;
}

.navbar img {
	margin-left: 300px;
}

@media ( max-width : 768px) {
	.nav_menu {
		display: none;
	}
	.nav_icons {
		display: none;
	}
	.navbar_toggleBtn {
		display: block;
	}
}

.hashtag {
	display: inline-block;
	margin-right: 5px;
	margin-bottom: 5px;
	padding: 5px 10px;
	background-color: rgb(170, 170, 170);
	border-radius: 5px;
	color: #ffffff;
}

.profile-pic {
	position: relative;
}

.profile-pic img {
	max-width: 100%;
	height: auto;
}

.profile-pic .primary {
	position: absolute;
	top: 175px;
	left: 50%;
	transform: translateX(-50%);
	background-color: white;
	color: #2D2F7A;
	-webkit-text-fill-color: #2D2F7A;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}
</style>

</head>
<body>


	<%
	// Importing necessary Java classes and DAO
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	String mem_id = request.getParameter("mem_id");

	if (mem_id != null && !mem_id.isEmpty()) {
		System.out.println("조건문 if : " + mem_id);
	} else {
		System.out.println("조건문 else : " + null);
		
	}

	System.out.println("mem_id 값 : " + mem_id);

	try {
		// Setting up database connection
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
		String id = "campus_24IS_BIG3_P2_5";
		String pw = "smhrd5";

		conn = DriverManager.getConnection(url, id, pw);

		request.setCharacterEncoding("UTF-8");

		String sqlQuery = "select mem_info, mem_pic, mem_id, mem_nick from members where mem_id = ?";

		pstmt = conn.prepareStatement(sqlQuery);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			String mem_info = rs.getString("mem_info");
			String mem_pic = rs.getString("mem_pic");
			mem_id = rs.getString("mem_id");
			String mem_nick = rs.getString("mem_nick");

			System.out.print(mem_info + mem_pic + mem_id + mem_nick);
			

			if(mem_pic == null || mem_pic.isBlank() || mem_pic.isEmpty() || mem_pic.equalsIgnoreCase("null")){
				// pic 없는 경우 기본 사진 띄워줌
				mem_pic = "imgPic/pic_null.png";
			}
			
		 	System.out.println(mem_pic + ", " + mem_id);
	%>


	</div>



	<nav class="navbar">
		<a href="Main.jsp"><img src="images/bg23412.jpg"
			alt="Background Image"></a>
		<ul class="nav_menu">
			<li><a href="Main.jsp"><b>메인화면</b></a></li>
			<li><a href="test.jsp"><b>버디매칭</b></a></li>
			<li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
			<li><a href="Communuity.jsp"><b>커뮤니티</b></a></li>
			<li><a href="MyProfile.jsp?mem_id=<%= mem_id%>"><b>프로필</b></a></li>
			<li><a href="LogoutService"><b>로그아웃</b></a></li>
		</ul>
	</nav>
	<main>
		<header>

			<hr>
			<div class="header-grid">
				<div class="profile-pic">
					<img src="<%=mem_pic%>" /> <a href="ReProfile.jsp">
				</div>
				<div class="profile-info">
					<div class="title row">
						<h1><%=mem_nick%></h1>
						<span class="verified-icon"></span>
						<form id="followForm" action="FollowService" method="post">
							
							<input type="hidden" name="Followee" value="<%=mem_id%>">
							
							<button class="primary"
								value=""
								>팔로우</button>
						</form>

						<%
						String sqlQuery2 = "SELECT (SELECT COUNT(*) FROM Following WHERE follower = ?) AS follower_count, "
								+ "(SELECT COUNT(*) FROM Following WHERE followee = ?) AS followee_count, "
								+ "((SELECT COUNT(*) FROM community WHERE mem_id = ?) + (SELECT COUNT(*) FROM finding_buddy WHERE mem_id = ?)) AS total_count "
								+ "FROM dual";

						pstmt = conn.prepareStatement(sqlQuery2);
						pstmt.setString(1, mem_id);
						pstmt.setString(2, mem_id);
						pstmt.setString(3, mem_id);
						pstmt.setString(4, mem_id);

						String followerCnt = "";
						String followeeCnt = "";
						String postCnt = "";

						rs = pstmt.executeQuery();

						if (rs.next()) {
							followerCnt = rs.getString("follower_count");
							followeeCnt = rs.getString("followee_count");
							postCnt = rs.getString("total_count");

						}
						%>

					</div>
					<div class="desktop-only">
						<div class="details row">
							<ul>
								<li><span><%=postCnt%></span> 게시물</li>
								<li><span><%=followerCnt%></span> 팔로워</li>
								<li><span><%=followeeCnt%></span> 팔로잉</li>
							</ul>
						</div>
						<div class="description row last">
							<span> <%=mem_info%>
							</span>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="w3-card w3-round w3-white w3-hide-small">
			<div class="w3-container">
				<p>
					<a class="hashtag">#해외여행</a> <a class="hashtag">#같이갈사람</a> <a
						class="hashtag">#구해요</a> <a class="hashtag">#고영희좋아</a> <a
						class="hashtag">#햄찌좋아</a> <a class="hashtag">#댕댕이좋아</a> <a
						class="hashtag">#유럽</a> <a class="hashtag">#필수코스 참여하는편</a> <a
						class="hashtag">#야밤에 별구경</a> <a class="hashtag">#워커홀릭</a> <a
						class="hashtag">#인스타블로거</a>
				</p>
			</div>
		</div>
		<br>
		<div class="desktop-only">
			<svg aria-label="Posts" class="_8-yf5" fill="#262626" height="12"
				viewBox="0 0 48 48" width="12">
</svg>
		</div>
		<div class="mobile-tabs mobile-only">
			<ul>
				<li>
					<div>722</div> posts
				</li>
				<li>
					<div>25.1m</div> followers
				</li>
				<li>
					<div>6</div> following
				</li>
			</ul>
			<div class="actions">
				<svg aria-label="Posts" class="_8-yf5" fill="rgb(0, 149, 246)"
					height="24" viewBox="0 0 48 48" width="24">
<path clip-rule="evenodd"
						d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z"
						fill-rule="evenodd"></path>
</svg>
				<svg aria-label="Posts" class="_8-yf5" fill="#8e8e8e" height="24"
					viewBox="0 0 48 48" width="24">
<path
						d="M41 10c-2.2-2.1-4.8-3.5-10.4-3.5h-3.3L30.5 3c.6-.6.5-1.6-.1-2.1-.6-.6-1.6-.5-2.1.1L24 5.6 19.7 1c-.6-.6-1.5-.6-2.1-.1-.6.6-.7 1.5-.1 2.1l3.2 3.5h-3.3C11.8 6.5 9.2 7.9 7 10c-2.1 2.2-3.5 4.8-3.5 10.4v13.1c0 5.7 1.4 8.3 3.5 10.5 2.2 2.1 4.8 3.5 10.4 3.5h13.1c5.7 0 8.3-1.4 10.5-3.5 2.1-2.2 3.5-4.8 3.5-10.4V20.5c0-5.7-1.4-8.3-3.5-10.5zm.5 23.6c0 5.2-1.3 7-2.6 8.3-1.4 1.3-3.2 2.6-8.4 2.6H17.4c-5.2 0-7-1.3-8.3-2.6-1.3-1.4-2.6-3.2-2.6-8.4v-13c0-5.2 1.3-7 2.6-8.3 1.4-1.3 3.2-2.6 8.4-2.6h13.1c5.2 0 7 1.3 8.3 2.6 1.3 1.4 2.6 3.2 2.6 8.4v13zM34.6 25l-9.1 2.8v-3.7c0-.5-.2-.9-.6-1.2-.4-.3-.9-.4-1.3-.2l-11.1 3.4c-.8.2-1.2 1.1-1 1.9.2.8 1.1 1.2 1.9 1l9.1-2.8v3.7c0 .5.2.9.6 1.2.3.2.6.3.9.3.1 0 .3 0 .4-.1l11.1-3.4c.8-.2 1.2-1.1 1-1.9s-1.1-1.2-1.9-1z"></path>
</svg>
				<svg aria-label="Tagged" class="_8-yf5" fill="#8e8e8e" height="24"
					viewBox="0 0 48 48" width="24">
<path
						d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path>
</svg>
			</div>
		</div>
		<div class="gallery">
			<div class="gallery-item">
				<a href="images/013.jpg" title="사진 1에 대한 설명"> <img
					src="images/013.jpg" /> <span class="media-icon"></span>
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/021.jpg" title="사진 2에 대한 설명"> <img
					src="images/021.jpg" />
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/016.jpg" title="사진 3에 대한 설명"> <img
					src="images/016.jpg" /> <span class="media-icon"></span>
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/017.jpg" title="사진 4에 대한 설명"> <img
					src="images/017.jpg" />
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/015.jpg" title="사진 5에 대한 설명"> <img
					src="images/015.jpg" />
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/018.jpg" title="사진 6에 대한 설명"> <img
					src="images/018.jpg" /> <span class="media-icon"></span>
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/019.jpg" title="사진 7에 대한 설명"> <img
					src="images/019.jpg" />
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/020.jpg" title="사진 8에 대한 설명"> <img
					src="images/020.jpg" /> <span class="media-icon"></span>
				</a>
			</div>
			<div class="gallery-item">
				<a href="images/022.jpg" title="사진 9에 대한 설명"> <img
					src="images/022.jpg" />
				</a>
			</div>
		</div>
	</main>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const followButton = document
					.querySelector(".title button.primary");

			followButton.addEventListener("mouseenter", function() {
				followButton.style.cursor = "pointer";
			});

			followButton.addEventListener("click", function() {
				if (followButton.textContent === "팔로우") {
					followButton.textContent = "✓ 팔로우중";
					followButton.style.backgroundColor = "green";
				} else {
					followButton.textContent = "팔로우";
					followButton.style.backgroundColor = "";
				}
			});
		});
	</script>

	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	// Closing database resources
	try {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	} catch (SQLException e) {
	e.printStackTrace();
	}
	}
	%>
</body>
</html>
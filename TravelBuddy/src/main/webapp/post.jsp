<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model.BuddyFinding"%>
<%@ page import="com.smhrd.model.BuddyFindingDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
#comments {
	margin-top: 20px;
}

#comments h3 {
	margin-bottom: 10px;
}

.comment {
	margin-bottom: 20px;
	padding: 10px;
	background-color: #f2f2f2;
	border-radius: 8px;
}

.comment strong {
	display: block;
	margin-bottom: 5px;
}

.comment p {
	margin: 0;
}

#post p {
	text-align: left;
}

#post p strong {
	font-size: 22px;
}

#comments {
	text-align: left;
	font-size: 20px;
}

.comment-form button {
	background-color: #2D2F7A;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

.comment-form button:hover {
	background-color: #1e1f5e;
}

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap')
	;

* {
	box-sizing: border-box;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f2f2f2;
}

textarea#title {
	height: 40px;
}

textarea#content {
	height: 150px;
}

.container {
	margin: 0 auto;
	max-width: 800px;
	padding: 20px 15px;
	text-align: center;
}

.btn {
	background-color: #2D2F7A;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

.btn:hover {
	background-color: #1e1f5e;
}

textarea {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #dadada;
	margin-bottom: 10px;
	resize: vertical;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

@media ( max-width : 768px) {
	.container {
		padding: 20px 10px;
	}
	table {
		font-size: 14px;
	}
}

.select-box {
	width: 100%;
	height: 50px;
	box-sizing: border-box;
	margin-bottom: 5px;
	padding: 5px 0 5px 10px;
	border-radius: 4px;
	border: 1px solid #d9d6d6;
	color: #383838;
	background-color: #ffffff;
	font-family: 'Noto Sans KR', sans-serif;
}

.option {
	font-size: 14px;
}

#map {
	height: 300px;
	width: 100%;
	margin-bottom: 20px;
}

.box {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
<link rel="stylesheet" href="css/post(write).css">
</head>
<body>
	<div class="container">
		<div id="wrap" class="box">
			<h2>작성글</h2>
			<div id="post">
				<%-- BuddyFindingDAO를 사용하여 buddy_idx에 해당하는 게시물을 조회합니다. --%>
				<%
				String buddy_idx_param = request.getParameter("buddy_idx");
				if (buddy_idx_param != null) {
					int buddy_idx = Integer.parseInt(buddy_idx_param);
					BuddyFinding buddyFinding = new BuddyFindingDAO().getBuddyFindingByBuddyIdx(buddy_idx);
					if (buddyFinding != null) {
				%>
				<p>
					<strong>게시물 제목</strong>:
					<%=buddyFinding.getTitle()%>
				</p>
				<p>
					<strong>여행날짜</strong>:
					<%=buddyFinding.getTravel_dt()%>
				</p>
				<p>
					<strong>여행국가</strong>:
					<%=buddyFinding.getPlace_name()%>
				</p>
				<p>
					<strong>작성자 닉네임</strong>:
					<%=buddyFinding.getMem_id()%>
				</p>
				<p>
					<strong>내용</strong>:
					<%=buddyFinding.getContent()%>
				</p>
				<!-- Google Maps API를 사용하여 위치를 표시합니다. -->
				<div id="map" style="width: 100%; height: 400px;"></div>
				<p>
					<strong>선택한 위치</strong>:
					<%=buddyFinding.getPlace_name()%>
					(<span id="lat"><%=buddyFinding.getLat()%></span>, <span id="lng"><%=buddyFinding.getLng()%></span>)
				</p>
				<%
				} else {
				%>
				<p>해당하는 게시물이 없습니다.</p>
				<%
				}
				} else {
				%>
				<p>게시물을 선택해주세요.</p>
				<%
				}
				%>
			</div>
			<div class="button">
				<!-- 게시물 목록 페이지로 이동하는 링크 -->
				<a href="board_list.jsp">게시물 목록으로 돌아가기</a>
			</div>
		</div>
	</div>

	<!-- JavaScript 코드 -->
	<script>
		// Google Maps API를 사용하여 지도를 초기화합니다.
		function initMap() {
			var lat = parseFloat(document.getElementById('lat').textContent);
			var lng = parseFloat(document.getElementById('lng').textContent);

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : {
					lat : lat,
					lng : lng
				}
			});

			var marker = new google.maps.Marker({
				position : {
					lat : lat,
					lng : lng
				},
				map : map
			});
		}
	</script>
	<!-- Google Maps API 스크립트 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap"></script>
</body>
</html>

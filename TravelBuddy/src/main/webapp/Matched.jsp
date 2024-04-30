
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
:root {
    --accent-color: #BAD7E9;
    --text-color: #2D2F7A;
    --background-color: #5e63f5;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0px;
	background-color: #eee;
	text-align: center;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: white;
    padding: 8px 12px;
    margin-top: 0px;
    margin-bottom: 25px;
}

.nav_logo i {
    color: var(--accent-color);
}

.nav_logo span {
    color: var(--accent-color);
}

.nav_menu {
    display: flex;
    justify-content: space-between;
    list-style: none;
    padding-right: 100px; 
    margin: 0px;
    margin-right: 50px;
}

.nav_menu li {
    margin: 0px;
}

.nav_menu li a {
    font-size: 22px;
    padding:  50px; 
    color: #2D2F7A; /* 텍스트 색상 변경 */
    text-decoration: none; /* 링크 텍스트에 있는 밑줄 제거 */
}
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
    margin-left: 185px;
    display: block;
}

.user-box {
	display: inline-block;
	margin: 20px;
	border: 2px solid #2D2F7A;
	background-color: white;
	padding: 10px;
	text-align: center;
	cursor: pointer;
}

.user-box img {
	max-width: 70%;
	height: auto;
}

.user-row {
	margin-bottom: 20px;
}

#countdown {
	font-size: 24px;
	margin-top: 20px;
	color: #2D2F7A;
}

header {
	margin-top: 20px;
}

.matching-process {
	margin-top: 75px;
}

@media (max-width: 750px) {
    .nav_menu {
        display: none;
    }
    
    .nav_icons {
        display: none;
    }
    
    .navbar_toggleBtn {
        display: block;
    }
</style>
</head>
<body>
	<nav class="navbar">
		<img src="images/bg23412.jpg" alt="Background Image">
		<ul class="nav_menu" id="menu">
			<li><a href="Main.jsp"><b>메인화면</b></a></li>
			<li><a href="test.jsp"><b>버디매칭</b></a></li>
			<li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
			<li><a href="Community.jsp"><b>커뮤니티</b></a></li>

			<%
			if (session.getAttribute("loginMember") != null) {
			%>
			<li><a
				href="MyProfile.jsp?mem_id=<%=session.getAttribute("mem_id")%>"><b>프로필</b></a></li>
			<li><a href="LogoutService"><b>로그아웃</b></a></li>
			<li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
			<%
			} else {
			%>
			<li><a href="Login.jsp"><b>로그인</b></a></li>
			<%
			}
			%>
		</ul>
	</nav>

	<header>
		<h1 id="matchingTitle">매칭 중...</h1>
		<div id="countdown"></div>
	</header>

	<section class="matching-process">
		<div id="userContainer"></div>
	</section>

	<script>
		setTimeout(function() {
			document.getElementById('matchingTitle').style.display = 'none';
			showUsers();
		}, 3000);

		function showUsers() {
			var matches = [ {
				name : "활기찬인사햄찌",
				age : 28,
				gender : "여",
				travelPreference : "해변 휴양지",
				image : "images/081.jpg"
			}, {
				name : "사랑이궁금한냥이",
				age : 25,
				gender : "여",
				travelPreference : "도시 탐방",
				image : "images/0111.jpg"
			}, {
				name : "윙크뿅댕댕이",
				age : 30,
				gender : "남",
				travelPreference : "자연 속 여행",
				image : "images/0121.jpg"
			}, {
				name : "좋아죽는고영희",
				age : 26,
				gender : "여",
				travelPreference : "산악 여행",
				image : "images/0191.jpg"
			}, {
				name : "핥기전문가햄쥐",
				age : 33,
				gender : "남",
				travelPreference : "역사 탐방",
				image : "images/0201.jpg"
			}, {
				name : "파릇파릇한아깽이",
				age : 29,
				gender : "남",
				travelPreference : "테마파크",
				image : "images/551.jpg"
			} ];

			var container = document.getElementById('userContainer');
			var row;

			matches.forEach(function(user, index) {
				if (index % 3 === 0) {
					row = document.createElement('div');
					row.className = 'user-row';
					container.appendChild(row);
				}

				var userBox = document.createElement('div');
				userBox.className = 'user-box';

				var imageElement = document.createElement('img');
				imageElement.src = user.image;
				imageElement.alt = user.name + "의 사진";

				var nameElement = document.createElement('p');
				nameElement.textContent = '이름: ' + user.name;

				var ageElement = document.createElement('p');
				ageElement.textContent = '나이: ' + user.age;

				var genderElement = document.createElement('p');
				genderElement.textContent = '성별: ' + user.gender;

				var travelElement = document.createElement('p');
				travelElement.textContent = '여행 선호도: ' + user.travelPreference;

				userBox.appendChild(imageElement);
				userBox.appendChild(nameElement);
				userBox.appendChild(ageElement);
				userBox.appendChild(genderElement);
				userBox.appendChild(travelElement);

				row.appendChild(userBox);
			});
		}
	</script>

</body>
</html>

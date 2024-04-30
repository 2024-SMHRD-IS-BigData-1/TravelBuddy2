<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TravelBuddy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: white;
            text-align: center;
        }

        .navbar {
            display: flex;
            justify-content: center; /* 메뉴바를 가운데 정렬 */
            align-items: center;
            background-color: white;
            padding: 12px;
            margin-top: -25px;
            text-align: center; /* 가운데 정렬을 위해 추가 */
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

        .image-container {
            margin-top: 150px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
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
            <li><a href="MyProfile.jsp"><b>프로필</b></a></li>
            <li><a href="Login.jsp"><b>로그인</b></a></li>
            <li><a href="LogoutService"><b>로그아웃</b></a></li>
            <li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
        </ul>
    </nav>
    <div class="image-container">
        <img src="images/main.jpg" alt="gif">
    </div>

    <script>
        // 페이지 로드될 때 실행되는 함수
        window.onload = function() {
            // 사용자의 로그인 상태를 확인하여 메뉴를 동적으로 변경
            var loginMember = <%= session.getAttribute("loginMember") %>;
            var menu = document.getElementById("menu");
            if (loginMember != null) {
                // 로그인된 상태일 때
                menu.innerHTML = `
                    <li><a href="Main.jsp"><b>메인화면</b></a></li>
                    <li><a href="test.jsp"><b>버디매칭</b></a></li>
                    <li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
                    <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
                    <li><a href="MyProfile.jsp"><b>프로필</b></a></li>
                    <li><a href="LogoutService"><b>로그아웃</b></a></li>
                    <li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
                `;
            } else {
                // 로그인되지 않은 상태일 때
                menu.innerHTML = `
                    <li><a href="Main.jsp"><b>메인화면</b></a></li>
                    <li><a href="test.jsp"><b>버디매칭</b></a></li>
                    <li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
                    <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
                    <li><a href="Login.jsp"><b>로그인</b></a></li>
                `;
            }
        };
    </script>
</body>
</html>

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

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            color: #2D2F7A;
        }

        label {
            margin-top: 1rem;
        }

        input {
            padding: 10px;
            box-sizing: border-box;
            margin: 1.2rem 0;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
        }

        input[type="textarea"] {
            width: 100%;
            height: 10rem;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #2D2F7A;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1e1f5e;
        }

        .error {
            border: 3px solid red;
        }

        .errorText {
            padding: 1rem;
            border: 2px solid red;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 4px 12px;
            font-size: 1.2rem;
            font-family: "Lucida Sans", "Lucida Sans Regular", sans-serif;
        }

        .successText {
            padding: 1rem;
            border: 4px solid green;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 4px 12px;
            font-size: 1.2rem;
            font-family: "Lucida Sans", "Lucida Sans Regular", sans-serif;
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

        .nav_icons {
            display: flex;
            color: #7dc0ff;
            list-style: none;
            padding-left: 0;
        }

        .nav_icons li {
            padding: 8px 5px;
        }

        @media ( max-width: 768px) {
            .nav_menu {
                display: none;
            }

            .nav_icons {
                display: none;
            }

            .navbar_toggleBtn {
                display: block;
            }

            a.navbar:hover {
                text-decoration: none;
            }
        }
    </style>
</head>

<body>
    <%@ page import="com.smhrd.model.SurveyResultDAO"%>
    <%@ page import="com.smhrd.model.SurveyResult"%>
    <%@ page import="com.smhrd.model.Member"%>
    <%
    Member loginMember = (Member) session.getAttribute("loginMember");
    if (loginMember != null) {
        String mem_id = loginMember.getMem_id();
        SurveyResultDAO surveyResultDAO = new SurveyResultDAO();
        SurveyResult existingSurveyResult = surveyResultDAO.getSurveyResultByMemId(mem_id);
        if (existingSurveyResult != null) {
            // 이미 설문을 완료한 경우
            response.sendRedirect("test(fail).jsp"); // 이미 설문을 완료한 경우의 페이지 경로에 맞게 수정
            return; // 더 이상 페이지를 진행하지 않고 종료
        }
    }
    %>
    <nav class="navbar">
        <img src="images/bg23412.jpg" alt="Background Image">
        <ul class="nav_menu">
            <li><a href="Main.jsp"><b>메인화면</b></a></li>
            <li><a href="Matching.jsp"><b>버디매칭</b></a></li>
            <li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
            <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
            <%
			if (session.getAttribute("loginMember") != null) {
		%>
			<li><a href="MyProfile.jsp?mem_id=<%= session.getAttribute("mem_id")%>"><b>프로필</b></a></li>
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
    <div class="container">
        <h1>여행 선호도 성향</h1>
        <form action="SurveyService" method="post">
            <input type="hidden" value="board_write" name="command">
            <input type="hidden" name="mem_id" value="<%=loginMember.getMem_id()%>">
            <label for="personality">1. 여행을 떠날 때 당신의 성향은?</label><br>
            <input type="radio" name="personality" value="1"> 계획형
            <input type="radio" name="personality" value="2"> 즉흥형
            <input type="radio" name="personality" value="3"> 취향따라<br><br>
            <label for="travel_style">2. 당신의 여행 스타일은?</label><br>
            <input type="radio" name="travel_style" value="1"> 느긋한 힐링
            <input type="radio" name="travel_style" value="2"> 바쁜 알찬 여행
            <input type="radio" name="travel_style" value="3"> 배낭여행러<br><br>
            <label>3. 여행지에서 즐기고 싶은 것은?</label><br>
            <input type="checkbox" name="preferred_activity" value="1"> 호캉스
            <input type="checkbox" name="preferred_activity" value="2"> 관광지 가기
            <input type="checkbox" name="preferred_activity" value="3"> 맛집 탐방
            <input type="checkbox" name="preferred_activity" value="4"> 액티비티 체험
            <input type="checkbox" name="preferred_activity" value="5"> 쇼핑하기<br><br>
            <label for="photo_preference">4. 여행지에서 사진은?</label><br>
            <input type="radio" name="photo_preference" value="1"> 필수!
            <input type="radio" name="photo_preference" value="2"> 기록용<br><br>
            <label for="transportation_preference">5. 선호하는 이동수단은?</label><br>
            <input type="radio" name="transportation_preference" value="1"> 대중교통
            <input type="radio" name="transportation_preference" value="2"> 택시<br><br>
            <label for="walking_preference">6. 걷는 걸 좋아하는 편?</label><br>
            <input type="radio" name="walking_preference" value="1"> 완전 뚜벅이
            <input type="radio" name="walking_preference" value="2"> 적당히 걷는것을 선호
            <input type="radio" name="walking_preference" value="3"> 다리아픈건 별로<br><br>
            <label for="spending_habit">7. 여행 할 때 소비패턴은?</label><br>
            <input type="radio" name="spending_habit" value="1"> 아까워하지 않는 편
            <input type="radio" name="spending_habit" value="2"> 기분따라 취향따라
            <input type="radio" name="spending_habit" value="3"> 가성비를 추구하는 편<br><br>
            <label for="alcohol_preference">8. 술에 대한 선호도는?</label><br>
            <input type="radio" name="alcohol_preference" value="1"> 드링크러버♥
            <input type="radio" name="alcohol_preference" value="2"> 분위기만 즐기는 타입
            <input type="radio" name="alcohol_preference" value="3"> 불호<br><br>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>

</html>

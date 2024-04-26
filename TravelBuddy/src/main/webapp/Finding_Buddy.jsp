<%@page import="com.smhrd.model.BuddyFinding"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BuddyFindingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/findbuddy.css">
<style>
body {
    margin-top: 20px;
    background-color: #eee;
}

.text-center {
    text-align: center;
}

.text-right {
    text-align: right;
}

.job-box {
    background: #ffffff;
    display: inline-block;
    width: 50%;
    padding: 0 0px 40px 0px;
    border: 1px solid #e8eef1;
    margin-left: 25%;
}

.job-box-filter a.filtsec {
    margin-top: 8px;
    display: inline-block;
    margin-right: 15px;
    padding: 4px 10px;
    font-family: 'Quicksand', sans-serif;
    transition: all ease 0.4s;
    background: #edf0f3;
    border-radius: 50px;
    font-size: 15px;
    color: #81a0b1;
    border: 1px solid #e2e8ef;
}

.job-box-filter a.filtsec.active {
    color: #ffffff;
    background: #16262c;
    border-color: #16262c;
}

.job-box-filter a.filtsec i {
    color: #03A9F4;
    margin-right: 5px;
}

.job-box-filter a.filtsec:hover, .job-box-filter a.filtsec:focus {
    color: #ffffff;
    background: #07b107;
    border-color: #07b107;
}

.job-box-filter a.filtsec:hover i, .job-box-filter a.filtsec:focus i {
    color: #ffffff;
}

.job-box-filter h4 i {
    margin-right: 10px;
}

.inbox-message ul {
    padding: 0;
    margin: 0;
}

.inbox-message ul li {
    list-style: none;
    position: relative;
    padding: 15px 20px;
    border-bottom: 1px solid #e8eef1;
}

.inbox-message ul li:hover, .inbox-message ul li:focus {
    background: #eff6f9;
}

.inbox-message .message-avatar {
    position: absolute;
    left: 30px;
    top: 50%;
    transform: translateY(-50%);
}

.message-avatar img {
    display: inline-block;
    width: 80px;
    height: 80px;
    border-radius: 50%;
}

.inbox-message .message-body {
    margin-left: 125px;
    font-size: 17px;
    color: #4c2d94;
}

.message-body-heading {
    text-align: center; /* Centering the heading */
}

.message-body-heading h5 {
    font-weight: 600;
    display: inline-block;
    color: #2D2F7A;
    margin: 0 0 7px 0;
    padding: 0;
}

.message-body h5 span {
    border-radius: 50px;
    line-height: 14px;
    font-size: 12px;
    color: #3523A9;
    font-style: normal;
    padding: 4px 10px;
    margin-right: 15px;
    margin-top: 0px;
}

.message-body h5 span.unread {
    background: #07b107;
}

.message-body h5 span.important {
    background: #dd2027;
}

.message-body h5 span.pending {
    background: #2196f3;
}

.message-body-heading span {
    float: right;
    color: #62748F;
    font-size: 15px;
}

.messages-inbox .message-body p {
    margin: 0;
    padding: 0;
    line-height: 27px;
    font-size: 15px;
}

a:hover {
    text-decoration: none;
}

.w3-bar {
    display: flex;
    justify-content: center;
}

.w3-bar-item {
    padding: 8px 16px;
    text-decoration: none;
    color: black;
}

.w3-button {
    background-color: white;
    border: 1px solid #2D2F7A;
    margin: 0 4px;
    cursor: pointer;
}

.w3-black {
    background-color: #2D2F7A;
    color: white;
}

.w3-hover-black:hover {
    background-color: #2D2F7A;
    color: white;
}

:root {
    --accent-color: #BAD7E9;
    --text-color: #2D2F7A;
    --background-color: #5e63f5;
}

body {
    margin: 0;
    font-family: 'Montserrat', sans-serif;
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
    padding: 8px 50px;
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
    justify-content:space-between ;
    padding-right: 0px;
    margin: 0px;
}

.nav_menu li {
    margin: 0px;
}

.nav_menu li a {
    font-size: 25px;
    display: inline-block;
    padding: 0 40px;
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
</style>
</head>
<body>
    <%
    List<BuddyFinding> boardList = new BuddyFindingDAO().showBoard();
    pageContext.setAttribute("boardList", boardList);
    %>
    <nav class="navbar">
         <a href="Main.jsp"><img src="images/bg23412.jpg" alt="Background Image"></a>
      <ul class="nav_menu">
          <li><a href="Main.jsp"><b>메인화면</b></a></li>
          <li><a href="test.jsp"><b>버디매칭</b></a></li>
          <li><a href="Finding_Buddy.jsp"><b>버디찾기</b></a></li>
          <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
          <li><a href="Profile.jsp"><b>프로필</b></a></li>
          <li><a href="LogoutService"><b>로그아웃</b></a></li>
          <li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
      </ul>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="chat_container">
                    <div class="row">
                        <div class="col-md-6 col-sm-6"></div>
                    </div>
                </div>
                <div class="inbox-message">
                    <ul>
                        <%
                        for (BuddyFinding board : boardList) {
                        %>
                        <li>
                            <a href="post.jsp?buddy_idx=<%=board.getBuddy_idx()%>">
                                <div class="message-avatar">
                                    <!-- 이미지 삽입 -->
                                </div>
                                <div class="message-body-heading">
                                    <h5><%=board.getTitle()%></h5>
                                    <!-- 게시글 제목 -->
                                    <p>
                                        작성자:
                                        <%=board.getMem_id()%></p>
                                    <!-- 작성자 -->
                                    <p>
                                        여행 출발일:
                                        <%=board.getTravel_dt()%></p>
                                    <!-- 여행 출발일 -->
                                </div>
                            </a>
                        </li>
                        <%
                        }
                        %>
                    </ul>
                </div>
                
                <div class="text-center">
                    <a href="post(write).jsp" class="btn btn-primary" style="background-color: gray;">게시글 작성</a>
                </div>
                
                <br> <br>
                <div class="w3-center w3-padding-32">
                    <div class="w3-bar"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

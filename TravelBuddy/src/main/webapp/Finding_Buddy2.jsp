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
    <style>
        body {
            margin-top: 20px;
            background-color: #eee;
            margin: 0;
            font-family: 'Montserrat', sans-serif;
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
            align-items: center;
            background-color: white;
            padding: 12px;
            margin-top: 0px;
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
            padding-right: 0; /* Adjusted padding */
            margin: 10px;
            margin-top: 0px;
        }

        .nav_menu li {
            margin: 22px;
            color: #2D2F7A;
        }

        .nav_menu li a {
            font-size: 22px; 
            display: inline-block; 
            padding: 0 25px; /* Adjusted padding */
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
        
        @media (max-width: 768px) {
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
        
        .col-md-8 {
            margin-top: 20px;
        }

        .text-right {
            text-align: right;
        }

        .job-box {
            background: #ffffff;
            display: inline-block;
            max-width: 500px; 
            width: 400px;
            height: 100px;
            padding: 0 100px 40px 500px; /* 조정된 padding */
            border: 1px solid #e8eef1;
            margin-left: 25%; /* 수정된 margin */
        }

        .job-box-filter {
            text-align: center;
        }

        .job-box-filter a.filtsec {
            margin-top: 8px;
            display: inline-block;
            margin-right: 0px;
            padding: 8px px;
            font-family: 'Quicksand', sans-serif;
            background: #edf0f3;
            border-radius: 0px;
            font-size: 15px;
            color: #81a0b1;
            border: 1px solid #e2e8ef;
        }

        .job-box-filter a.filtsec.active {
            color: #ffffff;
            background: #16262c;
            border-color: #16262c;
        }

        .job-box-filter a.filtsec:hover,
        .job-box-filter a.filtsec:focus {
            color: #ffffff;
            background: #07b107;
            border-color: #07b107;
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
            margin-left: -475px;
        }

        .inbox-message ul li:hover,
        .inbox-message ul li:focus {
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

        a.navbar:hover {
            text-decoration: none;
        }

        .w3-bar {
            display: flex;
            justify-content: center;
            margin-left: -450px;
            margin-top: -20px;
        }

        .w3-bar-item {
            padding: 8px 16px;
            text-decoration: none;
            color: #2D2F7A;
        }

        .container {
            justify-content: center;
        }

        .w3-button {
            background-color: white;
            border: 1px solid #2D2F7A;
            margin: 0 6px;
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
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
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
            <li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
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
                        <div class="col-md-6 col-sm-6">
                        </div>
                    </div>
                </div>
                <div class="inbox-message">
                    <ul>
                    <%
                     for (BuddyFinding board : boardList) {
                    %>
                    </ul>
                </div>
                <br><br>
                <div class="w3-center w3-padding-32">
                    <div class="w3-bar">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="chat_container">
                    <div class="job-box">
                        <div class="job-box-filter">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                </div>
                            </div>
                        </div>
                        <div class="inbox-message">
                        <ul>
                            <li>
                               <a href="post.jsp?buddy_idx=<%=board.getBuddy_idx()%>">
                                    <div class="message-avatar">
                                        <img src="images/11.jpg" alt="">
                                    </div>
                                    <div class="message-body">
                                        <div class="message-body-heading">
                                            <h5><%=board.getTitle()%></h5>
                                            <p>
                                        작성자:
                                        <%=board.getMem_id()%></p>
                                    <!-- 작성자 -->
                                    <p>
                                        여행 출발일:
                                        <%=board.getTravel_dt()%></p>
                                    <!-- 여행 출발일 -->
                                        </div> 
                                    </div>
                                </a>
                            </li>
                            <%
                             }
                             %>
                    </div>
                    <div class="text-center">
                    <a href="post(write).jsp" class="btn btn-primary" style="background-color: gray;">게시글 작성</a>
                     </div>
                    <br><br>
                    <div class="w3-center w3-padding-32">
                        <div class="w3-bar">
                            <a href="#page1" class="w3-bar-item w3-button w3-hover-black">«</a>
                            <a href="#page1" class="w3-bar-item w3-black w3-button">1</a>
                            <a href="#page2" class="w3-bar-item w3-button w3-hover-black">2</a>
                            <a href="#page3" class="w3-bar-item w3-button w3-hover-black">3</a>
                            <a href="#page4" class="w3-bar-item w3-button w3-hover-black">4</a>
                            <a href="#page4" class="w3-bar-item w3-button w3-hover-black">»</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

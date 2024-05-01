<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Community"%>
<%@page import="com.smhrd.model.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<style>
:root {
    --accent-color: #BAD7E9;
    --text-color: #2D2F7A;
    --background-color: #5e63f5;
}

body {
    margin: 0;
    font-family: 'Montserrat', sans-serif;
    padding: 0 0px;
    background-color: #f5f6f7;
}

textarea[id="title"] {
    height: 25px; 
}

textarea[id="name"] {
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

.w3-main {
    margin-right:500px; 
}

.w3-quarter {
    margin-bottom: 10px; 
    margin-right: 25px; 
    margin-left: 50px;
}

.w3-padding-16 {
    margin-top: 0px;
}

.write-button {
    position: absolute;
    top: 145px; /* 원하는 위치로 조정 */
    right: 400px; /* 원하는 위치로 조정 */
    color: #2D2F7A;
    background-color: transparent;
    background-color: white;
    border: 1px solid #2D2F7A; 
    cursor: pointer;
    text-align: center;
    padding: 12px 22px; 
}
.image-container {
    border: 1px solid #ccc;
    background-color: white;
    border-radius: 0px;
    padding: 10px;
    flex-direction: column; 
    position: relative; 
    left: 250px;
    width: 300px; 
    text-align: center;
    margin: 12px;
}

.image-container img {
    width: 100%; 
}

.hidden {
    display: none;
}



.category-tabs {
    padding: 10px; 
    display: inline-block; 
    border-radius: 0px; 
    text-align: center; 
    margin-left: 400px; 
    margin-bottom: 10px;
}

.category-tab {
    color: #2D2F7A;
    background-color: transparent;
    background-color: white;
    border: 1px solid #2D2F7A; 
    cursor: pointer;
    text-align: center;
    padding: 8px 22px; 
    margin-right: 5px; 
}

.btn-primary {
    color: #2D2F7A;
    background-color: transparent;
    background-color: white;
    border: 1px solid #2D2F7A; 
    cursor: pointer;
    text-align: center;
    padding: 8px 22px; 
    margin-right: 5px; 
}

.category-tab:hover {
    background-color: #2D2F7A; 
    color: white;
}


    .w3-bar {
        display: flex;
        margin-top: 20px; /* 필요에 따라 조정하세요 */
        margin-bottom: 20px; /* 필요에 따라 조정하세요 */
        margin-left: 825px;
    }

    .w3-bar-item {
        padding: 8px 16px;
        text-decoration: none;
        color: #2D2F7A;
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
.w3-row-padding {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.w3-row-padding .w3-quarter {
    width: calc(30% - 100px); 
    margin-bottom: 20px;
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
    .post-container {
        max-width: 2400px; 
        margin-top: 150px; 
    }
    .w3-padding-16 {
        margin-top: 150px;
    }
    .w3-center {
    text-align: center;
    }

    .w3-padding-32 {
    padding: 32px;
    }
 }
</style>
</head>
<body>
<%@ page import="com.smhrd.model.Member"%>

			<%
			Member loginMember = (Member) session.getAttribute("loginMember");
			String mem_id = "";
			if (loginMember != null) {
				mem_id = loginMember.getMem_id();
			}
			List<Community> CommunityList = new CommunityDAO().showCommunity();
			pageContext.setAttribute("CommunityList", CommunityList);
			%>
			<input type="hidden" value="board_write" name="command"> <input
				type="hidden" name="mem_id" value="<%=mem_id%>">
<!-- 네비게이션 부분 -->
<nav class="navbar">
    <img src="images/bg23412.jpg" alt="네비게이션 로고">
    <ul class="nav_menu">
        <li><a href="Main.jsp"><b>메인화면</b></a></li>
        <li><a href="test.jsp"><b>버디매칭</b></a></li>
        <li><a href="Finding_Buddy2.jsp"><b>버디찾기</b></a></li>
        <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
        <li><a href="MyProfile.jsp?mem_id=<%= mem_id%>"><b>프로필</b></a></li>
        <li><a href="LogoutService"><b>로그아웃</b></a></li>
        <li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
    </ul>
</nav>
<!-- 커뮤니티 카테고리 탭 -->
<div class="category-tabs" id="community">
    <button class="category-tab" data-category="all">전체</button>
    <button class="category-tab" data-category="여행정보">여행정보</button>
    <button class="category-tab" data-category="여행후기">여행후기</button>
</div>
<!-- 커뮤니티 게시글 영역 -->
<div class="w3-main w3-content w3-padding post-container">
    <div class="w3-row-padding w3-padding-16 w3-center">
         <ul>
         <%
          for (Community community : CommunityList) {
         %>
         </ul>
         	<a href="community(read).jsp?b_idx=<%=community.getB_idx()%>">
            <div class=<%=community.getB_category() %>>
                <div class="image-container">
                    <img src="./img/<%=loginMember.getMem_id() %>/<%=community.getFilename() %>" style="width:100%">
                    <h3><%=community.getTitle() %></h3>
                    <p><%=community.getB_category() %></p>
                </div>
            </div>
            </a>
            <%
             }
            %>
    </div>
    <!-- 게시글 작성 버튼 -->
    <div class="write-buttons">
        <a href="community(write).jsp" class="write-button">게시글 작성</a>
    </div>
    <br>
    <!-- 페이지 네비게이션 -->
    <div class="w3-bar">
        <a href="#page1" class="w3-bar-item w3-button w3-hover-black">«</a>
        <a href="#page1" class="w3-bar-item w3-black w3-button">1</a>
        <a href="#page2" class="w3-bar-item w3-button w3-hover-black">2</a>
        <a href="#page3" class="w3-bar-item w3-button w3-hover-black">3</a>
        <a href="#page4" class="w3-bar-item w3-button w3-hover-black">4</a>
        <a href="#page4" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
</div>
    <script>
function filterImages(event) {
    var category = event.target.dataset.category;
    var imagesContainer = document.querySelector(".w3-row-padding");
    var firstRowImages = imagesContainer.querySelectorAll('.w3-quarter');

    document.querySelectorAll('.image-container').forEach(function(image) {
        image.style.display = "none";
    });

    document.querySelectorAll('.image-container').forEach(function(image) {
        if (category === "all" || image.parentElement.classList.contains(category)) {
            image.style.display = "flex";
        }
    });
    var count = 0;
    document.querySelectorAll('.image-container').forEach(function(image) {
        if ((category === "all" || image.parentElement.classList.contains(category)) && count < 3) {
            imagesContainer.insertBefore(image.parentElement, imagesContainer.childNodes[count]);
            count++;
        }
    });
}

document.querySelectorAll('.category-tab').forEach(item => {
    item.addEventListener('click', filterImages);
});

window.onload = function() {
    filterImages({ target: document.querySelector('[data-category="all"]') });
};

    </script>
</body>
</html>
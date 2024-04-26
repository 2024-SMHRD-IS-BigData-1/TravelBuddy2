<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W3.CSS Template</title>
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
    padding-right: 0px; 
    margin: 0px;
}

.nav_menu li {
    margin: 0px;
}

.nav_menu li a {
    font-size: 25px;
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
    margin-left: 200px;
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

.category-tab:hover {
    background-color: #2D2F7A; 
    color: white;
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

.w3-bar {
    margin-left: 750px;
    margin-bottom: 25px;
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
    .w3-row-padding .w3-quarter {
        width: 150%; 
    }
}
</style>
</head>
<body>
    <nav class="navbar">
                              <img src="images/bg23412.jpg" alt="Background Image">
        <ul class="nav_menu">
            <li><a href="Main.jsp"><b>메인화면</b></a></li>
            <li><a href="Matching.jsp"><b>버디매칭</b></a></li>
            <li><a href="Finding_Buddy.jsp"><b>버디찾기</b></a></li>
            <li><a href="Community.jsp"><b>커뮤니티</b></a></li>
            <li><a href="Profile.jsp"><b>프로필</b></a></li>
            <li><a href="LogoutService"><b>로그아웃</b></a></li>
            <li><a href="MemberUpdate.jsp"><b>회원정보수정</b></a></li>
        </ul>
    </nav>
    <div class="category-tabs">
        <button class="category-tab" data-category="all">전체</button>
        <button class="category-tab" data-category="여행정보">여행정보</button>
        <button class="category-tab" data-category="여행후기">여행후기</button>
    </div>
    <div class="w3-main w3-content w3-padding post-container">
        <div class="w3-row-padding w3-padding-16 w3-center">
            <div class="w3-quarter 여행정보">
                <div class="image-container">
                    <img src="images/3.jpg" alt="여행정보" style="width:100%">
                    <h3>쫄아든햄찌</h3>
                    <p>여행정보 : ~ </p>
                </div>
            </div>
            <div class="w3-quarter 여행후기">
                <div class="image-container">
                    <img src="images/5.jpg" alt="여행후기" style="width:100%">
                    <h3>귀챠니즘야옹이</h3>
                    <p>여행후기 : ~</p>
                </div>
            </div>
            <div class="w3-quarter 여행정보">
                <div class="image-container">
                    <img src="images/6.jpg" alt="여행정보" style="width:100%">
                    <h3>엄근진야옹이</h3>
                    <p>여행정보 : ~</p>
                </div>
            </div>
            <div class="w3-quarter 여행후기">
                <div class="image-container">
                    <img src="images/7.jpg" alt="여행후기" style="width:100%">
                    <h3>인생이고달픈야옹이</h3>
                    <p>여행후기 : ~</p>
                </div>
            </div>
            <div class="w3-quarter 여행정보">
                <div class="image-container">
                    <img src="images/8.jpg" alt="여행정보" style="width:100%">
                    <h3>현피각재는야옹이</h3>
                    <p>여행정보 : ~</p>
                </div>
            </div>
            <div class="w3-quarter 여행후기">
                <div class="image-container">
                    <img src="images/9.jpg" alt="여행후기" style="width:100%">
                    <h3>붕버빵바라기야옹이</h3>
                    <p>여행후기 : ~</p>
                </div>
            </div>
        </div>
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
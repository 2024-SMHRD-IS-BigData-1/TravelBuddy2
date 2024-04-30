<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0px; 
            background-color: #eee; 
            text-align: center;
        } 
        .navbar {
            position: relative;
            display: flex;
            align-items: center;
            background-color: white;
            padding: 12px;
            margin-bottom: 20px; 
            z-index: 1; 
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
    </style>
</head>
<body>
    <nav class="navbar">
        <img src="images/bg23412.jpg" alt="Background Image">
        <ul class="nav_menu">
            <li><a href="#"><b>메인화면</b></a></li>
            <li><a href="#"><b>버디매칭</b></a></li>
            <li><a href="#"><b>버디찾기</b></a></li>
            <li><a href="#"><b>커뮤니티</b></a></li>
            <li><a href="#"><b>프로필</b></a></li>
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
        },3000 );

        function showUsers() {
            var matches = [
                { name: "활기찬인사햄찌", age: 28, gender: "여", travelPreference: "해변 휴양지", image: "images/08.jpg" },
                { name: "사랑이궁금한냥이", age: 25, gender: "여", travelPreference: "도시 탐방", image: "images/011.jpg" },
                { name: "윙크뿅댕댕이", age: 30, gender: "남", travelPreference: "자연 속 여행", image: "images/020.jpg" },
                { name: "좋아죽는고영희", age: 26, gender: "여", travelPreference: "산악 여행", image: "images/012.jpg" },
                { name: "핥기전문가햄쥐", age: 33, gender: "남", travelPreference: "역사 탐방", image: "images/019.jpg" },
                { name: "파릇파릇한아깽이", age: 29, gender: "남", travelPreference: "테마파크", image: "images/55.jpg" }
            ];

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
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>게시물 보기</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap">
    <link rel="stylesheet" href="css/post(write).css">
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


@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

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

@media (max-width: 768px) {
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
</head>
<body>
    <div class="container">
        <div id="wrap" class="box">
            <h2>작성글</h2>
            <div id="post">
                <p><strong>게시물 제목</strong></p>
                <p>여행날짜: 2024-04-23</p>
                <p>여행국가: 대한민국</p>
                <p>작성자 닉네임: 사용자123</p>
                <p>내용: 이곳에 게시물 내용이 들어갑니다.</p>
                <div id="map" style="width: 100%; height: 400px;"></div>
                <p>선택한 위치: 서울특별시 강남구 테헤란로 521</p>
            </div>
            <div id="comments">
                <br>
                <p><strong>댓글</strong></p>
                <div class="comment-form">
                    <input type="text" id="nickname" placeholder="댓글 작성자 닉네임">
                    <br><br>
                    <textarea id="comment" placeholder="댓글 내용"></textarea>
                    <button class="comment-button" onclick="submitComment()">댓글 작성</button>
                </div>
                <div id="comment-list">
                </div>
            </div>
        </div>
    </div>

    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: { lat: 37.5665, lng: 126.9780 }
            });

            var marker = new google.maps.Marker({
                position: { lat: 37.5665, lng: 126.9780 },
                map: map
            });
        }

        function submitComment() {
            var nickname = document.getElementById("nickname").value;
            var comment = document.getElementById("comment").value;

            if (nickname && comment) {
                var commentSection = document.getElementById("comment-list");
                var newComment = document.createElement("div");
                newComment.classList.add("comment");
                newComment.innerHTML = "<strong>" + nickname + "</strong><p>" + comment + "</p>";
                commentSection.appendChild(newComment);
                
                document.getElementById("nickname").value = "";
                document.getElementById("comment").value = "";
            } else {
                alert("닉네임과 댓글을 모두 입력해주세요.");
            }
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap"></script>
</body>
</html>

</body>
</html>
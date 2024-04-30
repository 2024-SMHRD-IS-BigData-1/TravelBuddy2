<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap">
<link rel="stylesheet" href="css/post.css">
<style>
* {
    box-sizing: border-box;
    outline: none;
}

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f2f2f2;
}

textarea[name="content"] {
    height: 150px;
}

.box {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
    width: 100%;
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
    width: 50%;
    height: 50px;
    box-sizing: border-box;
    margin-left: auto;
    margin-right: auto;
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

.image-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

.image-preview {
    width: 100px;
    height: 100px;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    position: relative;
}

.image-preview img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

</style>
</head>
<body class="box-body">
    <div class="container">
        <div id="wrap">
            <h2>커뮤니티 작성</h2>
            <form action="CommunityService" method="post" enctype="multipart/form-data">
            <%@ page import="com.smhrd.model.Member" %>
            
            <%
	            Member loginMember = (Member) session.getAttribute("loginMember");
	            String mem_id = "";
	            if (loginMember != null) {
	                mem_id = loginMember.getMem_id(); 
	            }
            %>
                <table>
                    <tr>
                        <th>제목</th>
                        <td><textarea cols="50" rows="1" name="title"></textarea></td>
                    </tr>
                    <form name='cateG' onsubmit="return cate();">
                    <tr>
                        <th>카테고리</th>
                        <td><select name="b_category" class="select-box">
                        		<option value="">카테고리를 선택해 주세요</option>
                                <option value="여행후기">여행후기</option>
                                <option value="여행정보">여행정보</option>
                        </select></td>
                    </tr>
                    </form>
                    <tr>
                        <th>내용</th>
                        <td><textarea cols="50" rows="15" name="b_content"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="image-container">
                                <!-- 선택된 이미지 미리보기를 여기에 표시합니다. -->
                            </div>
                            <div id="selected-images"></div> <!-- 선택된 이미지 목록을 여기에 표시합니다. -->
                            <input name="filename" type="file" style="float: left;">
                        </td>
                    </tr>
                </table>
                <input class="btn" type="submit" value="등록"> 
                <input class="btn" type="reset" value="다시작성하기"> 
                <input class="btn" type="button" value="취소" onclick="javascript:history.back()">
            </form>
        </div>
    </div>
    
    

    <script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
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
                <table>
                    <tr>
                        <th>제목</th>
                        <td><textarea cols="50" rows="1" name="title"></textarea></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td><select name="category" class="select-box">
                                <option value="후기">후기</option>
                                <option value="정보공유">정보공유</option>
                        </select></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea cols="50" rows="15" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="image-container">
                                <!-- 선택된 이미지 미리보기를 여기에 표시합니다. -->
                            </div>
                            <div id="selected-images"></div> <!-- 선택된 이미지 목록을 여기에 표시합니다. -->
                            <input type="file" id="file" name="file" multiple>
                        </td>
                    </tr>
                </table>
                <input class="btn" type="submit" value="등록"> 
                <input class="btn" type="reset" value="다시작성하기"> 
                <input class="btn" type="button" value="취소" onclick="javascript:history.back()">
            </form>
        </div>
    </div>

    <script>
        function previewImages(event) {
            var fileList = event.target.files;
            var imageContainer = document.querySelector('.image-container');
            var selectedImagesContainer = document.getElementById('selected-images');
        
            for (var i = 0; i < fileList.length; i++) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    var imagePreview = document.createElement('img');
                    imagePreview.src = event.target.result;
                    imagePreview.classList.add('image-preview');
                    imageContainer.appendChild(imagePreview);
                }
                reader.readAsDataURL(fileList[i]);
            }
            for (var j = 0; j < fileList.length; j++) {
                var selectedImageName = document.createElement('p');
                selectedImageName.textContent = '선택된 이미지: ' + fileList[j].name;
                selectedImagesContainer.appendChild(selectedImageName);
            }
        }

        document.getElementById('file').addEventListener('change', previewImages);
    </script>
</body>
</html>

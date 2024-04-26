<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>프로필 사진 업로드</h2>
    <form action="upload" method="post" enctype="multipart/form-data"> <!-- 서블릿 매핑을 'upload'로 변경 -->
        <input type="file" name="file" accept="image/*">
        <input type="submit" value="업로드">
    </form>
</body>
</html> 
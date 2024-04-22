<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<h1>팔로우 하고싶은 아이디를 입력하세요.</h1>
    
 <form action="follow" method="post">
    	<input type="text" name="my_id">
    	<input type="text" name="follow_id">
    	<button type="submit">팔로우</button>
    </form>

</body>
</html>
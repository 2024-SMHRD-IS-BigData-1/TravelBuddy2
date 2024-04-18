<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="JoinService" method="post">
	      <table>
             <tr>
                <td>ID : 
                <input type="text" name="id">
                </td>
             </tr>
             <tr>
                <td>PW :
                <input type="password" name="pw">
                </td>
             </tr>
             <tr>
                <td>NAME : 
                <input type="text" name="name">
                </td>
             </tr>
             <tr>
                <td> NICK : 
                <input type="text" name="nick">
                </td>
             </tr>
             <tr><label for="birthdate">
                <td>생년월일를 선택하세요:
  				<input type="date"
         			id="date"
        		    max="2024-04-17"
        			min="1920-01-01"
        			value="currentdate">
			</tr></label>
			    </td><br>
			    <td>성별을 선택하세요:
  				<input type='radio' name='gender' value='female' />남성
 				<input type='radio' name='gender' value='male' />여성
            	</td>
         	 <tr>
                <td>휴대폰 번호 : <input type="number" name="tel"></td>
             </tr>
             <tr>
                <td>
                이메일 : 
                <input type="text" name="email">
	               <select class="box" id="domain-list">
		               <option value="naver.com">naver.com</option>
		               <option value="google.com">google.com</option>
		               <option value="hanmail.net">hanmail.net</option>
		               <option value="nate.com">nate.com</option>
		               <option value="kakao.com">kakao.com</option>
	               </select>
	             </td>
             </tr>
             <form>
                <td>
                가입날짜 :
                <input type="date" id="currentDate"/>
                </td>
             </form>
             <tr>
            	<td><input type="submit" value="JOIN"></td>
         	</tr>
     	 </table>
	</form>











</body>
</html>
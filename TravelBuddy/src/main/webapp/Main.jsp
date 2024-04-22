<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h5>로그인</h5>

<<<<<<< HEAD
=======
<input type="text" name="id" placeholder="Id을 입력하세요"><br>
<input type="password" name="pw" placeholder="PW를 입력하세요"><br>
<input type="submit" name="Login" value="LogIn" class="button fit">
</form>

>>>>>>> branch 'master' of https://github.com/2024-SMHRD-IS-BigData-1/TravelBuddy2
	
<h5>회원가입</h5>

<input type="text" name="id" placeholder="ID를 입력하세요"><br>
									
<input type = "button" value="ID 중복체크" onclick = "checkE()">
<span id = "checkE"></span><br>
									
<input type="password" name="pw"  placeholder="PW를 입력하세요"><br>
<input type="text" name="name" placeholder="이름을 입력하세요"><br>
<input type="text" name="nick" placeholder="닉네임을 입력하세요"><br>
<tr><label for="birthdate">
   <td>생년월일를 선택하세요:
   <input type="date"
       name="date"
       max="2024-04-17"
       min="1920-01-01"
       value="currentdate">
    </label>
  </td></tr><br>
     <tr>
        							    
   <td>
   <label>성별을 선택하세요:</label>
     <input type='radio' name='gender' value='female' id="female">
    <label for="female">남성</label>
    <input type='radio' name='gender' value='male' id="male">
     <label for="male">여성</label>
   	</td><br>
										
    
      <tr>
     <td>휴대폰 번호 : <input type="number" name="phone"></td>
      </tr><br>
     
       <td>
    이메일 :
    <input type="text" name="email">
       							
    </td>
</tr>
  
            							
	<input type="submit"  value="JoinUs" class="button fit">
	</form><br>
	
	
<input type="text" name="nick" placeholder="nickname를 입력하세요"><br>
 
<div class="chat-container">
    <div class="chat-messages" id="chat-messages">
        <!-- 채팅 메시지가 여기에 나타납니다. -->
    </div>
    <input type="text" class="chat-input" id="chat-input" placeholder="메시지 입력...">
    <button onclick="sendMessage()">전송</button>
</div>

<script>
    function sendMessage() {
        var messageInput = document.getElementById("chat-input");
        var message = messageInput.value;
        if (message.trim() !== "") {
            var chatMessages = document.getElementById("chat-messages");
            var messageElement = document.createElement("div");
            messageElement.textContent = message;
            chatMessages.appendChild(messageElement);
            messageInput.value = "";
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
    }
</script>
<body>
    <h2>프로필 폼</h2>
    <form action="submit_profile.php" method="post" enctype="multipart/form-data">
        <label for="member_id">회원 아이디:</label><br>
        <input type="text" id="member_id" name="member_id"><br><br>
        
        <label for="introduction">자기 소개:</label><br>
        <textarea id="introduction" name="introduction" rows="4" cols="50"></textarea><br><br>
        
        <label for="profile_picture">프로필 사진:</label><br>
        <input type="file" id="profile_picture" name="profile_picture"><br><br>
         
       
    </form>
    </body>
  
    
   




</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

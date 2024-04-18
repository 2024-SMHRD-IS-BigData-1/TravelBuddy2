<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<body>
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
</body>

</html>
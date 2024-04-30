<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBuddy 회원가입</title>
    <link rel="icon" href="./images/images2/favicon.png">
    <link rel="stylesheet" href="css/signin.css">
        <style>
        .container-box {
            display: inline-block;
            padding: 10px;
            margin-left: 675px;
            border: 2px solid #1e1f5e;
            border-radius: 1px;
            background-color: white;
        }
        .member {
            width: 100%;
        }
        .additional-info {
            width: 100%;
        }
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

* {
    box-sizing: border-box;
    outline: none;
}


.id-input input[type="button"]:hover,
.verify-button:hover,
.signup-button:hover {
    background-color: #1e1f5e;
    cursor: pointer;
}


.id-input {
    display: flex;
    align-items: center;
}

.id-input input[type="text"] {
    flex: 2;
    margin-right: 5px;
}

.id-input input[type="button"] {
    flex: 1;
    width: 48px;
    height: 48px;
}


body {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    background-color: #f5f6f7;
    line-height: 1.5em;
    color: #222;
    margin: 0;
}


.heading-section {
    text-align: center;
    margin-bottom: 15px;
}


.member {
    width: 100%;
    margin: auto;
    padding: 0 20px;
    margin-bottom: 20px;
}


.member .field {
    margin: 5px 0;
}


.member b {
    display: block;
    margin-bottom: 5px;
}


.member input:not(input[type=radio]),
.member select {
    border: 1px solid #dadada;
    padding: 15px;
    width: 100%;
    margin-bottom: 5px;
}


.member input[type=button],
.member input[type=submit] {
    background-color: #2D2F7A;
    color: #fff;
}


.member input:focus,
.member select:focus {
    border: 1px solid #2D2F7A;
}


.field.birth div {
    display: flex;
    gap: 10px;
}


.field.tel-number div {
    display: flex;
    align-items: center;
}


.field.tel-number div input:nth-child(1) {
    flex: 2;
}

.field.tel-number div input:nth-child(2) {
    flex: 1;
    height: 48px;
    margin-left: 10px;
}


.field.gender div {
    border: 1px solid #dadada;
    padding: 15px 5px;
    background-color: #fff;
}


.email-input {
    display: flex;
    align-items: center;
}


.member-footer {
    text-align: center;
    font-size: 12px;
    margin-top: 20px;
}


.member-footer div a:hover {
    text-decoration: underline;
    color: #2D2F7A;
}


.member-footer div a:after {
    content: '|';
    font-size: 10px;
    color: #bbb;
    margin-right: 5px;
    margin-left: 7px;
    display: inline-block;
    transform: translateY(-1px);
}

.member-footer div a:last-child:after {
    display: none;
}


textarea#introduction {
    width: 500px;
    height: 100px;
}


@media (max-width: 768px) {
    .member {
        width: 100%;
    }
}


select.box {
    width: 50%;
    height: 50px;
    box-sizing: border-box;
    margin-left: 5px;
    padding: 5px 0 5px 10px;
    border-radius: 4px;
    border: 1px solid #d9d6d6;
    color: #383838;
    background-color: #ffffff;
    font-family: 'Noto Sans KR', sans-serif;
}


option {
    font-size: 16px;
}
        
    </style>
 </head>
<body>
    <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section">회원가입</h2>
            </div>
         </div>
      </div>
    </section>
    <div class="container-box">
        <div class="member">
            <br>
        <form id = 'joinForm' action="JoinService" method="post" enctype="multipart/form-data">
            <div class="field">
                <b>아이디</b>
                <div class="id-input">
                    <input type="text"  name ="mem_id" id="inputE" placeholder="아이디 입력 (6~20자)">
                    <input type="button" value="중복확인" onclick="checkE()">
                    <span id="checkE"></span>
                </div>
            </div>
            <div class="field">
                <b>비밀번호</b>
                <input class="userpw" name ="mem_pw" type="password" placeholder= "비밀번호 입력 (문자,숫자 포함 8~20자)">
            </div>
            <div class="field">
                <b>비밀번호 재확인</b>
                <input class="userpw-confirm"  name ="pwcheck" type="password" placeholder= "비밀번호 재입력">
            </div>
            <div class="field">
                <b>이름</b>
                <input type="text" name ="mem_name" placeholder= "이름을 입력해주세요">
            </div>

            <div class="field birth">
                <b>생년월일</b>
                <div>
                    <input type="number" name ="year" placeholder="연도(4자)">                
                    <select name="month">
                        <option value="">월</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="number"  name="date" placeholder="일">
                </div>
            </div>

            <div class="field gender">
                <b>성별</b>
                <div>
                    <label><input type="radio" name="mem_gender" value="M">남자</label>
                    <label><input type="radio" name="mem_gender" value="F">여자</label>
                </div>
            </div>

            
            <div class="field tel-number">
            <div class="field">
                <b>본인 확인 이메일</b>
                <div class="email-input">
                    <input class="box" id="domain-txt" type="text" name = "mem_email" placeholder="이메일 입력"/>
                    <select class="box" id="domain-list">
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="kakao.com">kakao.com</option>
                    </select>
                </div>
            </div>
                <b>휴대전화</b>
                <div>
                    <input type="tel" name ="mem_phone"  id="input_phone" placeholder="전화번호 입력">
                    <input type="button" id="btnSendSms" value="인증번호 받기" onclick="onBtnClickSendSms()">
                    <input type="hidden" id="smsNumber" value="null">
                </div>
                <input type="number" id='inputSmsNumber' placeholder="인증번호를 입력하세요">
            </div>
          <div class="additional-info">
                <div class="field">
                    <label for="nickname"><b>닉네임</b></label>
                    <input id="nickname" name = "nick" type="text" placeholder="닉네임을 입력해주세요" required>
                </div>
    
                <div class="field">
                    <label for="introduction"><b>자기 소개</b></label>
                    <textarea id="introduction" name = "info" placeholder="간단한 자기 소개를 입력해주세요" required></textarea>
                </div>
                <div class="field">
                    <label for="profile-pic"><b>프로필 사진 추가</b></label>
                    <!-- <input type="file" name = "pic" id="profile-pic" accept="image/*"> -->
                    <input type="file" name = "imageFile" id="profile-pic" accept="image/*">
                    
                </div>
                <div id="profile-pic-preview"></div>
            </div>

            <input type="button" onClick="submitBtnClick()" value="가입하기">
        </form>

            <div class="member-footer">
            </div>
        </div>
    </div>
    
    <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.scrolly.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/skel.min.js"></script>
   <script src="assets/js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="assets/js/main.js"></script>
   <script type="text/javascript">
      function checkE(){
         var inputE = $("#inputE").val()
         console.log(inputE)
         // JSON(JavaScript Object Notation)
         // {key1 : value1, key2 : value, {key3 : value3}}
         $.ajax(
            {
               // 어디로 요청할건지
               url : "IDcheck",
               // 어떤 데이터를 보낼건지
               data : {'inputE' : inputE},
               // 어떤 방식으로 요청할건지
               type : 'get',
               // 성공했을 때 / 실패했을 때 어떻게 처리할건지
               success : function(data){
                  if(data=='true'){
                     $('#checkE').html('사용 가능한 아이디입니다~')
                  }else{
                     $('#checkE').html('사용 불가능한 아이디입니다~')
                  }
               },
               error : function(){
                  alert("통신실패!")
               }
            }      
         )  
      }
  

      
      function onBtnClickSendSms() {
    	    
    	    var btnValue = document.getElementById("btnSendSms").value;
    	    var phoneValue = document.getElementById("input_phone").value;
    	 
    	    if (phoneValue === "" || phoneValue.length !== 11) {
    	        alert("전화번호를 올바르게 입력해주세요.");
    	        return;
    	    }
    	    
    	    if(btnValue === "전송실패"){
    	    	alert("잠시 후 다시 시도해주세요.");
    	    	return;
    	    }
    	    else if (btnValue !== "인증번호 받기") {
    	        alert("인증번호가 이미 발송되었습니다.");
    	        return;
    	    }
    	    
    	    
    	    var inputValue = document.getElementById("input_phone").value;

            $.ajax(
                    {
                       url : "SendSms",  
                       data : {'phone' : inputValue},
                       type : 'post',
                       success : function(data){
                    	   if(data == 'false'){
                    		   document.getElementById('btnSendSms').value = "전송실패";
                    	   }else{
                    		   // "전송됨"으로 버튼의 값이 변경되면 5분 카운트다운을 시작합니다.
                    		   document.getElementById('smsNumber').value = data;
                               startCountdown(btnSendSms);
                    	   }
                       },
                       error : function(){
                          alert("통신실패!")
                       }
                    }      
                 )
                 //ajax끝
    	}

      function startCountdown(button) {
    	    var countDownDate = new Date().getTime() + 5 * 60 * 1000; // 현재 시간에서 5분 후의 시간을 계산합니다.

    	    // 1초마다 실행되는 함수
    	    var x = setInterval(function() {
    	        // 현재 시간을 가져옵니다.
    	        var now = new Date().getTime();

    	        // 5분 카운트다운 시간을 계산합니다.
    	        var distance = countDownDate - now;

    	        // 분과 초를 계산합니다.
    	        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    	        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    	        // 버튼의 값을 변경하여 시간을 표시합니다.
    	        button.value = "전송됨( " + minutes + "분 " + seconds + "초 )";

    	        // 카운트 끝날 시 버튼 값 원래대로 변경, smsNumber 태그 값도 원래대로 'null'로 변경
    	        if (distance < 0) {
    	            clearInterval(x);
    	            button.value = "인증번호 받기";
    	            document.getElementById('smsNumber').value = 'null';
    	        }
    	    }, 1000); // 1초 간격으로 실행됩니다.
    	}
      

      function submitBtnClick() {
          // "inputData" 태그의 값을 가져옵니다.
          var inputDataValue = document.getElementById("inputSmsNumber").value;
          var smsNumberValue = document.getElementById('smsNumber').value;
          
          if(smsNumberValue === 'null'){
        	  alert("본인인증을 진행해주세요.");
          }
          if (smsNumberValue!== inputDataValue) {
              alert("인증번호가 맞지 않습니다.");
          }
          else {
        	 document.getElementById('joinForm').submit();
          }
      }

   
   </script>

</body>
</html>   
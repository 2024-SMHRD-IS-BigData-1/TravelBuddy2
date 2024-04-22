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
    width: 400px;
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

.member input:not(input[type=radio]), .member select {
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

.member input:focus, .member select:focus {
    border: 1px solid #2D2F7A;
}

.field.birth div { 
    display: flex;
    gap: 10px; 
}

.field.tel-number div {
    display: flex;
    align-items: center; /* Added align-items */
}

.field.tel-number div input:nth-child(1) {
    flex: 2;
}

.field.tel-number div input:nth-child(2) {
    flex: 1;
    height: 48px; /* Set height */
    margin-left: 10px; /* Add margin for spacing */
}

.field.gender div {
    border: 1px solid #dadada;
    padding: 15px 5px;
    background-color: #fff;
}

.email-input {
    display: flex;
    align-items: center; /* Added align-items */
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
            <div class="field">
                <label for="username"><b>아이디(6~20자)</b></label>
                <div class="id-input">
                    <input id="username" type="text" placeholder="아이디 입력 (6~20자)" required>
                    <input type="button" value="중복확인">
                </div>
            </div>
            <div class="field">
                <label for="password"><b>비밀번호</b></label>
                <input id="password" class="userpw" type="password" placeholder="비밀번호 입력 (문자,숫자 포함 8~20자)" required>
            </div>
            <div class="field">
                <label for="confirm-password"><b>비밀번호 재확인</b></label>
                <input id="confirm-password" class="userpw-confirm" type="password" placeholder="비밀번호 재입력" required>
            </div>
            <div class="field">
                <label for="name"><b>이름</b></label>
                <input id="name" type="text" placeholder="이름을 입력해주세요" required>
            </div>

            <div class="field birth">
                <label for="year"><b>생년월일</b></label>
                <div>
                    <input id="year" type="number" placeholder="연도(4자)" required>                
                    <select id="month" required>
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
                    <input type="number" placeholder="일" required>
                </div>
            </div>

            <div class="field gender">
                <label><b>성별</b></label>
                <div class="gender">
                    <label><input type="radio" name="gender" id="male">남자</label>
                    <label><input type="radio" name="gender" id="female">여자</label>
                </div>
            </div>

            <div class="field">
                <label for="email"><b>본인 확인 이메일</b></label>
                <div class="email-input">
                    <input id="email" class="box" type="email" placeholder="이메일 입력" required/>
                    <select class="box" id="domain-list">
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="kakao.com">kakao.com</option>
                    </select>
                </div>
            </div>
            
            <div class="field tel-number">
                <label for="phone"><b>휴대전화</b></label>
                <div>
                    <input id="phone" type="tel" placeholder="전화번호 입력" required>
                    <input type="button" class="verify-button" value="인증번호 받기">
                </div>
                <input id="verification-code" type="number" placeholder="인증번호를 입력하세요" required>
            </div>
            <input type="button" class="signup-button" value="가입하기">
            <div class="member-footer">
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/signup_script.js"></script>
</body>
</html>
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
	width: 500px;
	height: 850px;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 15px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
	background-color: white;
}
/* Google web font CDN*/
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap')
	;

* {
	box-sizing: border-box; /*전체에 박스사이징*/
	outline: none; /*focus 했을때 테두리 나오게 */
}

.id-input {
	display: flex;
	align-items: center;
}

.id-input input[type="text"] {
	flex: 2; /* 아이디 입력란의 너비를 더 크게 설정 */
	margin-right: 5px; /* 입력란과 버튼 사이의 간격을 조절 */
}

.id-input input[type="button"] {
	flex: 1; /* 중복확인 버튼의 너비를 줄임 */
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

a {
	text-decoration: none;
	color: #222;
}

.heading-section {
	text-align: center;
	margin-bottom: 15px;
	margin-right: 285px;
}

/*member sign in*/
.member {
	width: 400px;
	/* border: 1px solid #000; */
	margin: auto; /*중앙 정렬*/
	padding: 0 20px;
	margin-bottom: 20px;
}

.member .logo {
	/*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
	display: block;
	margin: 50px auto;
}

.member .field {
	margin: 5px 0; /*상하로 좀 띄워주기*/
}

.member b {
	/* border: 1px solid #000; */
	display: block; /*수직 정렬하기 */
	margin-bottom: 5px;
}

/*input 중 radio 는 width 가 100%면 안되니까 */
.member input:not(input[type=radio]), .member select {
	border: 1px solid #dadada;
	padding: 15px;
	width: 100%;
	margin-bottom: 5px;
}

.member input[type=button], .member input[type=submit] {
	background-color: #2D2F7A;
	color: #fff
}

.member input:focus, .member select:focus {
	border: 1px solid #2D2F7A;
}

.field.birth div { /*field 이면서 birth*/
	display: flex;
	gap: 10px; /*간격 벌려줄때 공식처럼 사용핟나 */
}

/* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
    flex:1;
} */
.field.tel-number div {
	display: flex;
}

.field.tel-number div input:nth-child(1) {
	flex: 2;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field.gender div {
	border: 1px solid #dadada;
	padding: 15px 5px;
	background-color: #fff;
}

.placehold-text {
	display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
	position: relative;
	/* border: 1px solid #000; */
}

.placehold-text:before {
	position: absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
	right: 20px;
	top: 13px;
	pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
}

.userpw {
	background: url(./images/images2/icon-01.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.userpw-confirm {
	background: url(./images/images2/icon-02.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.member-footer {
	text-align: center;
	font-size: 12px;
	margin-top: 20px;
}

.member-footer div a:hover {
	text-decoration: underline;
	color: #2D2F7A
}

.member-footer div a:after {
	content: '|';
	font-size: 10px;
	color: #bbb;
	margin-right: 5px;
	margin-left: 7px;
	/*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
	display: inline-block;
	transform: translateY(-1px);
}

.member-footer div a:last-child:after {
	display: none;
}

@media ( max-width :768px) {
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
	font-family: 'Montserrat', 'Pretendard', sans-serif;
}

option {
	font-size: 16px;
}

.email-input {
	display: flex;
}

.info .box#domain-list option {
	font-size: 14px;
	background-color: #ffffff;
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
			<form action="JoinService" method="post">
				<div class="field">
					<b>아이디</b>
					<div class="id-input">
						<input type="text" name="id" placeholder="아이디 입력 (6~20자)">

						<input type="button" value="중복확인">
					</div>
				</div>
				<div class="field">
					<b>비밀번호</b> <input class="userpw" type="password" name="pw"
						placeholder="비밀번호 입력 (문자,숫자 포함 8~20자)">
				</div>
				<div class="field">
					<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password"
						name="pw-confirm" placeholder="비밀번호 재입력">
				</div>
				<div class="field">
					<b>이름</b> <input type="text" name=name placeholder="이름을 입력해주세요">
				</div>

				<div class="field birth">
					<b>생년월일</b>
					<div>
						<input type="number" name=birthdate placeholder="연도(4자)">
						<select>
							<option value="">월</option>
							<option value="">1월</option>
							<option value="">2월</option>
							<option value="">3월</option>
							<option value="">4월</option>
							<option value="">5월</option>
							<option value="">6월</option>
							<option value="">7월</option>
							<option value="">8월</option>
							<option value="">9월</option>
							<option value="">10월</option>
							<option value="">11월</option>
							<option value="">12월</option>
						</select> <input type="number" placeholder="일">
					</div>
				</div>

				<div class="field gender">
					<b>성별</b>
					<div>
						<label><input type="radio" name="gender">남자</label> <label><input
							type="radio" name="gender">여자</label>
					</div>
				</div>

				<div class="field">
					<b>본인 확인 이메일</b>
					<div class="email-input">
						<input class="box" name="email" id="domain-txt" type="text"
							name=email placeholder="이메일 입력" /> <select class="box"
							id="domain-list">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>

				<div class="field tel-number">
					<b>휴대전화</b>
					<div>
						<input type="tel" name=phone placeholder="전화번호 입력"> <input
							type="button" value="인증번호 받기">
					</div>
					<input type="number" placeholder="인증번호를 입력하세요">
				</div>

				<input type="submit" value="가입하기">
			</form>


			<div class="member-footer"></div>
		</div>
	</div>



</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 프레임 워크 jquery and bootStrap-->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- 프레임 워크 jquery and bootStrap-->

<!-- 카카오로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	// Kakao SDK 초기화
	Kakao.init('d304b0d6951e3b4f130b2898ef0e1acd'); // REST API 키 사용
	console.log(Kakao.isInitialized()); // SDK 초기화 여부 확인
</script>

<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->

<title>로그인</title>
</head>
<style>
/* 화면 꽉차게 */
html, body {
	height: 100%;
}
/* 메인 body 가운데 정렬 */
body {
	display: flex;
	justify-content: center;
	background-color: #f8f9fa; /* 헤더 추가한다고 변경*/
}

/* 스크롤바 제거를 위한 css */
.cont::-webkit-scrollbar {
	display: none;
}
/* main 컨텐츠 css   */
.cont {
	background-color: white;
	width: 744px; /* 헤더 추가한다고 변경*/
	height: 100%;
	-ms-overflow-style: none;
	/* 인터넷 익스플로러 */
	scrollbar-width: none;
	/* 파이어폭스 */
}

/* 로그인 용 로고 */
.re_sm_logo {
	font-size: 5rem;
	/* 화면 너비에 비례한 폰트 크기 */
	font-weight: 600;
	color: #828282;
}
/* 로그인 용 로고 */




/* or 양쪽 점선 추가 */
.hr-sect {
	width: 100%;
	display: flex;
	align-items: center;
	color: #50B0FF;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	border-top: 2px dashed #50B0FF;
	height: 2px;
}
/* or 양쪽 점선 추가 */

/* 부트에서 정해주는 버튼들 색상 변경 */
.btn-primary {
	font-weight: 1000;
	background-color: #50B0FF;
	border: none;
}

.btn-danger {
	font-weight: 1000;
	background-color: #FF4B5D;
	border: none;
}

.btn-warning {
	font-weight: 1000;
	background-color: #FFD52D;
	border: none;
}

.btn-danger:hover {
	background-color: #fa1b31;
}

.btn-warning:hover {
	background-color: #facb0c;
}

.btn-primary:hover {
	background-color: #37a1f8;
}
/* 부트에서 정해주는 버튼들 색상 변경 */

/* 버튼 사이즈 */
.btn-size {
	border-radius: 10px;
	width: 100%;
	height: 10vh;
	min-height: 50px;
	max-height: 100px;
	font-weight: 600;
}
/* 로그인 인풋 사이즈 */
.inp_size {
	border-radius: 15px;
	height: 11vh;
	min-height: 60px;
	max-height: 80px;
}
/*카카오 버튼 사이즈*/
.kakao-btn-size {
	width: 100%; 
	background-color: #FEE500; 
	border: none; 
	cursor: pointer;
	border-radius: 10px;	
}

/* 로고 사이즈 줄이기 */
@media (max-width: 768px) {
    .re_sm_logo {
		font-size: 4rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-4 {
		font-size: 1.2rem !important;
	}
}
/* 카카오 로그인 버튼 스타일 */
/* 카카오 로그인 버튼 스타일 */
.btn-kakao {
    font-weight: 1000;
    background-color: #FEE500;
    border: none;
    color: rgba(0, 0, 0, 0.85);
    position: relative;  /* 아이콘 배치를 위한 기준점 */
    text-align: center;  /* 텍스트 중앙 정렬 */
}

.btn-kakao:hover {
    background-color: #FEE500;
    color: rgba(0, 0, 0, 0.85);
    filter: brightness(95%);
}

.btn-kakao:active {
    background-color: #FEE500 !important;
    color: rgba(0, 0, 0, 0.85) !important;
}

.btn-kakao img {
    position: absolute;
    left: 1.5rem;
    top: 50%;
    transform: translateY(-50%);
    height: 60%;
    width: auto;
}
</style>
<body>
	<div class="cont overflow-y-auto">
		<!-- 오류 메세지 출력 -->
		<c:if test="${not empty loginError}">
			<div id="errorMessage" class="alert alert-danger">${loginError}</div>
		</c:if>
		
		<!-- 헤더 영역 -->
		<%-- <jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include> --%>
		<!-- 헤더 영역 -->

		<div class="mainhead-logo" style="width: 100%; padding-top: 50px;">
			<div class="row">
				<div class="col d-flex align-items-center justify-content-center">
					<div style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/';">
						<div class="logo" onclick="location.href='${pageContext.request.contextPath}/';" style="margin-bottom: 50px;">
							<img src="${pageContext.request.contextPath}/resources/assets/icon/logo.png" alt="Logo" class="img-fluid" width="200px">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fs-2" style="text-align: center; font-weight: 1000;">
			로그인
		</div>
		<div class="mainbody p-4">
			<form id="loginForm" action="/loginDo" method="post" onsubmit="return validateForm()" style="width: 100%">
				<div style="height: 7rem;">
					<input id="email" class="form-control fs-5 fw-semibold inp_size" type="text" placeholder="이메일" name="email" value="${cookie.rememberId.value}"/>
					<span id="idError" class="text-danger mx-1 fw-semibold"></span>
				</div>
				<div style="height: 7rem;">
					<input id="password" class="form-control fs-5 fw-semibold inp_size"	type="password" placeholder="비밀번호" name="password" />
					<span id="passwordError" class="text-danger mx-1 fw-semibold"></span>
				</div>
				<div class="fs-5 mb-2" style="color: #656565;">
					<input ${cookie.rememberId.value == null ? "" : "checked"}
						class="form-check-input" type="checkbox" id="remember"
						name="remember" /> <label for="remember" class="fw-semibold">아이디
						기억하기</label>
				</div>
				<div class="fs-5 mb-4" style="color: #656565;">
					<input ${cookie.autoLogin != null ? "checked" : ""}
						class="form-check-input" type="checkbox" id="autoLogin"
						name="autoLogin" /> <label for="autoLogin" class="fw-semibold">자동
						로그인</label>
				</div>
				<button class="btn btn-primary btn-size p-1 mb-2 fs-4"
					id="submitButton" type="submit">로그인</button>
				<div class="hr-sect fs-5 my-2">&nbsp; OR &nbsp;</div>
				
<button class="btn btn-kakao btn-size p-1 my-2 fs-4 mb-5" id="kakao-login-btn" type="button">
    <img src="/resources/assets/img/kakaoicon.png" alt="카카오 아이콘" />
    카카오 로그인
</button>

			</form>
			<div class="d-flex justify-content-center">
				<div class="fs-4">
					<a href="${pageContext.request.contextPath}/registView" style="color: #B7B7B7;">회원가입</a>
				</div>
			</div>
		</div>

	</div>
	
	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->
	
<script type="text/javascript">
	
document.getElementById('kakao-login-btn').addEventListener('click', function () {
	const autoLogin = document.getElementById('autoLogin').checked;

    Kakao.Auth.authorize({
        redirectUri: 'http://localhost:8080/kakaologin',
        state: JSON.stringify({ autoLogin: autoLogin }) // 자동 로그인 여부 포함
    });
});

function validateForm() {
    const emailField = document.getElementById("email");
    const passwordField = document.getElementById("password");
    const idError = document.getElementById("idError");
    const passwordError = document.getElementById("passwordError");

    const email = emailField.value.trim();
    const password = passwordField.value.trim();

    // 이전 에러 메시지 초기화
    idError.textContent = "";
    passwordError.textContent = "";

    // 이메일 형식 검증을 위한 정규식
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // 이메일 필드가 비어있는지 확인
    if (email === "") {
        idError.textContent = "이메일을 입력해주세요.";
        emailField.focus();
        return false;
    }

    // 이메일 형식 검증
    if (!emailRegex.test(email)) {
        idError.textContent = "유효한 이메일 주소를 입력해주세요.";
        emailField.focus();
        return false;
    }

    // 비밀번호 필드가 비어있는지 확인
    if (password === "") {
        passwordError.textContent = "비밀번호를 입력해주세요.";
        passwordField.focus();
        return false;
    }

    // 비밀번호 길이 검증
    if (password.length < 6) {
        passwordError.textContent = "비밀번호는 6자리 이상이어야 합니다.";
        passwordField.focus();
        return false;
    }

    let isValid = false; // 이메일 유효 여부 플래그

    // 동기적 AJAX 호출
    $.ajax({
        type: 'post',
        url: '/emailCheck', // 서버의 이메일 체크 URL
        data: {
            email: email
        },
        async: false, // 동기적 처리
        success: function(cnt) {
            if (cnt == 0) { // 이메일 존재하지 않음
                alert("존재하지 않는 아이디입니다."); // 경고창 출력
                emailField.focus();
                isValid = false;
            } else {
                isValid = true; // 이메일 존재
            }
        },
        error: function() {
            alert("아이디 확인 중 오류가 발생했습니다."); // 경고창 출력
            isValid = false;
        }
    });

    return isValid; // 유효 여부 반환
}

   // 페이지 로드 후 5초 뒤에 오류 메시지를 숨김
   window.onload = function () {
       const errorMessage = document.getElementById("errorMessage");
       if (errorMessage) {
           setTimeout(() => {
               errorMessage.style.display = "none"; // 메시지 숨기기
           }, 5000); // 5000ms = 5초
       }
   };
   
</script>
</body>
</html>
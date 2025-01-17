
<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 16. 
   * 작성자     : 철규
   * 상세설명  : 회원가입
   * 화면ID : 
   * ================================================================= 
   * 수정일         작성자             내용      
   * ----------------------------------------------------------------------- 
   * 
   * ================================================================= 
   */
%>

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"	crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- 다음 주소 api -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->

<title>kakaoRegist</title>
</head>

<style>
.mainbody {
	background-color: #ffffff;
}

.btn_log {
	border-radius: 10px;
	padding: 12px 15px;
	width: 100%;
	height: 100px;
}

.log {
	height: 100px;
	margin-bottom: 10px;
	border-radius: 20px
}

.log_last {
	height: 100px;
	border-radius: 20px
}

.btn-primary {
	background-color: #50B0FF;
	border: none;
}

.btn-primary:hover {
	background-color: #37a1f8;
}

.btn-primary:active {
	background-color: #50B0FF;
}

a {
	color: #37a1f8;
}
</style>
<style>
/* 화면 꽉차게 */
html, body {
    height: 100%;
}

body {
    display: flex;
    justify-content: center;
    background-color: #f8f9fa;
}

.cont::-webkit-scrollbar {
    display: none;
}

.cont {
    background-color: white;
    width: 744px;
    height: 100%;
    -ms-overflow-style: none;
    scrollbar-width: none;
}


.re_sm_logo {
    font-size: 5rem;
    font-weight: 600;
    color: #828282;
}

.inp_size {
    border-radius: 15px;
    height: 11vh;
    min-height: 60px;
    max-height: 80px;
}


.btn-primary {
    font-weight: 1000;
    background-color: #50B0FF;
    border: none;
}

.btn-primary:hover {
    background-color: #37a1f8;
}

.btn-size {
    border-radius: 10px;
    width: 100%;
    height: 10vh;
    min-height: 50px;
    max-height: 100px;
    font-weight: 600;
}

.input-group {
    height: 7rem;
    margin-bottom: 0.5rem;
}

.error-message {
    color: #dc3545;
    font-weight: 600;
    margin-left: 0.25rem;
}

/* 로고 사이즈 줄이기 */
@media (max-width: 768px) {
    .re_sm_logo {
		font-size: 4rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-3 {
		font-size: 1.2rem !important;
	}
	.fs-4 {
		font-size: 1.2rem !important;
	}
	.fs-5 {
		font-size: 1.2rem !important;
	}
	.fs-4 m-2 {
		font-size: 1.0rem !important;
	}
	.log {
		height: 80px;
		margin-bottom: 10px;
		border-radius: 20px
	}
	
	.log_last {
		height: 80px;
		border-radius: 20px
	}
	.btn_log {
		border-radius: 10px;
		padding: 12px 15px;
		width: 100%;
		height: 80px;
	}
	
}

@media (max-width: 576px) {
    .re_sm_logo {
		font-size: 3rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-3 {
		font-size: 1.0rem !important;
	}
	.fs-4 {
		font-size: 1.0rem !important;
	}
	.fs-5 {
		font-size: 1.0rem !important;
	}
	.fs-4 m-2 {
		font-size: 0.8rem !important;
	}
	.log {
		height: 60px;
		margin-bottom: 10px;
		border-radius: 20px
	}
	
	.log_last {
		height: 60px;
		border-radius: 20px
	}
	.btn_log {
		border-radius: 10px;
		padding: 12px 15px;
		width: 100%;
		height: 60px;
	}
}
</style>



<script>

$(document).ready(function() {
	
	emailCheck(); // 초기 호출
	
})

function validateForm() {
   
    const form = document.querySelector("form");
    const emailInput = document.querySelector("input[type='text']");
    const passwordInput = document.querySelector("input[type='password']");
    const nameInput = document.querySelector("input[type='name']");

    const emailError = document.querySelector("#emailError");
    const passwordError = document.querySelector("#passwordError")
    const nameError = document.querySelector("#nameError")
	

    if (emailInput.value.trim() === "") {
        emailError.textContent = "이메일을 입력해주세요.";
        return false;
    } else {
        emailError.textContent = ""; // 오류 메시지 제거
    }
    // 비밀번호 유효성 검사
    if (passwordInput.value.trim() === "") {
        passwordError.textContent = "비밀번호를 입력해주세요.";
        return false;
    } else if (passwordInput.value.trim().length < 6) {
        passwordError.textContent = "비밀번호는 최소 6자 이상이어야 합니다.";
        return false;
    } else {
        passwordError.textContent = ""; // 오류 메시지 제거
    }

    if (nameInput.value.trim() === "") {
        nameError.textContent = "닉네임을 입력해주세요.";
        return false;
    } else {
        nameError.textContent = ""; // 오류 메시지 제거
    }
    return true;
};
   

 function emailCheck() {
 	let email = $('#email').val();

 	// 입력란의 값이 없으면 모든 span 태그 숨김
 	if (email == "") {
 		$("#submitButton").prop("disabled", true); // 버튼 비활성화
 		return;
 	}
 	
 	$.ajax({
 		type : 'post',
 		url : '/emailCheck',
 		data : {
 			email : email
 		},
 		success : function(cnt) { 
 			if (cnt == 0) { // cnt가 0일 경우 -> 사용 가능한 아이디 
 				emailError.textContent = "사용가능한 이메일입니다.";
 				$("#submitButton").prop("disabled", false); // 버튼 활성화
 			} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
 				
 				emailError.textContent = "탈퇴한 이메일입니다.";
 				$("#submitButton").prop("disabled", true); // 버튼 비활성화
 			}
 		},
 		error : function() {
 			emailError.textContent = "오류가 발생했습니다.";
 			$("#submitButton").prop("disabled", true); // 에러 발생 시 버튼 비활성화
 		}
 	});
 }

   
function findAddr() {

	new daum.Postcode({
	    oncomplete: function (data) {
	        // 사용자 주소를 받아올 변수를 정의한다.
	        var addr = '';
	        var pos = data.zonecode;

	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }

	        // 부모창의 주소칸에 받아온 주소를 넣는다.
	        $("#addr").val(addr);
	    }
	}).open();
}

</script>


<body>

	<div class="cont overflow-y-auto">

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

		<div class="mainbody p-4">
			<form id="registForm" action="/kakaoRegistDo" onsubmit="return validateForm()" style="width: 100%">
				<div class="row">
					<div class="col">
						<label class="fs-4 m-2">아이디(이메일) 
						<span style="color: red;">*</span></label>
					</div>
					<div class="col" style="text-align: end;">
						<label id="emailError" class="text-danger mt-3 mx-2"></label>
					</div>
				</div>
				<input class="form-control log fs-3" id="email" name="email" type="text" placeholder="이메일을 입력해주세요" value="${userInfo.email}" oninput="emailCheck()" readonly />
				<div class="row">
					<div class="col">
						<label class="fs-4 m-2">비밀번호 <span style="color: red;">*</span></label>
					</div>
					<div class="col" style="text-align: end;">
						<label id="passwordError" class="text-danger mt-3 mx-2"></label>
					</div>
				</div>
				<input class="form-control log fs-3" id="password" name="password" type="password" placeholder="비밀번호를 입력해주세요" value="${userInfo.email}" readonly />

				<div class="row">
					<div class="col">
						<label class="fs-4 m-2">이름(닉네임) 
						<span style="color: red;">*</span></label>
					</div>
					<div class="col" style="text-align: end;">
						<label id="nameError" class="text-danger mt-3 mx-2"></label>
					</div>
				</div>
				<input class="form-control log fs-3" id="name" name="nickName" type="text" placeholder="이름을 입력해주세요" value="${userInfo.nickName}" readonly />

				<div class="row">
					<div class="col">
						<label class="fs-4 m-2">생년월일 <span style="color: red;">*</span></label>
					</div>
				</div>
				<input class="form-control log fs-3" id="birth" name="birthYear" type="date"/>

				<div class="row">
					<div class="col">
						<label class="fs-4 m-2">주소 <span style="color: red;">*</span></label>
					</div>
				</div>
				<input class="form-control log_last fs-3" onclick="findAddr()" id="addr" name="addr" placeholder="주소를 입력하세요." readonly /> 
				<label class="fs-5 m-2" style="color: #ABABAB;">
					개인정보는 위치 서비스 및 보조금 조회시 사용됩니다
				</label>

				<button class="btn btn-primary btn_log mb-2 fs-3" id="submitButton" type="submit">회원가입</button>
			</form>
		</div>
	</div>
	
	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->
</body>
</html>
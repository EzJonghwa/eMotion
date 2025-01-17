
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

<title>kakaomypage</title>
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

.brdimg {
	width: 8.125rem;
	height: 8.125rem;
	border-radius: 50%;
	overflow: hidden;
	padding: 0;
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
	/* 프로필 이미지 크기 줄임 */
    .brdimg {
        width: 6rem; /* 작은 화면에서 이미지 크기 줄임 */
        height: 6rem;
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

@media (max-width: 420px) {
    .re_sm_logo {
		font-size: 2.5rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
}
</style>


<script>

    // 로그인 validation 
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        const emailInput = document.querySelector("input[type='text']");
        const passwordInput = document.querySelector("input[type='password']");
        const nameInput = document.querySelector("input[type='name']");

        form.addEventListener("submit", function (event) {
            // 초기화
            let isValid = true;
            const emailError = document.querySelector("#emailError");
            const passwordError = document.querySelector("#passwordError")
            const nameError = document.querySelector("#nameError")


            if (emailInput.value.trim() === "") {
                emailError.textContent = "이메일을 입력해주세요.";
                isValid = false;
            } 
            else {
                emailError.textContent = ""; // 오류 메시지 제거
            }
            // 비밀번호 유효성 검사
            if (passwordInput.value.trim() === "") {
                passwordError.textContent = "비밀번호를 입력해주세요.";
                isValid = false;
            } 
            else if (passwordInput.value.trim().length < 6) {
                passwordError.textContent = "비밀번호는 최소 6자 이상이어야 합니다.";
                isValid = false;
            } 
            else {
                passwordError.textContent = ""; // 오류 메시지 제거
            }

            if (nameInput.value.trim() === "") {
                nameError.textContent = "닉네임을 입력해주세요.";
                isValid = false;
            } else {
                nameError.textContent = ""; // 오류 메시지 제거
            }
            // 유효하지 않으면 기본 동작 취소
            if (!isValid) {
                event.preventDefault();
            }
        });
    });
    
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
    
$(document).ready(function () {
	
    // 회원탈퇴 버튼 클릭 시 모달 열기
    $('#exit').on("click", function () {
      var exitModal = new bootstrap.Modal(document.getElementById('exitConfirmModal'), {});
      exitModal.show();
    });

    // 모달의 확인 버튼 클릭 시 AJAX 요청
    $('#confirmExit').on("click", function () {
      let email = $('#email').val();
      let data = { 'email': email };

      $.ajax({
        method: "GET",
        url: "/emailExit",
        data: data,
        success: function (data) {
          // 탈퇴 성공 후 홈 화면 이동
          window.location.href = "/";
        },
        error: function (request, status, error) {
          console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
      })
    });
  });
    
//이미지 업로드
/*$(document).ready(function(){
	$("#myImage").click(function(){
		$("#uploadImage").click();
	});
	
	// 이미지 업로드
	$("#uploadImage").on("change", function(){
		let file = $(this)[0].files[0];
		if(file){
			let fileType = file['type'];
			let valTypes = ['image/gif','image/jpeg','image/jpg','image/png'];
			if(!valTypes.includes(fileType)){
				alert("유효한 이미지 타입이 아닙니다.!!");
				$(this).val(''); //선택파일 초기화
			} else {
				// FormData HTML 폼 데이터를 쉽게 가져오도록 하는
				// submit이 아닌 비동기로 폼데이터를 전송하기 위해
				//let formData = new FormData($("#profileForm")[0]);
				
				// FormData 객체 생성
		        let formData = new FormData();
		        formData.append("uploadImage", file);
		        
				$.ajax({
					url : '<c:url value="/files/upload" />',
					type : "POST",
					data : formData,
					dataType : 'json',
					processData : false,  // formData 객체를 URL 인코딩하지 않도록
					contentType : false,  // 디폴트 전송인 application/x-www-form-urlencoded로 전송하지 않도록
										  // 파일은  multipart/form-data 이전 데이터 형태로 전송
					success : function(res){
						console.log(res);
						if(res.message == 'success'){
							$("#myImage").attr("src", "${pageContext.request.contextPath}" + res.imagePath);
						}
					},error:function(e){
						console.log(e);
					}
				});
			}
		}
	});
});*/

// 이미지 업로드 및 미리보기
$(document).ready(function () {
    let originalImageSrc = $("#myImage").attr("src"); // 원본 이미지 경로 저장
    let isImageChanged = false; // 이미지 변경 여부 플래그
    let isFormSubmitted = false; // 폼 제출 여부 플래그
    let isNavigating = false; // 뒤로 가기 중복 처리 방지 플래그

    // 페이지 로드 시 초기 히스토리 상태 설정
    history.replaceState({ navigateTo: null }, null, location.href);
    
    const referrer = document.referrer;
    console.log("Previous Page:", referrer);

    // 이미지 클릭 시 파일 업로드 트리거
    $("#myImage").click(function () {
        $("#uploadImage").click();
    });

    // 이미지 미리보기 기능
    $("#uploadImage").on("change", function () {
        let file = $(this)[0].files[0];
        if (file) {
            let fileType = file['type'];
            let valTypes = ['image/gif', 'image/jpeg', 'image/jpg', 'image/png'];
            if (!valTypes.includes(fileType)) {
                alert("유효한 이미지 타입이 아닙니다.!!");
                $(this).val(''); // 선택 파일 초기화
                return;
            }
            let reader = new FileReader();
            reader.onload = function (e) {
                $("#myImage").attr("src", e.target.result); // 미리보기 이미지 업데이트
                isImageChanged = true; // 이미지가 변경되었음을 설정
             	// 히스토리 상태 추가
                history.pushState({ navigateTo: referrer }, null, location.href);
                
            };
            reader.readAsDataURL(file);
        }
    });

    // 수정 버튼 클릭 시
    $("#submitButton").click(function (e) {
        e.preventDefault(); // 기본 동작 방지
        
        if (isImageChanged) {
            // 폼이 제출되면 히스토리 상태를 덮어씀
            history.replaceState({ navigateTo: "/" }, null, "/");
            isFormSubmitted = true;
            $("#profileForm").submit();
        } else {
            isFormSubmitted = true;
            $("#profileForm").submit();
        }
        
        if (isImageChanged) {
            let file = $("#uploadImage")[0].files[0];
            if (file) {
                let formData = new FormData();
                formData.append("uploadImage", file);

                $.ajax({
                    url: '<c:url value="/files/upload" />',
                    type: "POST",
                    data: formData,
                    dataType: 'json',
                    processData: false,
                    contentType: false,
                    success: function (res) {
                        if (res.message == 'success') {
                            // 이미지 업로드 성공 시 원본 이미지 경로 업데이트
                            $("#myImage").attr("src", "${pageContext.request.contextPath}" + res.imagePath);
                            isFormSubmitted = true; // 폼이 정상 제출되었음을 설정
                            $("#profileForm").submit();
                        } else {
                            alert("이미지 업로드 실패");
                        }
                    },
                    error: function (e) {
                        console.log(e);
                        alert("이미지 업로드 중 오류 발생");
                    }
                });
            }
        } else {
            isFormSubmitted = true;
            $("#profileForm").submit();
        }
    });

    // 특정 클릭 이벤트 감지 (data-href 사용)
    $(document).on("click", ".navigate-link", function (e) {
        e.preventDefault(); // 기본 이동 방지
        const navigateTo = $(this).data("href"); // data-href 값 가져오기
        console.log("Navigate to set:", navigateTo);

        // 히스토리 상태 추가
        history.pushState({ navigateTo: navigateTo }, null, location.href);

        if (isImageChanged && !isFormSubmitted) {
            $("#leaveModal").data("navigateTo", navigateTo); // 이동 URL 저장
            $("#leaveModal").modal("show"); // 모달 표시
        } else {
            window.location.href = navigateTo; // 변경사항 없으면 바로 이동
        }
    });

    // 브라우저 뒤로 가기 버튼 감지
    window.addEventListener("popstate", function (e) {
        const state = e.state; // 히스토리 상태 가져오기
        if (state && state.previousPage) {
            console.log("Previous Page from state:", state.previousPage);
        }
        
        // 중복 이벤트 방지
        if (isNavigating || isFormSubmitted) {
            return; // 이미 탐색 중이거나 폼이 제출된 경우 이벤트 중지
        }

        if (isImageChanged) {
            e.preventDefault(); // 기본 뒤로 가기 방지
            isNavigating = true; // 플래그 설정

            if (state && state.navigateTo) {
                $("#leaveModal").data("navigateTo", state.navigateTo); // navigateTo가 "/"이면 그대로 유지
            } else {
                $("#leaveModal").data("navigateTo", "/"); // 기본값 설정
            }

            $("#leaveModal").modal("show"); // 모달 표시
        }
    });

    // 모달 버튼 동작
    $("#confirmLeave").click(function () {
        console.log("Confirm Leave clicked");

        // 원본 이미지 복원
        $("#myImage").attr("src", originalImageSrc);
        console.log("Original image restored:", originalImageSrc);

        // 상태 초기화
        isImageChanged = false;
        isNavigating = false;

        const navigateTo = $("#leaveModal").data("navigateTo") || "/";
        console.log("Navigate to:", navigateTo);

        // 이동 처리
        if (navigateTo) {
            window.location.href = navigateTo; // 저장된 링크로 이동
        } else {
            window.history.back(); // 히스토리 뒤로 이동
        }
    });

    $("#cancelLeave").click(function () {
        // 모달 닫기
        $("#leaveModal").modal("hide");
        isNavigating = false; // 뒤로 가기 상태 해제
    });
});

</script>


<body>

	<div class="cont overflow-y-auto">
	
			<!-- 헤더 영역 -->
			<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
			<!-- 헤더 영역 -->

			<div class="mainhead-logo" style="width: 100%;">
	            <div class="row">
	                <div class="col d-flex align-items-center justify-content-center">
	                    <div style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/';">
	                        <h1 class="re_sm_logo" style="text-align: center;">
	                            <span style="color: #FFD050;">e</span>
	                            <span style="color: #50B0FF;">Motion</span>
	                            <span style="font-size: 30px; color: #828282;"">나의 회원정보</span>
	                        </h1>
	                    </div>
	                </div>
	            </div>
	        </div>

			<div class="mainbody p-4">
					
					<form id="profileForm" action="/updateKakaoMypage" method="post" enctype="multipart/form-data" style="width: 100%">
					<!-- <form action="/updateKakaoMypage" method="post" style="width: 100%"> -->
						<div class="row px-3 d-flex align-items-center">
							<div class="brdimg">
								<c:if test="${sessionScope.login.profileImg == null}">
									<img src="${pageContext.request.contextPath}/assets/img/non.png"
										id="myImage" class="img-fluid shadow-sm w-100 h-100" style="cursor: pointer;">
									</c:if>
								<c:if test="${sessionScope.login.profileImg != null}">
									<img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}"
										id="myImage" class="img-fluid shadow-sm w-100 h-100" style="cursor: pointer;">
									</c:if>
								<input type="file" name="uploadImage" id="uploadImage" accept="image/*" style="display: none;">
							</div>
							<div class="col fs-4">
								<label class="fs-4 m-2">
									아이디(이메일)
									<button class="btn btn-warning">카카오</button>
								</label> 
								<input class="form-control log_email fs-3" id="email" name="email" type="text" value="${sessionScope.login.email}" readonly />
							</div>
						</div>

						<div class="row">

							<div class="col">
							</div>
							
							<div class="col" style="text-align: end;">
								<label id="emailError" class="text-danger mt-3 mx-2"></label>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<label class="fs-4 m-2">이름(닉네임)</label>
							</div>
							<div class="col" style="text-align: end;">
								<label id="nameError" class="text-danger mt-3 mx-2"></label>
							</div>
						</div>
						<input class="form-control log fs-3" id="name" name="nickName" type="text" value="${sessionScope.login.nickName}"/>

						<div class="row">
							<div class="col">
								<label class="fs-4 m-2">생년월일</label>
							</div>
						</div>
						<input class="form-control log fs-3" id="birth" name="birthYear" type="date" value="${sessionScope.login.birthYear}" />

						<div class="row">
							<div class="col">
								<label class="fs-4 m-2" >주소</label>
							</div>
						</div>
						
						<input onclick="findAddr()" class="form-control log_last fs-3" value="${sessionScope.login.addr}" id="addr" name="addr" readonly />
						
						<!-- <button class="btn btn-primary btn_log mb-2 fs-3" id="submitButton" type="submit">수정</button> -->
						<button class="btn btn-primary btn_log mb-2 mt-4 fs-3" id="submitButton" type="button">수정</button>
						<hr style="border-top: 2px dashed black;">
					</form>

				</div>

				<div class="d-flex justify-content-center mb-4">
					<button class="btn btn-link" style="font-weight: 1000;" id="exit">회원탈퇴</button>
				</div>

	</div>
	
	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->
	
	
	<!-- 회원탈퇴 확인 모달 -->
		<div class="modal fade" id="exitConfirmModal" tabindex="-1" aria-labelledby="exitConfirmModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exitConfirmModalLabel">회원탈퇴 확인</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      <div class="modal-body">
		        	정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-danger" id="confirmExit">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	<!-- 경고 모달 -->
	<div class="modal" id="leaveModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">페이지 이탈 경고</h5>
	        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button> -->
	      </div>
	      <div class="modal-body">
	        <p>수정 사항이 저장되지 않을 수 있습니다. 계속 진행하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="confirmLeave">확인</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelLeave">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>

</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Routine</title>
<!-- 프레임 워크 jquery and bootStrap-->
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=hK16EQ22PI8xceOsMCRZI6GSYMhAaI2s9pmKiS2M"></script>
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


<!-- 프로그레스 바 스타일 css -->
<!-- 프로그레스 바 스타일 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<style>
.headcss {
	box-shadow: 0px 5px 0px 0px #d6edff;
}

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

.btn.responsive-text {
	font-size: calc(0.8rem + 0.4vw);
	font-weight: 600;
	/* 화면 너비에 비례한 폰트 크기 */
}

.responsive-text {
	font-size: calc(1rem + 0.5vw);
	/* 화면 너비에 비례한 폰트 크기 */
}

.responsive-subtext {
	font-size: calc(1rem + 0.5vw);
	font-weight: 600;
	color: #604616;
	/* 화면 너비에 비례한 폰트 크기 */
}

.responsive-tabletext {
	font-size: calc(0.6rem + 0.5vw);
}

.responsive-input {
	font-size: calc(1rem + 0.5vw);
	height: 7vh;
	/* 화면 너비에 비례한 폰트 크기 */
}

.re_logo {
	font-size: calc(2.5rem + 0.5vw);
	/* 화면 너비에 비례한 폰트 크기 */
	font-weight: 1000;
}

.re_sm_logo {
	font-size: calc(1rem + 0.5vw);
	/* 화면 너비에 비례한 폰트 크기 */
	font-weight: 600;
	color: #828282;
}

.re_exp {
	font-size: calc(1rem + 0.5vw);
	/* 화면 너비에 비례한 폰트 크기 */
	font-weight: 1000;
	text-align: center;
}

.container-sm {
	height: 100%;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	justify-content: center;
	background-color: #f8f9fa; /* 헤더 추가한다고 변경*/
}

.maincss {
	border-radius: 10px;
}

.maincss::-webkit-scrollbar {
	display: none;
}

.cont::-webkit-scrollbar {
	display: none;
}

.cont {
	background-color: white;
	width: 744px;
	height: 100%;
	-ms-overflow-style: none;
	/* 인터넷 익스플로러 */
	scrollbar-width: none;
	/* 파이어폭스 */
}

.hidden {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.liststyle {
	border: 3px #E9D7B6 solid;
	background-color: #Fffbe9;
	border-radius: 10px;
	color: #604616;
	cursor: pointer;
	transition-duration: 0.2s;
	font-weight: 1000;
	cursor: pointer;
	background-color: #Fffbe9;
}

.liststyle:hover {
	transform: scale(0.99);
}

.liststyle-inner {
	border: 3px #E9D7B6 solid;
	background-color: #Fffbe9;
	border-radius: 10px;
	color: #604616;
	cursor: pointer;
	transition-duration: 0.2s;
	font-weight: 1000;
	cursor: pointer;
	background-color: #Fffbe9;
}

.liststyle-inner:hover {
	transform: scale(0.99);
}

.img-size {
	width: 100%;
	border-radius: 10px;
}

.progress-container {
	display: flex;
	width: 100%;
	min-height: 10px;
	height: 1.2vh;
	max-height: 12px;
	background-color: #D1D1D1;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	border-radius: 50px;
	position: relative;
	margin-bottom: 20px;
}

.progress-bar {
	height: 100%;
	border-radius: 50px;
	transition: width 0.5s ease-in-out;
}

.progress-bar:hover {
	opacity: 80%;
}

.progress-bar.left-progress {
	background-color: #83C4FF;
}

.progress-bar.right-progress {
	background-color: #F46C46;
}

.tips {
	position: absolute;
	background-color: #fff;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	display: none;
	pointer-events: none;
	z-index: 10;
}

.headfont {
	color: #695B40;
	font-weight: 1000;
}

.headfont.center {
	font-weight: 1000;
	color: #372504;
}

.minus-font {
	color: #976200;
}

.minus-font.before {
	color: #83C4FF;
}

.minus-font.after {
	color: #F46C46;
}

.brd-bot {
	border-bottom-left-radius: 0%;
	border-bottom-right-radius: 0%;
	margin-right: 10px;
}

.brd-bot:active {
	transform: scale(1.12);
}

.changeinfo {
	border: 3px #E9D7B6 solid;
	border-top-left-0us: 10px%;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.modal::-webkit-scrollbar {
	display: none;
}

.active {
	transform: scale(1.12);
}

.station-size {
	max-height: 280px;
}

.station-size::-webkit-scrollbar {
	display: none;
}

.liststyle-inner.highlight {
	background-color: #f0f0f0;
	border-left: 4px solid #007bff;
	padding-left: 8px;
}

.map-container {
	border-radius: 10px; /* 원하는 border-radius 값 */
	overflow: hidden; /* border-radius 효과를 유지 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 선택 사항: 그림자 효과 */
	border: 3px #E9D7B6 solid
}
</style>
<script src='/resources/js/Routine.js'></script>
</head>

<body>
	<div class="cont overflow-y-auto">

		<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->




		<div class="px-3">
			<div class="px-2 d-flex justify-content-between align-items-center">
				<!-- 버튼 -->
				<div><h4 style="font-weight:1000;">나의 루틴 에너지 절감량 분석</h4></div>
				<button class=" btn btn-primary responsive-text p-2"
					onclick="location.href='${pageContext.request.contextPath}/routineDetail'">+
					루틴 추가</button>
			</div>
			<!--전기차 테이블-->
			<div class="maincss px-3 overflow-auto mt-3" style="height: 68vh;">
				<c:if test="${not empty routineList}">
					<c:forEach var="routine" items="${routineList}">
						<div class="fs-4 mb-3 ">
							<div class="row liststyle py-3 px-3 " data-bs-toggle="modal"
								data-bs-target="#exampleModal${routine.routineNo}">
								<div class="row ">
									<div class="col" style="font-size: 2.3vh">${routine.rouTitle}</div>
								</div>
								<div class="row ">
									<div class="col" style="font-size: 1.8vh">(${routine.createDt})</div>
								</div>
								<div class="row " style="text-align: center; font-size: 2vh;">
									<div class="col">
										출발<br>${routine.startLoc}</div>
									<div class="col">
										도착<br>${routine.endLoc}</div>
								</div>

							</div>

						</div>



						<div class="modal fade" id="exampleModal${routine.routineNo}"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-md">
								<div class="modal-content p-4">
									<div class="px-2">
										<div class="row d-flex align-items-start">
											<div class="col">
												<h3>${routine.rouTitle}</h3>
											</div>
											<div class="col d-flex justify-content-end">
												<button type="button" class="btn-close align-self-center"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>

										</div>
										<div class="row d-flex">

											<input type="hidden" name="email"
												value="${sessionScope.login.email}">
											<div style="border-top: 3px #E9D7B6 solid;">
												<div class="row p-2" style="text-align: center;">
													<div class="liststyle-inner  p-2">${routine.rouDetail}</div>
												</div>
												<div class="row p-2" style="text-align: center;">
													<div class="liststyle-inner  p-2">
														(<span id="routineStartReg-${routine.routineNo}">${routine.startRegion}</span>)-
														${routine.startLoc}
													</div>
												</div>
												<div class="row p-2" style="text-align: center;">
													<div class="liststyle-inner  p-2">
														(<span id="routineEndReg-${routine.routineNo}">${routine.endRegion}</span>)-
														${routine.endLoc}
													</div>
												</div>
												<div class="row p-2 column-gap-2"
													style="text-align: center;">
													<div class="col liststyle-inner  p-2">${routine.rouDay}일운행</div>
													<div class="col liststyle-inner  p-2">${routine.totalDis}km</div>
													<div class="col liststyle-inner  p-2">${routine.roundTripYn == 'Y' ? '왕복' : routine.roundTripYn == 'N' ? '편도' : '알 수 없음'}</div>
												</div>
												<div class="row p-2 column-gap-2"
													id="info-${routine.routineNo}" style="text-align: center;">

												</div>
											</div>
											<div>
												<div class="pt-2 my-3"
													style="border-top: 3px #E9D7B6 solid; border-bottom: 3px #E9D7B6 solid;">
													<div class="p-2" id="routine-info-${routine.routineNo}"></div>
												</div>

												<div class="row px-1">
													<div class="px-0 mx-1">
														<button class="btn btn-primary brd-bot active"
															id="button1-${routine.routineNo}">정보1</button>
														<button class="btn btn-warning brd-bot"
															id="button2-${routine.routineNo}">정보2</button>
													</div>
													<div class="changeinfo mb-3"
														id="infomaition1-${routine.routineNo}">
														<div class="mt-3"
															id="progress-chart-eff-${routine.routineNo}"></div>
														<div
															style="color: #976200; text-align: center; font-weight: 1000;"
															id="total-dis-${routine.routineNo}"></div>
														<div id="progress-chart-co2-${routine.routineNo}"></div>
														<div
															style="color: #976200; text-align: center; font-weight: 1000"
															id="total-co2-${routine.routineNo}"></div>
														<div id="progress-chart-charge-${routine.routineNo}"></div>
														<div
															style="color: #976200; text-align: center; font-weight: 1000"
															id="total-price-${routine.routineNo}"></div>
													<div class="row mx-1 mb-2">
														<button class="btn btn-warning"
															style="color: white;"
															onclick="location.href='${pageContext.request.contextPath}/routineDetailRewrite?routineNo=${routine.routineNo}'">수정</button>
														<!-- 모달 삭제 -->
													</div>
													<div class="row mx-1 mb-2">
														<button class="btn btn-danger"
															style="color: white;"
															onclick="deleteRoutine(${routine.routineNo})">삭제</button>
													</div>
													</div>

													<div class="changeinfo mb-3"
														id="infomaition2-${routine.routineNo}"
														style="display: none; text-align: center;">
														<div class="row mb-3">
															<div class="container">


																<p id="result-${routine.routineNo}"></p>
																<div class="map-container">
																	<div id="map-${routine.routineNo}"
																		style="width: 100%; height: 100%;"></div>
																</div>
																<div id="charging-stations-${routine.routineNo}">
																	<div class="station-size mt-4 overflow-y-auto "
																		id="station-list-${routine.routineNo}"></div>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<form id="predictionForm-${routine.routineNo}">
																<label>내연기관 유가정보</label> <select
																	class="form-select mb-2"
																	id="charge_type-${routine.routineNo}">
																	<option value="">연료</option>
																	<option value="보통 휘발유">보통 휘발유</option>
																	<option value="고급 휘발유">고급 휘발유</option>
																	<option value="LPG">LPG</option>
																	<option value="경유">경유</option>
																</select> <select class="form-select"
																	id="prediction_type-${routine.routineNo}">
																	<option value="">예측 기간</option>
																	<option value="1_month">한달</option>
																	<option value="6_months">6개월</option>
																	<option value="12_months">1년</option>
																</select>
															</form>
														</div>
														<div class="row mx-1 mb-3 gap-3">
															<div class="col">
																<div id="predictionResult-${routine.routineNo}"></div>
															</div>
															<div class="col">

																<div class="rrrrresult-${routine.routineNo}">
																	<div class="row mb-2"
																		id="run-info-elec-name-${routine.routineNo}"></div>
																	<div class="row mb-2"
																		id="run-info-elec-member-${routine.routineNo}"></div>
																	<div class="row mb-2"
																		id="run-info-elec-nonmember-${routine.routineNo}"></div>
																</div>
															</div>

														</div>

														<div class="row mb-3">
															<div class="col">
																<input class="form-control"
																	id="average-${routine.routineNo}" readonly>
															</div>
															<div class="col">
																<input class="form-control"
																	id="elec-${routine.routineNo}" readonly>
															</div>
															
														</div>
														<div class="row mx-1 mb-3">
																<button class="btn btn-primary"
																id="culculprice-${routine.routineNo}">계산</button>
															
														</div>
														
														
														

														<div class="row  mx-1 mb-3">
															<div id="progress-routine-${routine.routineNo}"></div>
															<div id="progress-routine-text-${routine.routineNo}"></div>
														</div>

														<div class="row  mx-1 mb-3 gap-3" >
															<div class="col" style="font-weight:1000;" id="minus-price-${routine.routineNo}"></div>
														</div>
														<div class="row  mx-1 mb-3 gap-3">
															<div class="col fs-3" style="font-weight:1000; color:#9EF048;" id="howto-${routine.routineNo}"></div>
														</div>
													<div class="row mx-1 mb-2">
														<button class="btn btn-warning "
															style="color: white;"
															onclick="location.href='${pageContext.request.contextPath}/routineDetailRewrite?routineNo=${routine.routineNo}'">수정</button>
														<!-- 모달 삭제 -->
													</div>
													<div class="row mx-1">
														<button class="btn btn-danger mb-2"
															style="color: white;"
															onclick="deleteRoutine(${routine.routineNo})">삭제</button>
													</div>
													
													</div>
													
												</div>


											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</c:if>

				<c:if test="${empty routineList}">
					<li class="liststyle fs-4 my-2 p-2"><span>루틴이없습니다</span></li>
				</c:if>

			</div>

		</div>
	</div>

	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->

	<!-- 모달 삭제 script -->

	<script>
	
	function deleteRoutine(routineNo) {
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        var email = '${sessionScope.login.email}';  // 로그인한 사용자의 이메일

	        // AJAX 요청
	        $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/routinedeleteDo/" + routineNo,
	            data: { email: email },  // 이메일을 파라미터로 전송
	            success: function (response) {
	                if (response === "Routine deleted successfully using POST.") {
	                    alert("루틴이 삭제되었습니다.");
	                    window.location.reload();
	                    // DOM에서 삭제
	                    document.getElementById(`exampleModal${routineNo}`).remove(); // 모달 삭제
	                    const routineElement = document.querySelector(`[data-bs-target="#exampleModal${routineNo}"]`);
	                    if (routineElement) {
	                        routineElement.parentElement.remove(); // 리스트 삭제
	                    }
	                } else {
	                    alert("삭제 중 오류가 발생했습니다.");
	                }
	            },
	            error: function () {
	                alert("서버 요청 중 오류가 발생했습니다.");
	            }
	        });
	    }
	}
	
	// 포로그레스 바 스클립트
	  function createProgressBar(containerId, LMax, RMax, leftValue, rightValue, text) {

	  var progressMain = document.getElementById(containerId);
	  
	  progressMain.innerHTML = '<div class="d-flex justify-content-center">' +
	                            '<h5 class="headfont center">'+ text +'</h5>' +
	                            '</div>' +
	                            '<div class="row">' +
	                            '<div class="col">' +
	                            '<div class="progress-container justify-content-end" id="left-container'+containerId+'">' +
	                            '</div>' +
	                            '</div>' +
	                            '<div class="col">' +
	                            '<div class="progress-container justify-content-start" id="right-container'+containerId+'">' +
	                            '</div>' +
	                            '</div>' +
	                            '</div>';

	  var leftContainer = document.getElementById("left-container" + containerId);
	  var rightContainer = document.getElementById("right-container" + containerId);

	  // 좌측, 우측 프로그래스 바 추가
	  leftContainer.innerHTML = '<div class="progress-bar left-progress" id="left-progress' + containerId + '" data-value="' + leftValue + '"></div><div class="tips" id="tips-left' + containerId + '"></div>';
	  rightContainer.innerHTML = '<div class="progress-bar right-progress" id="right-progress' + containerId + '" data-value="' + rightValue + '"></div><div class="tips" id="tips-right' + containerId + '"></div>';

	  // 새로 추가된 요소 가져오기
	  var leftProgressBar = document.getElementById("left-progress" + containerId);
	  var rightProgressBar = document.getElementById("right-progress" + containerId);

	  // 프로그래스 바의 너비 설정
	  leftProgressBar.style.width = (leftValue / LMax) * 100 + "%";
	  rightProgressBar.style.width = (rightValue / RMax) * 100 + "%";

	  var tipsLeft = document.getElementById("tips-left" + containerId);
	  var tipsRight = document.getElementById("tips-right" + containerId);

	  // 툴팁 표시 함수
	  function showTooltip(event, tips, value, isReversed = false) {
	    var containerRect = event.target.parentElement.getBoundingClientRect();
	    tips.style.display = "block";
	    tips.textContent = value;

	    // 위치 계산
	    var tooltipX = isReversed
	      ? containerRect.right - event.clientX // 오른쪽부터 채워지는 경우
	      : event.clientX - containerRect.left;

	    tips.style.left = tooltipX + "px";
	    tips.style.top = "-40px";
	  }

	  // 툴팁 숨기기 함수
	  function hideTooltip(tips) {
	    tips.style.display = "none";
	  }

	  // 좌측 프로그래스 바 이벤트
	  leftProgressBar.addEventListener("mousemove", function (event) {
	    showTooltip(event, tipsLeft, leftProgressBar.getAttribute("data-value"));
	  });

	  leftProgressBar.addEventListener("mouseleave", function () {
	    hideTooltip(tipsLeft);
	  });

	  // 우측 프로그래스 바 이벤트
	  rightProgressBar.addEventListener("mousemove", function (event) {
	    showTooltip(event, tipsRight, rightProgressBar.getAttribute("data-value"));
	  });

	  rightProgressBar.addEventListener("mouseleave", function () {
	    hideTooltip(tipsRight);
	  });
	}
	</script>
	<!-- 루틴 충전소 리스트 js -->
	<script>
	
	const chargingStations = [
        <c:forEach var="station" items="${StationList}" varStatus="status">
            {
                "id": "${station.id}",  
                "name": "${station.name}", 
                "lat": ${station.frontLat},  // 숫자 값
                "lon": ${station.frontLon},   // 숫자 값
                "isFast": "${station.isFast}",
                "priceForMember": ${station.priceForMember},
                "priceForNonMember": ${station.priceForNonMember},
                "update": "${station.updateDt}"
            }
            <c:if test="${status.last}"></c:if>
            <c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
	
	
	
	

document.addEventListener("DOMContentLoaded", function () {
	
	
	 // 버튼1 클릭 시 첫 번째 div 보이게 하고, 두 번째 div는 숨기기
    
    // 루틴 목록을 순회하며 각 차량의 정보 출력
    
    
   
   
    <c:forEach var="routine" items="${routineList}">
        <c:forEach var="gascar" items="${GascarList}">
            <c:if test="${routine.routineNo == gascar.routineNo && routine.gasCar == gascar.carName}">
            	var gasCarImg = '${gascar.carImg}';
            	var gasCarEff = Math.round(parseFloat('${gascar.carEff}') * 100) / 100; // 내연기관 차의 연비 (소수점 2자리 반올림)
            	var gasCarCo2 = parseFloat('${gascar.carCo2}') * 10; // 내연기관 차의 탄소배출량 (소수점 2자리 반올림)
                var gasCarBrand = '${gascar.carBrand}'; // 내연기관 차의 브랜드
                var gasCarName = '${gascar.carName}'; // 내연기관 차의 이름
                var gasCarCate = '${gascar.carCate}'; // 내연기관 차의 종류
                var gasCarPrice = '${gascar.carprice}'; // 내연기관차 가격
                var gasCarCateDetail = '${gascar.carCateDetail}'; // 내연기관 차의 상세 종류
            </c:if>
        </c:forEach>
      
        <c:forEach var="eleccar" items="${EleccarList}">
            <c:if test="${routine.routineNo == eleccar.routineNo && routine.eleCar == eleccar.carname}">
            	var eleCarImg = '${eleccar.imgUrl}';
            	var eleCarMpge = Math.round(parseFloat('${eleccar.carMpge}') * 100) / 100; // 내연기관 차의 연비 (소수점 2자리 반올림)
            	var eleCarEff = Math.round(parseFloat(eleCarMpge * 8.8 *0.85) * 100) / 100; // 내연기관 차의 연비 (소수점 2자리 반올림)
            	var eleCarCo2 = parseFloat('${eleccar.carCo2}') * 10; // 전기차의 탄소배출량 (소수점 2자리 반올림)
                var eleCarBrand = '${eleccar.carbrand}'; // 전기차 브랜드
                var eleCarName = '${eleccar.carname}'; // 전기차 이름
                var eleCarPrice = '${eleccar.carprice}'; // 전기차 가격
                var eleCarCate = '${eleccar.carcate}'; // 전기차 종류
                var eleCarCateDetail = '${eleccar.carcatedetail}'; // 전기차 상세 종류

                // 연비와 탄소배출량의 차이를 계산
                var efficiencyDifference =  Math.round(Math.abs(gasCarEff - eleCarEff)* 100) / 100;
                var totalgasCarCo2 = Math.round(gasCarCo2 * '${routine.totalDis}' * '${routine.rouDay}' * 100) / 100;
                var totaleleCarCo2 = Math.round(eleCarCo2 * '${routine.totalDis}' * '${routine.rouDay}' * 100) / 100;
                var co2Difference = Math.round(Math.abs(gasCarCo2 - eleCarCo2)* 100) / 100;
                var gastotalco2 = Math.round(gasCarCo2 * efficiencyDifference * '${routine.rouDay}');
                var electotalco2 = Math.round(eleCarCo2 * efficiencyDifference * '${routine.rouDay}');
                var totalDis = Math.round('${routine.totalDis}' * '${routine.rouDay}'* 100) / 100;
                var totalco2Dis = Math.round(('${routine.totalDis}' * co2Difference) * '${routine.rouDay}'* 100) / 100;
                var minCareff = '${maxData.minCareff}';
                var maxCareff = '${maxData.maxCareff}';
                var maxCarCO2 = '${maxData.maxCarCO2}'/100;
                var maxtotlaCarCO2 = Math.round(maxCarCO2 * '${routine.totalDis}' * '${routine.rouDay}' * 100) / 100;
                
                </c:if>
                </c:forEach> 
                
                <c:forEach var="oilPrice" items="${OilPirceList}">
                <c:if test="${routine.routineNo == oilPrice.routineNo && routine.startRegion == oilPrice.region}"> 
                    var opDate = '${oilPrice.stdate}';
                    var opReg = '${oilPrice.region}';
                    var opLpg = '${oilPrice.lpg}';
                    var opDisel = '${oilPrice.diesel}';
                    var opPreGas = '${oilPrice.preGasoline}';
                    var opRegGas = '${oilPrice.regGasoline}';
                    console.log(opDate);
                </c:if>
            </c:forEach>
            console.log(opDate,opReg,opLpg,opDisel,opPreGas,opRegGas);
            
            
                // 충전 / 주유비 하드코딩
                var oilprice =  1650;
                var chargeprice = 335;
                var totaloilprice = Math.round((totalDis / gasCarEff)  * oilprice);
                var totalchargeprice = Math.round((totalDis / eleCarEff) * chargeprice);
                var totalmaxoilprice = Math.round((totalDis / minCareff ) * oilprice)
             	// 만약 roundTripYn이 Y라면 값 두 배로 계산
                if ('${routine.roundTripYn}' === 'Y') {
                	maxtotlaCarCO2 *= 2;
                	totalgasCarCo2 *= 2;
                	totaleleCarCo2 *= 2;
                	totalDis *= 2;
                    totalco2Dis *= 2;
                    totaloilprice *= 2;
                    totalchargeprice *= 2;
                    totalmaxoilprice *= 2;
                }
                
                var totaldistanceEL = document.getElementById('info-${routine.routineNo}');
                totaldistanceEL.innerHTML +=
                	'<div class="col liststyle-inner p-2" >총 운행거리 :<span id="totalDistance-${routine.routineNo}">'+ totalDis + '</span>km</div>';
                // 해당 값을 HTML로 출력
                var routineElement = document.getElementById('routine-info-${routine.routineNo}');
                routineElement.innerHTML += 
                	'<div class="row d-flex align-items-center">' +
	                    '<div class="col img-container">' +
		                    '<img class="img-size" src="' + gasCarImg + '">' +
		                '</div>' +
		                '<div class="col img-container">' +
		                    '<img class="img-size" src="/assets/img/elec_car_img/' + eleCarImg + '">' +
	                    '</div>' +
                    '</div>' +
                    '<div class="row mt-2" style="color:#604616; font-weight:1000;">' +
                        '<div class="col">' +  '<p>' + gasCarName  + '</p>' + '</div>' +
                        '<div class="col">' +  '<p>' + eleCarName  + '</p>' + '</div>' +
                    '</div>' +   
                    
                    '<div class="row" style="color:#976200; font-weight:1000;">' +
	                    '<div class="col">' + '<p>~<span id="gascarprice-${routine.routineNo}">' + gasCarPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span>원</p>' + '</div>' +
	                    '<div class="col">' + '<p>~<span id="eleccarprice-${routine.routineNo}">' + eleCarPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')  + '</span>원</p>' + '</div>' +
                	'</div>' +   

                    '<div class="row" style="color:#372504; font-weight:1000;">' +
	                    '<div class="col">' + '<p>' + gasCarBrand + '</p>' + '</div>' +
	                    '<div class="col">' + '<p>' + eleCarBrand + '</p>' + '</div>' +
                	'</div>' +
                    '<div class="row" style="color:#372504; font-weight:1000;">' +
	                    '<div class="col">' + '<p>' + gasCarCate + ' (' + gasCarCateDetail + ')</p>' + '</div>' +
	                    '<div class="col">' + '<p>' + eleCarCate + ' (' + eleCarCateDetail + ')</p>' + '</div>' +
                    '</div>';
                    
                    var totalcount1 = document.getElementById('total-dis-${routine.routineNo}');
                    totalcount1.innerHTML += 
                    '<div class="row" style="color:#372504">' +
	                    '<div class="col">' + '<p><span id="gaseff-${routine.routineNo}">' + gasCarEff + '</span> km/L</p> ' + '</div>' +
	                    '<div class="col minus-font">' + '<span class=" minus-font before"> (-) </span> <span>' + Math.round(Math.abs(gasCarEff-eleCarEff) * 100) / 100 + '</span> <span class="minus-font after"> (+) </span>' + '</div>' +
	                    '<div class="col">' + '<p><span id="eleceff-${routine.routineNo}">' + eleCarEff + '</span> km/L</p> ' + '</div>' +
                    '</div>';
                    
                    
                    var totalcount2 = document.getElementById('total-co2-${routine.routineNo}');
                    totalcount2.innerHTML += 
                    '<div class="row" style="color:#372504">' + 
                    '<div class="col">' + '<p>' + totalgasCarCo2 + 'g/km </p>' + '</div>' +
                    '<div class="col minus-font">' + '<span class=" minus-font before"> (+) </span> <span>' + Math.round(Math.abs(totalgasCarCo2-totaleleCarCo2) * 100) / 100 + '</span> <span class="minus-font after"> (-) </span>' + '</div>' +
                    '<div class="col">' + '<p>' + totaleleCarCo2 + 'g/km</p>' + '</div>' +
                    '</div>';
                    
                    
                    var totalcount3 = document.getElementById('total-price-${routine.routineNo}');	
                    totalcount3.innerHTML += 
                    '<div class="row" style="color:#372504">' +
                    '<div class="col">' + '<p> ' + totaloilprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원 </p>' + '</div>' +
                    '<div class="col minus-font">' + '<span class=" minus-font before"> (+) </span> <span>' + (Math.round(Math.abs(totaloilprice-totalchargeprice) * 100) / 100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span> <span class="minus-font after"> (-) </span> '+ '</div>' +
                    '<div class="col">' + '<p> ' + totalchargeprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원</p>' + '</div>' +
                	'</div>';
                

                        
                //프로그레스 바 만들기//
               createProgressBar(
			      containerIdcontainerId ="progress-chart-eff-${routine.routineNo}", 
			      LMax = Math.round((gasCarEff+eleCarEff)*100)/100, 
			      RMax = Math.round((gasCarEff+eleCarEff)*100)/100, 
			      leftValue =  gasCarEff , 
			      rightValue = eleCarEff, 
			      text = '연비'
      			);
              createProgressBar(
    		       containerIdcontainerId ="progress-chart-co2-${routine.routineNo}", 
    		       LMax = Math.round((totalgasCarCo2+totaleleCarCo2)*100)/100, 
    		       RMax = Math.round((totalgasCarCo2+totaleleCarCo2)*100)/100, 
    		       leftValue =  totalgasCarCo2 , 
    		       rightValue = totaleleCarCo2, 
    		       text = '탄소배출'
          		);
              createProgressBar(
    		        containerIdcontainerId ="progress-chart-charge-${routine.routineNo}", 
    		        LMax = Math.round((totaloilprice+totalchargeprice)*100)/100, 
    		        RMax = Math.round((totaloilprice+totalchargeprice)*100)/100, 
    		        leftValue = totaloilprice , 
    		        rightValue = totalchargeprice, 
    		        text = '주유/충전비'
          		);
              
              document.getElementById('button1-${routine.routineNo}').addEventListener('click', function() {
            	    document.getElementById('infomaition1-${routine.routineNo}').style.display = 'block';  // 첫 번째 div 보이기
            	    document.getElementById('infomaition2-${routine.routineNo}').style.display = 'none';  // 두 번째 div 숨기기
            	    
            	    // 눌린 상태로 클래스 추가
            	    document.getElementById('button1-${routine.routineNo}').classList.add('active');
            	    document.getElementById('button2-${routine.routineNo}').classList.remove('active');
            	});

            	// 버튼2 클릭 시 두 번째 div 보이게 하고, 첫 번째 div는 숨기기
            	document.getElementById('button2-${routine.routineNo}').addEventListener('click', function() {
            	    document.getElementById('infomaition2-${routine.routineNo}').style.display = 'block';  // 두 번째 div 보이기
            	    document.getElementById('infomaition1-${routine.routineNo}').style.display = 'none';    // 첫 번째 div 숨기기 (이 부분이 추가됨)
            	    
            	    // 눌린 상태로 클래스 추가
            	    document.getElementById('button2-${routine.routineNo}').classList.add('active');
            	    document.getElementById('button1-${routine.routineNo}').classList.remove('active');
            	});
			
            	
        

          		document.getElementById("button2-${routine.routineNo}").addEventListener("click", () => {
          			var mapId = "map-${routine.routineNo}"; // 예시: map-1 ID로 지도 초기화
          			var mainlist = '${routine.routineNo}';
          	        initializeMap(mapId); // 지도 한 번만 초기화
          	        drawRoute("${routine.startLoc}", "${routine.endLoc}", mapId, "station-list-${routine.routineNo}",mainlist);
          	    });
          		
          	
          		
          		
          		
          	// 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
          		var onemonth = 4.34;
          		var sixmonth = 26;
          		var oneyear = 52;

          		// 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
          
          		// '계산' 버튼 클릭 시 처리하는 함수
          		// 'average'와 'elec' input 필드에 input 이벤트 리스너 추가

          		document.getElementById('culculprice-${routine.routineNo}').addEventListener('click', function () {
          		    // 필요한 값 가져오기
			 		const totalDistance = parseFloat(document.getElementById('totalDistance-${routine.routineNo}').innerText); // 총 운행거리
			        const gaseff = parseFloat(document.getElementById('gaseff-${routine.routineNo}').innerText); // 내연기관 연비
			        const eleceff = parseFloat(document.getElementById('eleceff-${routine.routineNo}').innerText); // 전기차 연비
          		    var average = parseFloat(document.getElementById('average-${routine.routineNo}').value); // 평균 연료 가격
          		    var elec = parseFloat(document.getElementById('elec-${routine.routineNo}').value); // 전기차 충전 비용
          		    var predictionType = document.getElementById('prediction_type-${routine.routineNo}').value; // 선택된 예측 기간
          		    console.log(totalDistance,gaseff,eleceff,average,elec)

          		    // 유효성 검사
          		    if (isNaN(totalDistance) || isNaN(gaseff) || isNaN(eleceff) || isNaN(average) || isNaN(elec)) {
          		        alert('모든 값을 입력하거나 선택해주세요!');
          		        return;
          		    }

          		    // 선택된 예측 기간에 따라 기간 값을 설정
          		    let multiplier = 1;
          		    if (predictionType === '1_month') {
          		        multiplier = onemonth;
          		    } else if (predictionType === '6_months') {
          		        multiplier = sixmonth;
          		    } else if (predictionType === '12_months') {
          		        multiplier = oneyear;
          		    }

          		    // 계산
          		    var gascarprice = parseFloat(document.getElementById('gascarprice-${routine.routineNo}').innerText.replace(/,/g, ''));
          		    var eleccarprice = parseFloat(document.getElementById('eleccarprice-${routine.routineNo}').innerText.replace(/,/g, ''));
          		    var gastotal = (totalDistance / gaseff) * average * multiplier; // 내연기관 연료비
          		    var electotal = (totalDistance / eleceff) * elec * multiplier;  // 전기차 연료비
          		    var minustotal = (gastotal-electotal)

          		    console.log(gascarprice,eleccarprice,gastotal,electotal,minustotal);
          		  var howto;
          		  if (eleccarprice >= gascarprice) {
          		      var minusprice = eleccarprice - gascarprice;
          		      document.getElementById('minus-price-${routine.routineNo}').innerHTML = '두 차량의 가격 차이는 ' + minusprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+ '원';
          		    document.getElementById('minus-price-${routine.routineNo}').style.color = "#50B0FF";
          		      // 선택된 predictionType에 따라 howto 계산
          		      if (predictionType === '1_month') {
          		          howto = (minusprice / minustotal) / 12;
          		      } else if (predictionType === '6_months') {
          		          howto = (minusprice / minustotal) / 2;
          		      } else if (predictionType === '12_months') {
          		          howto = minusprice / minustotal;
          		      }
          		      document.getElementById('howto-${routine.routineNo}').innerHTML = '차량 가격 회복까지 ' + howto.toFixed(2) + ' 년';
          		  } else {
          		      document.getElementById('minus-price-${routine.routineNo}').innerHTML = "'내연기관 차량'의 가격이 더 높습니다.";
          		    document.getElementById('minus-price-${routine.routineNo}').style.color="#FF4B5D";
          		    
          		  }

          		  // 결과 표시
          		  createProgressBar(
			      containerIdcontainerId ="progress-routine-${routine.routineNo}", 
			      LMax = Math.round(gastotal+electotal), 
			      RMax = Math.round(gastotal+electotal), 
			      leftValue =  Math.round(gastotal), 
			      rightValue = Math.round(electotal), 
			      text = '주유 / 충전비'
      			  );
          		  
          		 var progressRoutine = document.getElementById('progress-routine-text-${routine.routineNo}');
          		 progressRoutine.innerHTML = 
                 '<div class="row" style="font-weight:1000; color:#372504">' +
	                    '<div class="col">' + '<p><span id="gaseff-${routine.routineNo}">' + Math.round(gastotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span> 원</p> ' + '</div>' +
	                    '<div class="col minus-font">' + '<span class=" minus-font before"> (-) </span> <span>' + Math.round(minustotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span> <span class="minus-font after"> (+) </span>' + '</div>' +
	                    '<div class="col">' + '<p><span id="eleceff-${routine.routineNo}">' + Math.round(electotal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span> 원</p> ' + '</div>' +
                 '</div>';
                 

          		});	

          		    // 예측 기간을 한국어 문자열로 변환
          		    function getPredictionLabel(predictionType) {
          		        switch (predictionType) {
          		            case '1_month':
          		                return '한달';
          		            case '6_months':
          		                return '6개월';
          		            case '12_months':
          		                return '1년';
          		            default:
          		                return predictionType;
          		        }
          		    }

          		    // 예측 결과를 가져오고 페이지 새로고침 없이 결과를 화면에 표시
          		  // charge_type 셀렉트 박스에 change 이벤트 추가
document.getElementById("charge_type-${routine.routineNo}").addEventListener('change', function() {
    // 선택된 값을 가져오기
    var chargeType = this.value; // 이 셀렉트 박스에서 선택된 값
    var predictionType = document.getElementById("prediction_type-${routine.routineNo}").value;

    // charge_type과 prediction_type 둘 다 선택된 경우에만 실행
    if (!chargeType || !predictionType) {
        return; // 값이 하나라도 선택되지 않았다면 실행하지 않음
    }

    var modelType = 'Transformer';
    var region1 = document.getElementById(`routineStartReg-${routine.routineNo}`).innerText;
    var region2 = document.getElementById(`routineEndReg-${routine.routineNo}`).innerText;

    var requestData1 = {
        model_type: modelType,
        region: region1,
        charge_type: chargeType
    };
    var requestData2 = {
        model_type: modelType,
        region: region2,
        charge_type: chargeType
    };

    // 예측 요청을 보내고 결과를 처리
    Promise.all([
        fetch('http://192.168.0.86:5000/predict', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData1)
        }).then(response => response.json()),
        fetch('http://192.168.0.86:5000/predict', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData2)
        }).then(response => response.json())
    ])
    .then(([data1, data2]) => {
        // 예측 결과 표시
        if (data1.error || data2.error) {
            document.getElementById(`predictionResult-${routine.routineNo}`).innerText = "Error:" + (data1.error || data2.error);
        } else {
            var region1Prediction = data1.predictions[predictionType];
            var region2Prediction = data2.predictions[predictionType];
            var avgPrediction = (region1Prediction + region2Prediction) / 2;
            var predictionLabel = getPredictionLabel(predictionType);
            document.getElementById('predictionResult-${routine.routineNo}').innerHTML = 
            	"<div class='row mb-2'>"+
                "<div class='col py-2 liststyle-inner'><span>연료 정보</span><br><span>" + data1.charge_type + "</span></div>" +
            "</div>"+
            "<div class='row mb-2'>" +
                "<div class='col py-2 liststyle-inner'>"+
                "<span>" + region1 + " ~ " + region2 + "</span>" +
              "</div>" +
           "</div>"+
           " <div class='row mb-2'>"+
                "<div class='col py-2 liststyle-inner'>"+
                "<span>" + avgPrediction + "원</span>" +
                "</div>" +
            "</div>";
               // 평균값을 <input id="average">에 표시
               console.log(modelType,region1,region2,chargeType,predictionType);
             document.getElementById('average-${routine.routineNo}').value = avgPrediction.toFixed(2);
        }
    });
});

// prediction_type 셀렉트 박스에 change 이벤트 추가 (선택 값이 변경될 때 실행)
document.getElementById("prediction_type-${routine.routineNo}").addEventListener('change', function() {
    // 선택된 값을 가져오기
    var chargeType = document.getElementById("charge_type-${routine.routineNo}").value;
    var predictionType = this.value;

    // charge_type과 prediction_type 둘 다 선택된 경우에만 실행
    if (!chargeType || !predictionType) {
        return;
    }

    var modelType = 'Transformer';
    var region1 = document.getElementById('routineStartReg-${routine.routineNo}').innerText;
    var region2 = document.getElementById('routineEndReg-${routine.routineNo}').innerText;

    if (region1 === '세종시') {
        region1 = '세종';
        document.getElementById('routineEndReg-${routine.routineNo}').innerText = region1;
    }
    
    if (region2 === '세종시') {
        region2 = '세종';
        document.getElementById('routineEndReg-${routine.routineNo}').innerText = region1;
    }
    
    
    var requestData1 = {
        model_type: modelType,
        region: region1,
        charge_type: chargeType
    };
    var requestData2 = {
        model_type: modelType,
        region: region2,
        charge_type: chargeType
    };

    // 예측 요청을 보내고 결과를 처리
    Promise.all([
        fetch('http://192.168.0.86:5000/predict', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData1)
        }).then(response => response.json()),
        fetch('http://192.168.0.86:5000/predict', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData2)
        }).then(response => response.json())
    ])
    .then(([data1, data2]) => {
        // 예측 결과 표시
        if (data1.error || data2.error) {
            document.getElementById(`predictionResult-${routine.routineNo}`).innerText = "Error:" + (data1.error || data2.error);
        } else {
            var region1Prediction = data1.predictions[predictionType];
            var region2Prediction = data2.predictions[predictionType];
            var avgPrediction = (region1Prediction + region2Prediction) / 2;
            var predictionLabel = getPredictionLabel(predictionType);
            document.getElementById('predictionResult-${routine.routineNo}').innerHTML = 
              	"<div class='row mb-2'>"+
                      "<div class='col py-2 liststyle-inner'><span>연료 정보</span><br><span>" + data1.charge_type + "</span></div>" +
                  "</div>"+
                  "<div class='row mb-2'>" +
                      "<div class='col py-2 liststyle-inner'>"+
                      "<span>" + region1 + " ~ " + region2 + "</span>" +
                    "</div>" +
                 "</div>"+
                 " <div class='row mb-2'>"+
                      "<div class='col py-2 liststyle-inner'>"+
                      "<span>" + avgPrediction + "원</span>" +
                      "</div>" +
                  "</div>";
               // 평균값을 <input id="average">에 표시
               console.log(modelType,region1,region2,chargeType,predictionType);
             document.getElementById('average-${routine.routineNo}').value = avgPrediction.toFixed(2);
        }
    });
});   		     
          		//충전소 필터링 및 리스트 출력
          		//경로 계산 및 표시 함수
  
          		
          		
          		
          		
          		
          		
          		
          		
          		
          		
          	
	

    </c:forEach>
          		
          		
          		
   

});
              
            

</script>





</body>

</html>


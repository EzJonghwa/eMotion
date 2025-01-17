<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src='/resources/js/tmapapi.js'></script>
<title>Routine</title>
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
	<link rel="stylesheet" href="/resources/css/headerFooter.css">
<style>


    .btn-primary {
	font-weight:1000;
	background-color: #50B0FF;
	border: none;
  }
  .btn-danger{
    font-weight:1000;
    background-color :#FF4B5D;
    border: none;
  }
  .btn-warning{
    font-weight:1000;
    background-color :#FFD52D;
    border: none;
  }
  .btn-danger:hover{
    background-color :#fa1b31;
  }
  .btn-warning:hover{
    background-color :#facb0c;
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

.cont:-webkit-scrollbar {
	display: none;
}

.carcard{
height:14vh;
}

.carcard::-webkit-scrollbar {
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
	background-color: #E9D7B6;
	border-radius: 10px;
	color: #604616; cursor : pointer;
	transition-duration: 0.2s;
	font-weight: 1000;
	cursor: pointer;
}
	
.liststyle:hover {
	transform: scale(0.99);
}
.carlist {
	max-height: 200px;
	/* 최대 높이 설정 */
	overflow-y: auto;
	/* 스크롤 추가 */
	background-color: white;
	/* 리스트 배경색 */
	position: absolute;
	/* 위치 고정 */
	top: 100%;
	/* 인풋창 바로 아래에 표시 */
	left: 0;
	/* 부모의 왼쪽에 맞춤 */
	width: 100%;
	/* 부모의 너비에 맞춤 */
	border: 1px solid #ccc;
	/* 테두리 추가 */
	z-index: 1050;
	/* 다른 요소 위에 표시 */
	border-radius: 0.25rem;
	/* 둥근 테두리 */
	display: none;
	/* 기본적으로 숨김 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	/* 그림자 추가 */
}

.list-click {
	cursor: pointer;
}

.autocomplete-results {
	list-style-type: none;
	margin: 0;
	padding: 0;
	border: 1px solid #ccc;
	background-color: white;
	max-height: 200px;
	overflow-y: auto;
	position: absolute;
	z-index: 1000;
}

.autocomplete-item {
	padding: 10px;
	cursor: pointer;
}

.autocomplete-item:hover {
	background-color: #f0f0f0;
}
</style>
</head>

<body>
	<script>

       document.addEventListener('DOMContentLoaded', () => {

       
           // 보유 차량 클릭시 input 에 값 넣기
           const userGHaveList = document.querySelectorAll('#userGhavelist'); // 모든 li 요소
           const userEHaveList = document.querySelectorAll('#userEhavelist'); 
           const targetInput1 = document.getElementById('targetInput1'); // input 요소
           const targetInput15 = document.getElementById('targetInput15'); // input 요소
           const userPickList = document.querySelectorAll('#userpicklist'); // 모든 li 요소
           const targetInput2 = document.getElementById('targetInput2'); // input 요소
           // 모든 li 요소에 클릭 이벤트 추가
           userGHaveList.forEach(li => {
               li.addEventListener('click', function () {
                   targetInput1.value = li.textContent.trim(); // 클릭된 li의 텍스트를 input에 설정
               });
           });
           userEHaveList.forEach(li => {
               li.addEventListener('click', function () {
                   targetInput2.value = li.textContent.trim(); // 클릭된 li의 텍스트를 input에 설정
               });
           });
           userPickList.forEach(li => {
               li.addEventListener('click', function () {
                   targetInput2.value = li.textContent.trim();
               });
           });

           const searchInput1 = document.getElementById('searchInput1');  // 첫 번째 입력창
           const searchInput2 = document.getElementById('searchInput2');  // 두 번째 입력창
           const resultList1 = document.getElementById('resultList1');  // 첫 번째 결과 리스트
           const resultList2 = document.getElementById('resultList2');  // 두 번째 결과 리스트
           let selectedType1 = ''; // 첫 번째 차량 유형
           let selectedType2 = ''; // 두 번째 차량 유형
           selectedType1 = 'havegcar'; // 예시로 첫 번째는 "차량 1" 유형
           selectedType2 = 'haveecar'; // 예시로 두 번째는 "차량 2" 유형


           searchInput1.addEventListener('input', async function (event) {
               const keyword = event.target.value.trim();

               if (keyword.length === 0 || selectedType1 === '') {
                   resultList1.style.display = 'none';
                   return;
               }
               try {
                   const response = await fetch('/carSearch?keyword=' + encodeURIComponent(keyword) + '&carType=' + encodeURIComponent(selectedType1));
                   if (!response.ok) throw new Error('요청 실패');
                   const carList = await response.json();

                   resultList1.innerHTML = '';
                   resultList1.style.display = 'block';

                   carList.forEach(function (car) {
                       const li = document.createElement('li');
                       li.className = 'list-group-item list-group-item-action list-click';
                       li.textContent = car.carName;
                       li.dataset.carName = car.carName;

                       // 클릭 이벤트: 선택한 값을 targetInput1에 설정
                       li.addEventListener('click', function () {
                           targetInput1.value = car.carName; // 클릭된 값을 targetInput1에 설정
                           resultList1.style.display = 'none'; // 결과 리스트 숨기기
                           searchInput1.value = '';
                       });

                       resultList1.appendChild(li);
                   });
               } catch (error) {
                   console.error('에러 발생:', error);
                   resultList1.style.display = 'none';
               }
           });

           searchInput2.addEventListener('input', async function (event) {
               const keyword = event.target.value.trim();

               if (keyword.length === 0 || selectedType2 === '') {
                   resultList2.style.display = 'none';
                   return;
               }

               try {
                   const response = await fetch('/carSearch?keyword=' + encodeURIComponent(keyword) + '&carType=' + encodeURIComponent(selectedType2));
                   if (!response.ok) throw new Error('요청 실패');
                   const carList = await response.json();

                   resultList2.innerHTML = '';
                   resultList2.style.display = 'block';

                   carList.forEach(function (car) {
                       const li = document.createElement('li');
                       li.className = 'list-group-item list-group-item-action list-click';
                       li.textContent = car.carName;
                       li.dataset.carName = car.carName;

                       li.addEventListener('click', function () {
                           targetInput2.value = car.carName; // 클릭된 값을 targetInput2에 설정
                           resultList2.style.display = 'none'; // 결과 리스트 숨기기
                           searchInput2.value = '';
                       });

                       resultList2.appendChild(li);
                   });
               } catch (error) {
                   console.error('에러 발생:', error);
                   resultList2.style.display = 'none';
               }
           });

           // 추가버튼 눌렀을때 해당 모달 닫히면서 외부 input 에 값 넣기
           const addButton = document.getElementById('addButton'); // 모달의 버튼
           const externalInput1 = document.getElementById('externalInput1'); // 외부 내연기관 입력창
           const externalInput2 = document.getElementById('externalInput2'); // 외부 전기차 입력창
           // 버튼 클릭 시 실행
           addButton.addEventListener('click', function () {
               // 값이 없는 겨어엉우 경고창 
               if (!targetInput1.value.trim() || !targetInput2.value.trim()) {
                   alert('모든 값을 입력해야 합니다!');
                   return;
               }
               else {
                   // 외부 입력창에 모달 입력값 설정
                   externalInput1.value = targetInput1.value;
                   externalInput2.value = targetInput2.value;

                   // 모달 닫기
                   const modal = bootstrap.Modal.getInstance(document.getElementById('exampleModal'));
                   modal.hide();

               }
           });
           const form = document.querySelector('.routineForm'); // 폼 선택
           form.addEventListener('submit', function (event) {
               // 입력 필드들
               const rouTitle = document.querySelector('input[name="rouTitle"]');
               const rouDetail = document.querySelector('input[name="rouDetail"]');
               const startLoc = document.querySelector('input[name="startLoc"]');
               const endLoc = document.querySelector('input[name="endLoc"]');
               const totalDis = document.querySelector('input[name="totalDis"]');
               const rouDay = document.querySelector('select[name="rouDay"]');
               const gasCar = document.querySelector('input[name="gasCar"]');
               const eleCar = document.querySelector('input[name="eleCar"]');
               const roundTripYn = document.querySelector('select[name="roundTripYn"]'); // 새로 추가된 필드

               // 필수 입력 확인
               if (!rouTitle.value.trim()) {
                   alert("루틴 이름을 입력해주세요.");
                   rouTitle.focus();
                   event.preventDefault();
                   return;
               }
               if (!rouDetail.value.trim()) {
                   alert("루틴 상세를 입력해주세요.");
                   rouDetail.focus();
                   event.preventDefault();
                   return;
               }
               if (!startLoc.value.trim()) {
                   alert("출발지를 입력해주세요.");
                   startLoc.focus();
                   event.preventDefault();
                   return;
               }
               if (!endLoc.value.trim()) {
                   alert("도착지를 입력해주세요.");
                   endLoc.focus();
                   event.preventDefault();
                   return;
               }
               if (!totalDis.value.trim()) {
                   alert("계산된 거리를 입력해주세요.");
                   totalDis.focus();
                   event.preventDefault();
                   return;
               }
               if (!roundTripYn.value || roundTripYn.value === "편도 / 왕복") {
                   alert("편도/왕복 여부를 선택해주세요.");
                   roundTripYn.focus();
                   event.preventDefault();
                   return;
               }
               if (!rouDay.value || rouDay.value === "운행 일수") {
                   alert("일 수를 선택해주세요.");
                   rouDay.focus();
                   event.preventDefault();
                   return;
               }
               if (!gasCar.value.trim()) {
                   alert("내연기관 차종을 선택해주세요.");
                   gasCar.focus();
                   event.preventDefault();
                   return;
               }
               if (!eleCar.value.trim()) {
                   alert("전기차 차종을 선택해주세요.");
                   eleCar.focus();
                   event.preventDefault();
                   return;
               }
               
               // 모든 조건이 만족되면 폼이 제출됨
           });
           
       });
       
 </script>



	<div class="cont overflow-y-auto">

			<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->
		<div class="px-3">
		<form class="routineForm"
			action="${pageContext.request.contextPath}/routineReWriteDo"
			method="post">
			<div class="maincss px-2">

				<input type="hidden" name="email"
					value="${sessionScope.login.email}"> <input type="hidden"
					name="routineNo" value="${routine.routineNo}">

				<!-- 버튼 -->
				<span>루틴 이름 (${sessionScope.login.nickName})</span> <input id="title"
					class="form-control" name="rouTitle" value="${routine.rouTitle}">
				<span>루틴 상세</span> <input type ="hidden" name="startRegion" id="start-region-hidden" value="${routine.startRegion}"></input> 
					<input type ="hidden" name="endRegion" id="end-region-hidden" value="${routine.endRegion}"></input>
				<input class="form-control" name="rouDetail" id="detail"
					value="${routine.rouDetail}"> <label>목적지 선택</label>
				<div class="row p-0 my-2">
					<div class="col position-relative">
						<input type="text" class="form-control" id="start"
							placeholder="출발지" name="startLoc" value="${routine.startLoc}">
						<ul id="start-results" class="autocomplete-results"></ul>
					</div>
					<div class="col position-relative">
						<input type="text" class="form-control" id="end" placeholder="도착지"
							name="endLoc" value="${routine.endLoc}">
						<ul id="end-results" class="autocomplete-results"></ul>
					</div>
					<div class="col-4 m-0 p-0">
						<button type="button" class="btn btn-primary h-100"
							id="calculate-distance">검색</button>
					</div>
				</div>

				<div id="result"></div>
				<label>계산 거리</label>
				<div class="row p-0 my-2 d-flex align-items-center">
					<div class="col">
						<input type="text" id="totaldis" class="form-control"
							placeholder="총 거리" name="totalDis" readonly
							value="${routine.totalDis}">
					</div>
					<div class="col m-0 p-0">
						<span>km</span>
					</div>
				</div>


				<label>운행 일수 (1주일 기준)</label>

				<div class="row p-0 my-2">
				<div class="col position-relative">
				<select class="form-select" aria-label="Default select example"
					name="roundTripYn">
					<option selected>편도 / 왕복</option>
					<option value="N">편도</option>
					<option value="Y">왕복</option>
				</select>
				</div>
				<div class="col position-relative">
				<select class="form-select" aria-label="Default select example"
					name="rouDay">
					<option selected>운행 일수</option>
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
					<option value="6">6일</option>
					<option value="7">7일</option>
				</select>
				</div>
				</div>
				<div class="">
				<button class="btn btn-primary my-2 w-100" type="button"
					data-bs-toggle="modal" data-bs-target="#exampleModal">차종검색</button>
				</div>


				<div class="row my-2">
					<div class="col">
						<input class="form-control" id="externalInput1" placeholder="내연기관"
							name="gasCar" value="${routine.gasCar}" readonly>
					</div>
					<div class="col">
						<input class="form-control" id="externalInput2" placeholder="전기차"
							name="eleCar" value="${routine.eleCar}" readonly>
					</div>
				</div>
				<button type="submit" class="btn btn-warning w-100 responsive-text"
					style="color: white;">수정</button>



			</div>
		</form>

	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content p-4">
				<div class="maincss px-2">
					<div class="row d-flex align-items-start">
						<div class="col">
							<h3>차량 검색</h3>
						</div>
						<div class="col d-flex justify-content-end">
							<button type="button" class="btn-close align-self-center"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="row">		
					<div class="col">
							<button class="btn btn-primary my-2 w-100">내연기관</button>
							<div class="position-relative">
								<input class="form-control" id="searchInput1" placeholder="내연기관">
								<ul id="resultList1" class="list-group carlist"></ul>
							</div>
						</div>
						<div class="col">
							<button class="btn btn-primary my-2 w-100">전기차</button>
							<div class="position-relative">
								<input class="form-control" id="searchInput2" placeholder="전기차">
								<ul id="resultList2" class="list-group carlist"></ul>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col">
							<div>
								보유 내연 차량
								<div class="carcard w-100 overflow-auto" style="list-style: none; padding: 0;">

									<c:forEach var="car" items="${gSaveCarList}">
										<div class="liststyle p-3" id="userGhavelist">${car.carName}</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col">
							<div>
							보유 전기 차량
							<div class="carcard w-100 overflow-auto" style="list-style: none; padding: 0;">

								<c:forEach var="car" items="${eSaveCarList}">
									<div class="liststyle p-3" id="userEhavelist">${car.carName}</div>
								</c:forEach>
							</div>
							</div>	
						</div>
					</div>
					<br>



					<div>
						찜한 차량
						<div class="carcard w-100 overflow-auto" style="list-style: none; padding: 0;">
						<c:forEach var="preper" items="${allAboutPreperCar}">
							<div class="liststyle p-3 my-2" id="userpicklist">${preper.ECarName}</div>
						</c:forEach>
						</div>
					</div>
					<form id="modalForm" onsubmit="return false">
						<div class="row my-2">
							<div class="col">
								내연기관 <input class="form-control" id="targetInput1"
									placeholder="내연기관" readonly>
							</div>
							<div class="col">
								전기차 <input class="form-control" id="targetInput2"
									placeholder="전기차" readonly>
							</div>
						</div>
						<div>
						<button class="btn btn-warning w-100 responsive-text"
							style="color: white;" id="addButton">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</div>
	</div>
		<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->
</body>

</html>
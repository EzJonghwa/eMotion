
<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 16. 
   * 작성자     : 철규, 원빈
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
<title>like car List</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- html2canvas 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->

</head>
<style>
:root { 
	--primary-color: #37a1f8;
	--hover-color: #2196f3;
	--warning-color: #F6B426;
	--danger-color: #FF4B5D;
	--background-color: #f8f9fa;
	--border-color: #ABABAB;
	--text-color: #333;
}

.btn.responsive-text {
    font-size: calc(0.8rem + 0.4vw);
    font-weight: 600;
}


/* Button Styles */
.btn-primary {
	background-color: var(--primary-color);
	border: none;
	padding: 8px 16px;
	border-radius: 8px;
	color: white;
	transition: all 0.3s ease;
}

.btn-primary:hover {
	background-color: var(--hover-color);
	transform: translateY(-2px);
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
.responsive-tabletext{
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
    font-size: calc(1.5rem + 0.5vw);
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

.brd {
    border-radius: 15px;
    box-shadow: 0 5px 8px rgba(57, 57, 57, 0.16), 0 5px 8px rgba(57, 57, 57, 0.16);
}

.container-sm{
    height: 100%;
}

::-webkit-scrollbar {
    display: none;
}
.hidden{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
    
/* maingrid 설정 */
.maingrid {
  display: flex;
  flex-direction: column;
  height: 100%; /* 부모 높이에 맞추기 */
  max-height: 100vh; /* 화면 전체 높이를 넘어가지 않도록 제한 */
  overflow: hidden; /* 자식 콘텐츠가 넘치지 않도록 제한 */
  position: relative;
  background-color: white;
  border-radius: 15px;
  box-shadow: 0 5px 8px rgba(57, 57, 57, 0.16);
}

/* 테이블 컨테이너에 스크롤 추가 */
.table-wrapper {
  flex-grow: 1; /* 부모의 남은 공간 채우기 */
  max-height: 100%; /* maingrid의 높이에 맞춤 */
  overflow-y: auto; /* 가로 스크롤 활성화 */
  padding: 10px;
}
    
#resultList {
  max-height: 200px; /* 최대 높이 설정 */
  overflow-y: auto; /* 스크롤 추가 */
  background-color: white; /* 리스트 배경색 */
  position: absolute; /* 위치 고정 */
  top: 100%; /* 인풋창 바로 아래에 표시 */
  left: 0; /* 부모의 왼쪽에 맞춤 */
  width: 100%; /* 부모의 너비에 맞춤 */
  border: 1px solid #ccc; /* 테두리 추가 */
  z-index: 1050; /* 다른 요소 위에 표시 */
  border-radius: 0.25rem; /* 둥근 테두리 */
  display: none; /* 기본적으로 숨김 */
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}      
    
.like-icon-up {
    top: 15px;
    left: 15px;
    width: 24px;
    height: 24px;
    position: absolute;
    z-index: 1;
    cursor: pointer;
    transition: fill 0.3s;
}
.like-icon-down {
    width: 24px;
    height: 24px;
    z-index: 1;
    cursor: pointer;
    transition: fill 0.3s;
}
.like-icon-modal {
    width: 24px;
    height: 24px;
    z-index: 1;
    cursor: pointer;
    transition: fill 0.3s;
}
.like-icon:hover {
    fill: #FFA500; /* 호버 시 주황색 강조 */
}
.like-icon.active {
    fill: #FFD700; /* 활성화된 상태는 금색 */
}

/* 버튼의 셀렉 상태 */
.btn-selected {
    background-color: red; /* 금색 */
    color: #ffffff; /* 흰색 텍스트 */
    border-color: #FFD700;
    opacity: 0.65; /* 비활성화 상태처럼 보이도록 */
}

/* 가로 스크롤을 위한 설정 */
.row-wrapper {
  display: flex;
  flex-wrap: nowrap; /* 줄바꿈 방지 */
  overflow-x: auto; /* 가로 스크롤 활성화 */
  gap: 5px; /* 카드 간격 */
  padding: 5px;
  scroll-behavior: smooth; /* 부드러운 스크롤 */
  scrollbar-width: thin; 
}

.card.cardmain {
  flex: 0 0 auto; /* 고정 너비로 설정 */
  width: 60%; /* 기본 카드 크기 */
  background-color: white;
  border: 1px solid #ddd;
  border-radius: 10px;
  padding: 15px;
  text-align: align;
  transition: transform 0.3s ease-in-out;
}

.card.cardmain:hover {
  transform: scale(1.02); /* 호버 시 확대 */
}

.card.img {
  width: 100%; /* 이미지가 카드 내부에 맞게 조정 */
  border-radius: 10px;
}

.card.img img {
  width: 100%;
  height: 200px; /* 원하는 고정 높이 */
  object-fit: cover; /* 비율 유지하며 잘라내기 */
  border-radius: 10px;
}

.card-img-top {
  border-radius: 10px;
}

.card-wrapper {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 한 줄에 2개씩 */
  gap: 15px; /* 카드 간격 */
}

.card.carbottom {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 15px;
  box-sizing: border-box;
}

@media (max-width: 768px) {
  .card-wrapper {
    grid-template-columns: repeat(2, 1fr); /* 작은 화면에서는 한 줄에 1개 */
  }
}

@media (max-width: 576px) {
  .card-wrapper {
    grid-template-columns: repeat(1, 1fr); /* 작은 화면에서는 한 줄에 1개 */
  }
}
</style>
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
    background-color: var(--background-color);
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
}

::-webkit-scrollbar {
    display: none;
}

.cont {
    background-color: white;
    width: 744px;
    height: 100%;
    -ms-overflow-style: none;
    scrollbar-width: none;
}

.re_sm_logo_modal {
    font-size: 2rem;
    font-weight: 600;
    color: #828282;
}

.inp_size {
    border-radius: 15px;
    height: 11vh;
    min-height: 60px;
    max-height: 80px;
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
    height: 4rem;
    margin-bottom: 0.5rem;
}

.error-message {
    color: #dc3545;
    font-weight: 600;
    margin-left: 0.25rem;
}

/* 로고 사이즈 줄이기 */
/* 모달 관련 css*/
/* Modal Styles */
.modal-content {
	border-radius: 12px;
	border: none;
}

.modal-title {
	display: flex;
	align-items: center;
	gap: 10px;
}

.modal-title .heart-icon-container {
	position: static;
	margin-right: 10px;
	box-shadow: none;
	background: none;
}

.modal-header {
	border-bottom: 1px solid var(--background-color);
	padding: 20px;
}

/* Heart Icon Styles */
.heart-icon-container {
	position: absolute;
	top: 15px;
	left: 15px;
	z-index: 10;
	background: white;
	border-radius: 50%;
	width: 36px;
	height: 36px;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	cursor: pointer;
	transition: transform 0.2s ease;
}

.heart-icon-container:hover {
	transform: scale(1.1);
}

.heart-icon-container svg {
	width: 20px;
	height: 20px;
}
/* Local Box Styles */
[id^="localBox-"] {
	background: var(--background-color);
	border-radius: 8px !important;
	padding: 15px !important;
	margin-top: 15px;
	border: none !important;
}
.btn-secondary {
	background-color: var(--background-color);
	color: var(--text-color);
	border: none;
}

/* TO Button */
.TO-btn {
	background: var(--warning-color);
	color: white;
	border: none;
	border-radius: 4px;
	padding: 4px 8px;
	font-size: 0.85rem;
	margin-left: 8px;
	transition: all 0.2s ease;
}

.TO-btn:hover {
	background: #e5a422;
	transform: translateY(-1px);
}

/* Popover Styles */
.popover {
	max-width: 320px;
	border: none;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	border-radius: 12px;
}

.popover-header {
	background-color: var(--warning-color);
	color: white;
	font-weight: 600;
	border: none;
	padding: 12px 16px;
	border-radius: 12px 12px 0 0;
	font-size: 1rem;
}

.popover-body {
	padding: 16px;
	font-size: 0.95rem;
	line-height: 1.6;
}


</style>

<body>
	<span class="detail-email" hidden>${email}</span>
    <div class="cont overflow-y-auto">

		<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->	
        <!-- 저장 전기차 메인 -->
        <div class="mainbody text-align table-wrapper">
            <!-- 저장 전기차 차량 리스트 -->
           	<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/carCompare'">
				내연차 견적 비교하기
			</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/carElecCompare'">
				전기차 견적 비교하기
			</button>
            <div class="responsive-subtext p-2 col">내 찜목록</div>

            <div class="mainbody row-wrapper" id="listContainer">
				<c:forEach var="item" items="${allAboutPreperCar}">
				<span class="detail-email" hidden>${item.email}</span>
					<div class="card cardmain p-2 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<svg class="like-heart-${item.rownum } bi bi-heart" data-carname="${item.ECarName }" data-email="${item.email}" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
						  	<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
						</svg>
						<div class="card img">
                        	<img src="/assets/img/elec_car_img/${item.imgUrl}" class="card-img-top" alt="...">
                    	</div>
                    	<div class="card-body">
                        	<p class="card-text">${item.ECarName }</p>
                    	</div>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-${item.rownum }">
						  더 많은 정보!
						</button>
					</div>
					
					<!-- Modal 구버전 -->
					<div class="modal fade" id="exampleModal-${item.rownum}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content">
					      <div class="modal-header">
					        <div>
					          <h1 class="modal-title fs-5 mb-2" id="exampleModalLabel">
					            <!-- 모달 하트 아이콘 -->
					            <div class="heart-icon-container">
					              <svg class="like-heart-${item.rownum}" data-carname="${item.ECarName}" data-email="${item.email}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
					                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
					              </svg>
					            </div>
					            ${item.ECarName}
					          </h1>
					          <div class="modal-price ms-5">
					            <span class="fw-bold ms-2">${item.carPrice}원</span>
					            <span class="text-danger">(-${item.sumSubsidy}만원)</span>
					          </div>
					        </div>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					
					      <div class="modal-body">
					        <img src="/assets/img/elec_car_img/${item.imgUrl}" class="card-img-top mb-4" alt="차량 이미지">
					
					        <div class="d-flex gap-2 mb-4">
					          <button type="button" class="btn btn-primary save-modal-btn" data-id="${item.rownum}">
					            <i class="bi bi-download"></i> 카드 저장
					          </button>
					          <button type="button" class="btn btn-primary" onclick="window.open('${item.link}', '_blank')">
					            <i class="bi bi-book"></i> 카탈로그
					          </button>
					        </div>
					
					        <div class="car-details mb-4">
					          <h6 class="fw-bold">제조사(제조국가)</h6>
					          <p>${item.make} (${item.manu})</p>
					
					          <h6 class="fw-bold">차량분류</h6>
					          <p>
					            <span id="kindOfCar">${item.carCate}</span> ${item.carCateDetail} (${item.person})
					          </p>
					
					          <h6 class="fw-bold">배터리종류/용량</h6>
					          <p>${item.batType} / ${item.batVol}kWh</p>
					
					          <h6 class="fw-bold">1회 충전 주행거리</h6>
					          <p>
					            <i class="bi bi-sun-fill text-warning"></i> 상온: ${item.singleWarm}km
					            <i class="bi bi-snow text-info"></i> 저온: ${item.singleCold}km
					          </p>
					
					          <h6 class="fw-bold">국고보조금</h6>
					          <p>${item.govSubsidy}만원</p>
					        </div>
					
					        <div id="localBox-${item.rownum}" class="local-box">
					          <div class="d-flex gap-2 mb-3">
					            <div class="btn-group flex-grow-1" id="btn-group-1" data-group="first">
					              <button id="firstDropdownBtn-${item.rownum}" type="button" class="btn btn-secondary dropdown-toggle w-100" data-bs-toggle="dropdown">
					                	지역선택
					              </button>
					              <ul class="dropdown-menu">
					                <c:forEach var="local1" items="${firstLocal}">
					                  <li><a class="dropdown-item" href="#">${local1.addr}</a></li>
					                </c:forEach>
					              </ul>
					            </div>
					            <div class="btn-group flex-grow-1" id="btn-group-2" data-group="second">
					              <button id="secondDropdownBtn-${item.rownum}" type="button" class="btn btn-secondary dropdown-toggle w-100" data-bs-toggle="dropdown">선택</button>
					              <ul class="dropdown-menu">
					                <c:forEach var="local2" items="${secondLocal}">
					                  <li><a class="dropdown-item" href="#">${local2.addrDetail}</a></li>
					                </c:forEach>
					              </ul>
					            </div>
					            <button id="eachLocalSearchBtn-${item.rownum}" type="button" class="btn btn-primary">조회</button>
					          </div>
					
					          <div id="resultContainer-${item.rownum}" class="mt-3 p-3 bg-light rounded">
					            	다른 지역의 보조금과 지원금 TO 현황을 확인해보세요!
					          </div>
					
					          <hr class="my-4">
					
					          <div class="current-location px-3">
					            <h6 class="fw-bold">나의 지역: ${item.addr}</h6>
					            <p class="mb-2">지방비보조금 | 잔여대수</p>
					            <p class="d-flex align-items-center gap-2">
					              ${item.locSubsidy}만원 | ${item.effLeftAll} / ${item.effAllAll} 대
					              
					              <button id="my-TO-popover" class="TO-btn" data-bs-toggle="popover"
										data-bs-trigger="click" data-bs-html="true" 
										title="보조금 상세 TO (${item.addr })"
										data-bs-content="
										<c:choose>
					                    <c:when test="${item.carCate == '승용'}">
											전체: ${item.effLeftAll}/${item.effAllAll}<br>
											우선: ${item.effLeftFirst}/${item.effAllFirst}<br>
											법인: ${item.effLeftCorporation}/${item.effAllCorporation}<br>
											택시: ${item.effLeftTaxi}/${item.effAllTaxi}<br>
											일반: ${item.effLeftCommon}/${item.effAllCommon}
					                    </c:when>
					                    <c:when test="${item.carCate == '화물'}">
											전체: ${item.effLeftAll}/${item.effAllAll}<br>
											우선: ${item.effLeftFirst}/${item.effAllFirst}<br>
											중소: ${item.effLeftSmallCompany}/${item.effAllSmallCompany}<br>
											법인: ${item.effLeftCorporation}/${item.effAllCorporation}<br>
											택배: ${item.effLeftDelivery}/${item.effAllDelivery}<br>														     
											일반: ${item.effLeftCommon}/${item.effAllCommon}
					                    </c:when>
					                    <c:when test="${item.carCate == '승합'}">
											전체: ${item.effLeftAll}/${item.effAllAll}<br>
											우선: ${item.effLeftFirst}/${item.effAllFirst}<br>
											일반: ${item.effLeftCommon}/${item.effAllCommon}
					                    </c:when>
					                    <c:when test="${item.carCate == '이륜차'}">
											전체: ${item.effLeftAll}/${item.effAllAll}<br>
											우선: ${item.effLeftFirst}/${item.effAllFirst}<br>
											법인: ${item.effLeftCorporation}/${item.effAllCorporation}<br>
											배달: ${item.effLeftDelivery}/${item.effAllDelivery}<br>														     
											일반: ${item.effLeftCommon}/${item.effAllCommon}
					                    </c:when>
					                	</c:choose>">
					                		TO상세
					                </button>
					            </p>
					          </div>
					          
					        </div>
					      </div>
					
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 모달  구버전-->
					
					<!-- Modal 구버전 -
					<div class="modal fade" id="exampleModal-${item.rownum }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">
  								<svg class="like-heart-${item.rownum }" data-carname="${item.ECarName}"	xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
								  	<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
								</svg>
								${item.ECarName }
							</h1>
					        <h1 class="modal-title fs-5" >${item.carPrice }원</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
								<img src="/assets/img/elec_car_img/${item.imgUrl}" class="card-img-top" alt="...">

								<button type="button" class="btn btn-primary save-modal-btn" data-id="${item.rownum}">카드 저어장!</button>
								<button type="button" style="cursor: pointer;" onclick="window.open('${item.link}', '_blank')">카탈로그(새 창)</button>
								
								<p class="card-text">제조사(제조국가)</p>
								<p class="card-text">${item.make }(${item.manu })</p>
								<p class="card-text">차량분류</p>
								<span class="card-text" id="kindOfCar">${item.carCate }</span>
								<span class="card-text">${item.carCateDetail }</span>
								<span class="card-text">(${item.person })</span>
								<p class="card-text"><br>배터리종류/용량</p>
								<p class="card-text">${item.batType }/${item.batVol }kWh</p>
								<p class="card-text">1회 충전 주행거리</p>
								<p class="card-text">상온: ${item.singleWarm }km | 저온: ${item.singleCold }km</p>
								<p class="card-text">국고보조금</p>
								<p class="card-text">${item.govSubsidy }만원</p>
								
								<div id="localBox-${item.rownum}" style="border: 1px solid #000; padding: 10px;">
									<div class="btn-group" id="btn-group-1" data-group="first">
										  <button id="firstDropdownBtn-${item.rownum}" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
										    	지역선택
										  </button>
										  <ul class="dropdown-menu" style="max-height: 200px; overflow-y: auto;">
											  <c:forEach var="local1" items="${firstLocal}">
												<li><a class="dropdown-item" href="#">${local1.addr }</a></li>
											  </c:forEach>
										  </ul>
								    </div>
								    <div class="btn-group" id="btn-group-2" data-group="second">
										  <button id="secondDropdownBtn-${item.rownum}" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
										    선택
										  </button>
										  <ul class="dropdown-menu" style="max-height: 200px; overflow-y: auto;">
										  	  <c:forEach var="local2" items="${secondLocal}">
												<li><a class="dropdown-item" href="#">${local2.addrDetail }</a></li>
											  </c:forEach>
										  </ul>
									</div>
									<button id="eachLocalSearchBtn-${item.rownum}" type="button" class="btn btn-primary">조회</button>
									
									<div id="resultContainer-${item.rownum}" style="margin-top: 20px;">
										<!-- 서버에서 받은 데이터를 여기에 표시 --
										다른 지역의 보조금과 지원금TO현황을 확인해보세요!
									</div>
								
									<p class="card-text">---------------------------------</p>
									
									<p class="card-text">나의 지역: ${item.addr }</p>
									<p class="card-text">지방비보조금 | 잔여대수</p>
									<p class="card-text">${item.locSubsidy }만원 | ${item.effLeftAll }/${item.effAllAll } 대

											<button id="my-TO-popover" class="TO-btn" data-bs-toggle="popover"
												data-bs-trigger="click"
												title="보조금 상세 TO (${item.addr })"
												data-bs-content="
												<c:choose>
							                    <c:when test="${item.carCate == '승용'}">
													전체: ${item.effLeftAll}/${item.effAllAll}
													우선: ${item.effLeftFirst}/${item.effAllFirst}
													법인: ${item.effLeftCorporation}/${item.effAllCorporation}
													택시: ${item.effLeftTaxi}/${item.effAllTaxi}
													일반: ${item.effLeftCommon}/${item.effAllCommon}
							                    </c:when>
							                    <c:when test="${item.carCate == '화물'}">
													전체: ${item.effLeftAll}/${item.effAllAll}
													우선: ${item.effLeftFirst}/${item.effAllFirst}
													중소: ${item.effLeftSmallCompany}/${item.effAllSmallCompany}
													법인: ${item.effLeftCorporation}/${item.effAllCorporation}
													택배: ${item.effLeftDelivery}/${item.effAllDelivery}																     
													일반: ${item.effLeftCommon}/${item.effAllCommon}
							                    </c:when>
							                    <c:when test="${item.carCate == '승합'}">
													전체: ${item.effLeftAll}/${item.effAllAll}
													우선: ${item.effLeftFirst}/${item.effAllFirst}
													일반: ${item.effLeftCommon}/${item.effAllCommon}
							                    </c:when>
							                    <c:when test="${item.carCate == '이륜차'}">
													전체: ${item.effLeftAll}/${item.effAllAll}
													우선: ${item.effLeftFirst}/${item.effAllFirst}
													법인: ${item.effLeftCorporation}/${item.effAllCorporation}
													배달: ${item.effLeftDelivery}/${item.effAllDelivery}																     
													일반: ${item.effLeftCommon}/${item.effAllCommon}
							                    </c:when>
							                	</c:choose>">
							                		TO상세
							                </button>
										</p>	                
					      		</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					-- 모달  구버전-->
					
				</c:forEach>
            </div>

            <hr>

            <!-- 전기차 저장 목록 추가 -->
            <div class="responsive-subtext p-2">전기차 저장 목록 추가</div>
            <div class="input-group mb-3 mt-2 position-relative">
                <input type="text" class="form-control responsive-input" id="searchCar" name="carName" placeholder="차량을 선택해 보세요.">
                <!-- 검색 결과 드롭다운 -->
            </div>

            <div class="mainbody table-wrapper row">
                <div class="card-wrapper" id="searchedCarBody" data-email="${email }">
					<!-- 검색된 차량 -->	 
                </div>
            </div> 
        </div>
    </div>
    <!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->


</body>
<script src="/resources/js/likeList.js"></script>
</html>
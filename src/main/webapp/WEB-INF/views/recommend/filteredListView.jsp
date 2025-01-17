<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색된 차량 리스트</title>
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
	<!-- html2canvas 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->

<style>
/* Root Variables */
:root { 
	--primary-color: #37a1f8;
	--hover-color: #2196f3;
	--warning-color: #F6B426;
	--danger-color: #FF4B5D;
	--background-color: #f8f9fa;
	--border-color: #ABABAB;
	--text-color: #333;
}

/* Base Styles */
/* 화면 꽉차게 */
html, body {
	height: auto;
}

/* Base Styles */
body {
	display: flex;
	justify-content: center;
	background-color: #f8f9fa;
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
}

body::-webkit-scrollbar {
	display: none;
}

.cont::-webkit-scrollbar {
	display: none;
}

/* Container Styles */
.cont {
    background-color: white;
    width: 744px;
    height: auto;
    -ms-overflow-style: none;
    scrollbar-width: none;
}

.md_logo {
	font-size: 3rem;
	font-weight: 600;
	cursor: pointer;
}

.md_logo .accent-yellow {
	color: #FFD050;
}

.md_logo .accent-blue {
	color: var(--primary-color);
}

.bot_brd {
	height: 4px;
	background: linear-gradient(to bottom, #d6edff, rgba(214, 237, 255, 0));
}

/* Card Container */
#listContainer {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 20px;
	padding: 20px;
}

/* Card Styles */
/* Prevent card click when clicking heart */
.card {
	position: relative;
	transition: all 0.3s ease;
}

.card>*:not (.heart-icon-container ) {
	pointer-events: auto;
}

/* Card content wrapper */
.card-content {
	position: relative;
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
}

.card-img-top {
	height: 200px;
	object-fit: cover;
}

.card-body {
	padding: 1rem;
}
/* Button Container Styles */
.action-buttons {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
	align-items: center;
	margin-bottom: 1rem;
}

.action-buttons .btn-outline-primary {
	order: -1; /* Makes the filter button appear first */
}

/* Subsidy Info */
.subsidy-info {
	background: var(--background-color);
	border-radius: 8px !important;
	padding: 15px;
	margin: 10px 0;
	border: none !important;
}

/* Button Container */
#buttonContainer {
	background: white;
	padding: 15px 20px;
	margin-bottom: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
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

.btn-secondary {
	background-color: var(--background-color);
	color: var(--text-color);
	border: none;
}

/* Heart Icon */
svg.heart-icon {
	position: absolute;
	top: 10px;
	left: 10px;
	background: white;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	z-index: 10;
	width: 36px;
	height: 36px;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: transform 0.2s ease;
}

svg.heart-icon:hover {
	transform: scale(1.1);
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

/* Modal Heart Icon */
.modal-header .heart-icon-container {
	position: relative;
	top: 0;
	right: 0;
	box-shadow: none;
	background: none;
}
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
/* Card Heart Icon Container */
.card .heart-icon-container {
	position: absolute;
	top: 15px;
	left: 15px;
	z-index: 20; /* Increased z-index to ensure it's above the card */
	pointer-events: auto;
	/* Ensures the heart icon receives click events */
}

.modal-body {
	padding: 20px;
}

.modal-footer {
	border-top: 1px solid var(--background-color);
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

/* TO Table Styles */
.to-info-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 4px;
}

.to-info-table td {
	padding: 6px 10px;
	background: #f8f9fa;
}

.to-info-table td:first-child {
	border-radius: 4px 0 0 4px;
	font-weight: 500;
	color: #555;
}

.to-info-table td:last-child {
	border-radius: 0 4px 4px 0;
	text-align: right;
	color: var(--primary-color);
}

/* Dropdown Styles */
.dropdown-menu {
	border: none;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	max-height: 200px;
	overflow-y: auto;
}

/* Local Box Styles */
[id^="localBox-"] {
	background: var(--background-color);
	border-radius: 8px !important;
	padding: 15px !important;
	margin-top: 15px;
	border: none !important;
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

/* Button Icons */
.btn i {
	margin-right: 6px;
}

/* Responsive */
@media ( max-width : 768px) {
	.cont {
		max-width: 100%;
	}
	#listContainer {
		grid-template-columns: 1fr;
	}
}
</style>
</head>

<body>
	<div class="cont">

		<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->

		<div class="container py-4">
			<!-- 정렬 컨트롤 -->
			<div id="buttonContainer">
				<div class="d-flex align-items-center gap-3">
					<span class="text-muted">정렬 기준:</span>
					<button type="button" id="order-price"
						class="btn ${searchVO.priceOrder == 'default' ? 'btn-secondary' : 'btn-primary'}"
						data-action="${searchVO.priceOrder}">가격</button>
					<button type="button" id="order-single"
						class="btn ${searchVO.singleOrder == 'default' ? 'btn-secondary' : 'btn-primary'}"
						data-action="${searchVO.singleOrder}">1회충전주행거리</button>
				</div>
			</div>

			<!-- 비교하기 버튼 -->
			<div class="action-buttons">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/carCompare'">
					내연차 견적 비교하기
				</button>
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/carElecCompare'">
					전기차 견적 비교하기
				</button>
				<button type="button" onclick="location.href='/filter';" class="btn btn-primary">
					<i class="bi bi-arrow-left"></i> 조건 재선택
				</button>
			</div>

			<!-- 차량 리스트 -->
			<div id="listContainer">
				<c:forEach var="detail" items="${details}">
					<span class="detail-email" hidden>${detail.email}</span>


					<!-- 카드 섹션 -->
					<div class="card">
						<div class="heart-icon-container">
							<svg class="like-heart-${detail.rownum} bi bi-heart" data-carname="${detail.carName}" data-email="${detail.email}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
					            <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
					        </svg>
						</div>
						<div class="card-content" data-bs-toggle="modal" data-bs-target="#exampleModal-${detail.rownum}">


							<input type="hidden" class="card-title"	value="/assets/img/elec_car_img/${detail.imgUrl}" name="imgUrl">
							<img src="/assets/img/elec_car_img/${detail.imgUrl}" class="card-img-top" alt="차량 이미지">

							<div class="card-body">
								<div class="subsidy-info">
									<span class="card-text">국고: ${detail.govSubsidy}만원</span>
									<br>
									<span class="card-text">지방비(${detail.memAddr}):${detail.locSubsidy}만원</span>
									<br>
									<span class="card-text">잔여대수(${detail.memAddr}):${detail.effLeftAll}/${detail.effAllAll} 대 </span>
								</div>

								<input type="hidden" class="card-title" id="${detail.carName}" value="${detail.carName}" name="carName">
								<h5 class="card-title mb-2">${detail.carName}</h5>
								<p class="card-text">
									<span class="fs-5 fw-bold">${detail.carPrice}원</span>
									<span class="text-danger">(-${detail.sumSubsidy}만원)</span>
								</p>
								<p class="card-text">
									<strong>1회 충전 주행거리</strong><br>
									<i class="bi bi-sun-fill text-warning"></i> 
										상온:${detail.singleWarm}km 
									<i class="bi bi-snow text-info"></i>
										저온:${detail.singleCold}km
								</p>
							</div>
						</div>
					</div>

					<!-- 모달 섹션 -->
					<div class="modal fade" id="exampleModal-${detail.rownum}" tabindex="-1">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<div>
										<h1 class="modal-title fs-5 mb-2" id="exampleModalLabel">
											<!-- 모달 하트 아이콘 -->
											<div class="heart-icon-container">
												<svg class="like-heart-${detail.rownum} bi bi-heart" data-carname="${detail.carName}" data-email="${detail.email}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
					                                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
					                            </svg>
											</div>
											${detail.carName}
										</h1>
										<div class="modal-price ms-5">
											<span class="fw-bold ms-2">${detail.carPrice}원</span>
											<span class="text-danger">(-${detail.sumSubsidy}만원)</span>
										</div>
									</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<img src="/assets/img/elec_car_img/${detail.imgUrl}" class="card-img-top mb-4" alt="차량 이미지">

									<div class="d-flex gap-2 mb-4">
										<button type="button" class="btn btn-primary save-modal-btn" data-id="${detail.rownum}">
											<i class="bi bi-download"></i> 
												카드 저장
										</button>
										<button type="button" class="btn btn-primary" onclick="window.open('${detail.link}', '_blank')">
											<i class="bi bi-book"></i>
												카탈로그
										</button>
									</div>


									<div class="car-details mb-4">
										<h6 class="fw-bold">제조사(제조국가)</h6>
										<p>${detail.make}(${detail.manu})</p>

										<h6 class="fw-bold">차량분류</h6>
										<p>
											<span id="kindOfCar">${detail.carCate}</span>
											${detail.carCateDetail} (${detail.person})
										</p>

										<h6 class="fw-bold">배터리종류/용량</h6>
										<p>${detail.batType}/${detail.batVol}kWh</p>

										<h6 class="fw-bold">1회 충전 주행거리</h6>
										<p>
											<i class="bi bi-sun-fill text-warning"></i> 
											상온: ${detail.singleWarm}km 
											<i class="bi bi-snow text-info"></i>
											저온: ${detail.singleCold}km
										</p>

										<h6 class="fw-bold">국고보조금</h6>
										<p>${detail.govSubsidy}만원</p>

										<!-- 지역 선택 박스 -->
										<div id="localBox-${detail.rownum}" class="local-box">
											<div class="d-flex gap-2 mb-3">
												<div class="btn-group flex-grow-1" id="btn-group-1" data-group="first">
													<button id="firstDropdownBtn-${detail.rownum}" type="button" class="btn btn-secondary dropdown-toggle w-100" data-bs-toggle="dropdown">
														지역선택
													</button>
													<ul class="dropdown-menu">
														<c:forEach var="item" items="${firstLocal}">
															<li><a class="dropdown-item" href="#">${item.addr}</a></li>
														</c:forEach>
													</ul>
												</div>
												<div class="btn-group flex-grow-1" id="btn-group-2" data-group="second">
													<button id="secondDropdownBtn-${detail.rownum}" type="button" class="btn btn-secondary dropdown-toggle w-100" data-bs-toggle="dropdown">선택</button>
													<ul class="dropdown-menu">
														<c:forEach var="item" items="${secondLocal}">
															<li><a class="dropdown-item" href="#">${item.addrDetail}</a></li>
														</c:forEach>
													</ul>
												</div>
												<button id="eachLocalSearchBtn-${detail.rownum}" type="button" class="btn btn-primary">조회</button>
											</div>

											<div id="resultContainer-${detail.rownum}" class="mt-3 p-3 bg-light rounded">
												다른 지역의 보조금과 지원금TO현황을 확인해보세요!
											</div>

											<hr class="my-4">

											<div class="current-location px-3">
												<h6 class="fw-bold">나의 지역: ${detail.memAddr}</h6>
												<p class="mb-2">지방비보조금 | 잔여대수</p>
												<p class="d-flex align-items-center gap-2">
													${detail.locSubsidy}만원 |
													${detail.effLeftAll}/${detail.effAllAll}대
													<button id="my-TO-popover-${detail.rownum}" class="TO-btn"
														data-bs-toggle="popover" data-bs-trigger="click"
														data-bs-html="true" title="보조금 상세 TO (${detail.memAddr})"
														data-bs-content="
										                <c:choose>
										                    <c:when test='${detail.carCate == "승용"}'>
													                        전체: ${detail.effLeftAll}/${detail.effAllAll}<br>
													                        우선: ${detail.effLeftFirst}/${detail.effAllFirst}<br>
													                        법인: ${detail.effLeftCorporation}/${detail.effAllCorporation}<br>
													                        택시: ${detail.effLeftTaxi}/${detail.effAllTaxi}<br>
													                        일반: ${detail.effLeftCommon}/${detail.effAllCommon}
										                    </c:when>
										                    <c:when test='${detail.carCate == "화물"}'>
													                        전체: ${detail.effLeftAll}/${detail.effAllAll}<br>
													                        우선: ${detail.effLeftFirst}/${detail.effAllFirst}<br>
													                        중소: ${detail.effLeftSmallCompany}/${detail.effAllSmallCompany}<br>
													                        법인: ${detail.effLeftCorporation}/${detail.effAllCorporation}<br>
													                        택배: ${detail.effLeftDelivery}/${detail.effAllDelivery}<br>
													                        일반: ${detail.effLeftCommon}/${detail.effAllCommon}
										                    </c:when>
										                    <c:when test='${detail.carCate == "승합"}'>
													                        전체: ${detail.effLeftAll}/${detail.effAllAll}<br>
													                        우선: ${detail.effLeftFirst}/${detail.effAllFirst}<br>
													                        일반: ${detail.effLeftCommon}/${detail.effAllCommon}
										                    </c:when>
										                    <c:when test='${detail.carCate == "이륜차"}'>
													                        전체: ${detail.effLeftAll}/${detail.effAllAll}<br>
													                        우선: ${detail.effLeftFirst}/${detail.effAllFirst}<br>
													                        법인: ${detail.effLeftCorporation}/${detail.effAllCorporation}<br>
													                        배달: ${detail.effLeftDelivery}/${detail.effAllDelivery}<br>
													                        일반: ${detail.effLeftCommon}/${detail.effAllCommon}
										                    </c:when>
										                </c:choose>">
														TO상세
													</button>
												</p>
											</div>
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
					
					
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->

	<form id="searchForm" action="<c:url value='/getSelect' />"
		method="post">
		<input type="hidden" name="email" value="${searchVO.email}" /> <input
			type="hidden" name="keyword" value="${searchVO.keyword}" /> <input
			type="hidden" name="selectedMaxCarPrice"
			value="${searchVO.selectedMaxCarPrice}" /> <input type="hidden"
			name="selectedMinCarPrice" value="${searchVO.selectedMinCarPrice}" />

		<c:forEach items="${searchVO.selectedCates}" var="cate">
			<input type="hidden" name="selectedCates" value="${cate}" />
		</c:forEach>

		<c:forEach items="${searchVO.selectedSubYN}" var="subYN">
			<input type="hidden" name="selectedSubYN" value="${subYN}" />
		</c:forEach>

		<input type="hidden" name="singleOrder"
			value="${searchVO.singleOrder}" id="singleOrder" /> <input
			type="hidden" name="priceOrder" value="${searchVO.priceOrder}"
			id="priceOrder" /> <input type="hidden" name="singleIdx"
			id="singleIdx" value="${searchVO.singleIdx}" /> <input type="hidden"
			name="priceIdx" id="priceIdx" value="${searchVO.priceIdx}" />
	</form>
	
	<script src="/resources/js/filteredList.js"></script>
</body>
</html>
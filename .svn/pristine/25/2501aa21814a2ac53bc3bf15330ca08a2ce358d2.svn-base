<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 검색 필터</title>
<!-- 프레임 워크 jquery and bootStrap-->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
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
	height: 100%;
}

body {
	display: flex;
    justify-content: center;
    background-color: #f8f9fa;
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, sans-serif;
}

body::-webkit-scrollbar {
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

/* 아코디언 스타일 통일 */
.accordion-item {
	border: none;
	margin-bottom: 12px;
}

.accordion-button {
	border-radius: 8px;
	background-color: #f8f9fa;
	padding: 15px 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.accordion-button:not (.collapsed ) {
	background-color: #37a1f8;
	color: white;
	box-shadow: none;
}

.accordion-button::after {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23333'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.accordion-button:not (.collapsed )::after {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

/* 차종 선택 스타일 개선 */
.category-item {
	padding: 12px 20px;
	border: 2px solid #dee2e6;
	border-radius: 12px;
	cursor: pointer;
	transition: all 0.2s ease;
	display: inline-flex;
	align-items: center;
	gap: 12px;
	margin: 6px;
	background: white;
}

.category-item.selected {
	background-color: #37a1f8;
	color: white;
	border-color: #37a1f8;
}

.category-item.selected img {
	filter: brightness(0) invert(1);
}
/* 브랜드 선택 영역 개선 */
.brand-summary {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 16px;
}

.brand-count {
	background: #37a1f8;
	color: white;
	padding: 2px 8px;
	border-radius: 12px;
	font-size: 0.9em;
}

.brand-tags {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	min-height: 40px;
	max-height: 150px;
	padding: 8px;
	background: #f8f9fa;
	border-radius: 8px;
	margin-bottom: 16px;

}
.brand-tags::-webkit-scrollbar {
	display: none; 
	
}

/* 브랜드 태그 스타일 개선 */
.brand-tag {
	display: inline-flex;
	align-items: center;
	background: white;
	padding: 8px 16px;
	border-radius: 20px;
	border: 2px solid #37a1f8;
	color: #37a1f8;
	font-weight: 500;
	margin: 4px;
	gap: 8px;
}

.brand-tag .remove-brand {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background: #ff4b5d;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 14px;
	transition: all 0.2s ease;
}

.brand-tag .remove-brand:hover {
	background: #ff3344;
	transform: scale(1.1);
}
/* 브랜드 검색 스타일 */
.search-container {
	margin: 1rem 0;
}

.search-container .input-group {
	border-radius: 8px;
	overflow: hidden;
}

.search-container .form-control {
	border-right: none;
}

.search-container .btn {
	border-left: none;
	background-color: white;
	color: var(--primary-color);
}

/* 브랜드 목록 테이블 스타일 */
.table-container {
	border-radius: 8px;
	overflow-y: auto;
	max-height: 300px;
	position: relative;
}

.table {
	margin-bottom: 0;
	position: relative;
}

.table td {
	vertical-align: middle;
	padding: 0.75rem 1rem;
	background-color: white;
}

/* 스크롤바 스타일링 */
.table-container {
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* IE and Edge */
}

.table-container::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera */
}

/* 브랜드 체크박스 공통 스타일 */
.brand-checkbox-wrapper input[type="checkbox"], .table input[type="checkbox"]
	{
	width: 24px;
	height: 24px;
	margin-right: 12px;
	cursor: pointer;
}

/* 브랜드 전체 선택 체크박스 특별 스타일링 */
.brand-checkbox-wrapper {
	display: flex;
	align-items: center;
}

.brand-checkbox-wrapper label {
	font-size: 1rem;
	margin-left: 4px;
}
/* Slider Styles */
.slideContainer {
	position: relative;
	width: 100%;
	margin: 20px 0;
}

.slideFixedBar {
	position: absolute;
	height: 4px;
	width: 100%;
	background-color: #e0e0e0;
	border-radius: 10px;
	z-index: 1;
	top: 50%;
	transform: translateY(-50%);
}

.slideContainerInner {
	position: absolute;
	height: 4px;
	background-color: var(--primary-color);
	z-index: 2;
	border-radius: 10px;
	top: 50%;
	transform: translateY(-50%);
}

.slideRange {
	position: relative;
	height: 30px;
}

.slideMin, .slideMax {
	position: absolute;
	width: 100%;
	-webkit-appearance: none;
	background: none;
	pointer-events: none;
}

.slideMin::-webkit-slider-thumb, .slideMax::-webkit-slider-thumb {
	position: relative;
	z-index: 3;
	transform: translateY(30%);
	-webkit-appearance: none;
	height: 20px;
	width: 20px;
	border-radius: 50%;
	background-color: white;
	border: 2px solid var(--primary-color);
	pointer-events: auto;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.slideMin::-webkit-slider-thumb:hover, .slideMax::-webkit-slider-thumb:hover
	{
	background-color: var(--primary-color);
}

.valueDisplay {
	text-align: center;
	margin-top: 10px;
	font-size: 1rem;
}

.valueDisplay .col {
	border: 1px solid #e0e0e0;
	padding: 10px;
	border-radius: 5px;
	background-color: #fff;
}

/* Subsidy Option Styles */
.subsidy-option input[type="checkbox"] {
	display: none;
}

.subsidy-option label {
	display: inline-block;
	padding: 8px 20px;
	background-color: white;
	border: 2px solid var(--border-color);
	border-radius: 8px;
	color: var(--border-color);
	cursor: pointer;
	transition: all 0.3s ease;
	font-weight: 500;
	min-width: 100px;
	text-align: center;
}

.subsidy-option input[type="checkbox"]:checked+label {
	background-color: #ffffff;
	border-color: var(--warning-color);
	color: var(--warning-color);
}

.subsidy-option label:hover {
	border-color: var(--warning-color);
	color: var(--warning-color);
}

/* Button Styles */
.btn-primary {
	background-color: var(--primary-color);
	border: none;
	padding: 0.5rem 1.5rem;
	font-weight: 500;
	border-radius: 8px;
}

.btn-primary:hover {
	background-color: var(--hover-color);
}

.btn-outline-secondary {
	color: var(--border-color);
	border-color: var(--border-color);
}

.btn-outline-secondary:hover {
	background-color: var(--border-color);
	border-color: var(--border-color);
	color: white;
}

/* Offcanvas Styles */
.offcanvas-custom {
	position: fixed;
	top: 0;
	right: 0;
	width: 80%;
	height: 100%;
	background: white;
	transform: translateX(100%);
	transition: transform 0.3s ease;
	z-index: 1050;
	padding: 1rem;
}

.offcanvas-custom.show {
	transform: translateX(0);
}

.offcanvas-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transition: 0.3s ease;
	z-index: 1040;
}

.offcanvas-overlay.show {
	opacity: 1;
	visibility: visible;
}


</style>
</head>
<body>
	<div class="cont overflow-y-auto">

			<!-- 헤더 영역 -->
			<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
			<!-- 헤더 영역 -->

			<!-- 메인 컨텐츠 영역 -->
			<div class="container py-4">
				<h2 class="mb-4">전기차 구매추천 가이드</h2>

				<!-- 필터 폼 -->
				<form id="vehicleFilterForm" action="/getSelect" method="POST">
					<!-- 필터 아코디언 -->
					<div class="accordion" id="filterAccordion">
						<!-- 차종 필터 -->
						<!-- 차종 필터 섹션 수정 -->
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" id="carType" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne">
										차종
									</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse"
								data-bs-parent="#filterAccordion">
								<div class="accordion-body">
									<!-- 승용차 섹션 -->
									<div class="filter-section mb-4">
										<h3 class="filter-title mb-3">승용</h3>
										<div class="filter-container">
											<c:forEach var="item" items="${passCate}">

												<div class="category-item">
													<input type="checkbox" class="category-checkbox"
														name="selectedCates" id="cate_${item.carCateDetail}"
														value="${item.carCateDetail}" style="display: none;">
													<label for="cate_${item.carCateDetail}"
														class="d-flex align-items-center gap-2"> <img
														src="resources/assets/img/carIcon/${item.cateImgUrl}"
														alt="Image" width="20" /> <span>${item.carCateDetail}</span>
													</label>
												</div>
											</c:forEach>
										</div>
									</div>

									<!-- 화물차 섹션 -->
									<div class="filter-section mb-4">
										<h3 class="filter-title mb-3">화물</h3>
										<div class="filter-container">
											<c:forEach var="item" items="${freiCate}">
												<div class="category-item">
													<input type="checkbox" class="category-checkbox"
														name="selectedCates" id="cate_${item.carCateDetail}"
														value="${item.carCateDetail}" style="display: none;">
													<label for="cate_${item.carCateDetail}"
														class="d-flex align-items-center gap-2"> <img
														src="resources/assets/img/carIcon/${item.cateImgUrl}"
														alt="Image" width="20" /> <span>${item.carCateDetail}</span>
													</label>
												</div>
											</c:forEach>
										</div>
									</div>

									<!-- 승합차 섹션 -->
									<div class="filter-section mb-4">
										<h3 class="filter-title mb-3">승합</h3>
										<div class="filter-container">
											<c:forEach var="item" items="${vansCate}">
												<div class="category-item">
													<input type="checkbox" class="category-checkbox"
														name="selectedCates" id="cate_${item.carCateDetail}"
														value="${item.carCateDetail}" style="display: none;">
													<label for="cate_${item.carCateDetail}"
														class="d-flex align-items-center gap-2"> <img
														src="resources/assets/img/carIcon/${item.cateImgUrl}"
														alt="Image" width="20" /> <span>${item.carCateDetail}</span>
													</label>
												</div>
											</c:forEach>
										</div>
									</div>

									<!-- 이륜차 섹션 -->
									<div class="filter-section">
										<h3 class="filter-title mb-3">이륜</h3>
										<div class="filter-container">
											<c:forEach var="item" items="${motoCate}">
												<div class="category-item">
													<input type="checkbox" class="category-checkbox"
														name="selectedCates" id="cate_${item.carCateDetail}"
														value="${item.carCateDetail}" style="display: none;">
													<label for="cate_${item.carCateDetail}"
														class="d-flex align-items-center gap-2"> <img
														src="resources/assets/img/carIcon/${item.cateImgUrl}"
														alt="Image" width="20" /> <span>${item.carCateDetail}</span>
													</label>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 브랜드 필터 섹션 -->
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo">
									브랜드</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								data-bs-parent="#filterAccordion">
								<div class="accordion-body">
									<!-- 전체 선택 체크박스 -->
									<div class="d-flex align-items-center mb-3">
										<div class="brand-checkbox-wrapper">
											<input type="checkbox" id="checkAll" class="form-check-input">
											<label for="checkAll" style="cursor: pointer;">전체</label>
										</div>
									</div>

									<!-- 선택된 브랜드 태그들 -->
									<div id="tagContainer" class="brand-tags overflow-y-auto mb-3">
										<!-- 여기에 동적으로 태그가 추가됨 -->
									</div>

									<!-- 브랜드 검색 -->
									<div class="search-container mb-3">
										<div class="input-group">
											<input type="text" id="searchBrand" class="form-control"
												placeholder="브랜드 검색">
											<button class="btn btn-outline-primary">
												<i class="bi bi-search"></i>
											</button>
										</div>
									</div>

									<!-- 브랜드 목록 테이블 -->
									<div class="table-container">
										<table class="table" id="carBrandTable">
											<!-- 여기에 동적으로 브랜드 목록이 추가됨 -->
										</table>
									</div>
								</div>
							</div>
						</div>

						<!-- 예산 필터 -->
						<!-- 예산 필터 섹션 수정 -->
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree">
									예산</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								data-bs-parent="#filterAccordion">
								<div class="accordion-body">
									<div class="slideContainer">
										<div class="slideFixedBar"></div>
										<div class="slideContainerInner" id="slideContainerInner"></div>
										<div class="slideRange">
											<input type="range" class="slideMin" id="slideMin"
												name="selectedMinCarPrice" min="0" max="900000000"
												step="5000000" value="0"> <input type="range"
												class="slideMax" id="slideMax" name="selectedMaxCarPrice"
												min="0" max="900000000" step="5000000" value="900000000">
										</div>
									</div>
									<div class="valueDisplay">
										<div class="row px-2">
											<div class="col" id="minValueDisplay"></div>
											<div class="col" id="maxValueDisplay"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 보조금 필터 -->
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFour">
									보조금</button>
							</h2>
							<div id="collapseFour" class="accordion-collapse collapse"
								data-bs-parent="#filterAccordion">
								<div class="accordion-body">
									<div
										class="subsidy-options d-flex justify-content-center gap-4">
										<div class="subsidy-option">
											<input type="checkbox" id="subAll" name="selectedSubYN"
												value="Y,N" checked> <label for="subAll">무관</label>
										</div>
										<div class="subsidy-option">
											<input type="checkbox" id="subYes" name="selectedSubYN"
												value="Y"> <label for="subYes">지원</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 필터 적용 버튼 -->
					<div class="d-flex justify-content-center gap-3 mt-4">
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='/filter'">초기화</button>
						<button type="submit" class="btn btn-primary" id="nowCnt">
							검색 ${nowCount}건</button>
					</div>
				</form>
			</div>
	</div>

	<!-- 풋터 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<!-- 풋터 영역 -->

	<!-- 히든 필드 -->
	<input type="hidden" id="searchCarBrand"
		value='<c:out value="${brandList}" />' />

	<script>
         	// 아코디언 동작 조정을 위한 JavaScript
            document.addEventListener('DOMContentLoaded', function() {
                // 모든 아코디언 버튼을 가져옵니다
                const accordionButtons = document.querySelectorAll('.accordion-button');
                
                // 각 버튼에 클릭 이벤트를 추가합니다
                accordionButtons.forEach(button => {
                    button.addEventListener('click', function() {
                        // 현재 클릭된 버튼이 접혀있는 상태라면
                        if (this.classList.contains('collapsed')) {
                            // 다른 모든 아코디언을 접습니다
                            accordionButtons.forEach(otherButton => {
                                if (otherButton !== this && !otherButton.classList.contains('collapsed')) {
                                    otherButton.classList.add('collapsed');
                                    otherButton.setAttribute('aria-expanded', 'false');
                                    const targetId = otherButton.getAttribute('data-bs-target');
                                    const targetPanel = document.querySelector(targetId);
                                    if (targetPanel) {
                                        targetPanel.classList.remove('show');
                                    }
                                }
                            });
                        }
                    });
                });
            });
            
            document.addEventListener('DOMContentLoaded', () => {
                // collapseOne과 collapseTwo의 상태 변화를 감지
                const collapseElements = ['#collapseOne', '#collapseTwo'];

                collapseElements.forEach(collapseId => {
                    const collapseElement = document.querySelector(collapseId);

                    if (collapseElement) {
                        // 아코디언이 열릴 때
                        collapseElement.addEventListener('shown.bs.collapse', () => {
                            document.body.style.height = 'auto';
                            console.log(`${collapseId} is opened, body height set to auto`);
                        });

                        // 아코디언이 닫힐 때
                        collapseElement.addEventListener('hidden.bs.collapse', () => {
                            document.body.style.height = '100%';
                            console.log(`${collapseId} is closed, body height set to auto`);
                        });
                    } else {
                        console.error(`Collapse element ${collapseId} not found!`);
                    }
                });
            });
            
            
            
        </script>
	<script src="/resources/js/filter.js"></script>

</body>
</html>
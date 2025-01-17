<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전기차 정보 게시판</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- 풋터 css -->
<link rel="stylesheet" href="/resources/css/footer.css">
<!-- 풋터 css -->
</head>
<style>
/* 화면 꽉차게 */
html, body { /* 게시판 css 추가 */
    height: 100%; 
    margin: 0;
    display: flex;
    flex-direction: column;
} /* 게시판 css 추가 */

:root { 
	--primary-color: #50B0FF; 
	--hover-color: #37a1f8;
}

body {
	background-color: #f8f9fa;
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, sans-serif;
}

.container {
	max-width: 768px;
	margin: 0 auto;
	flex: 1 0 auto; /* 콘텐츠가 늘어날 수 있도록 설정 */ /* 게시판 css 추가 */
	padding-bottom: 87px; /* 게시판 css 추가 */
}

::-webkit-scrollbar { /* 게시판 css 추가 */
    display: none;
}/* 게시판 css 추가 */

@media ( max-width : 768px) {/* 게시판 css 추가 */
	.container {
		padding-right: 0px;
		padding-left: 0px;
		padding-bottom: 60px;
	}
}

/* 헤더 스타일 */
.mainhead {
	background: white;
	padding: 2vh 0;
}

.logo img {
	max-height: 6vh;
	display: block;
	margin: 0 auto;
	cursor: pointer;
}

.menu-icon {
	font-size: 6vh;
	cursor: pointer;
	visibility: hidden;
}

.bot_brd {
	height: 4px;
	background: linear-gradient(to bottom, #d6edff, rgba(214, 237, 255, 0));
}

/* 게시판 컨테이너 스타일 수정 */
.board-container {
	background: white;
	border-radius: 0;
	box-shadow: none;
	padding: 2rem 1rem;
}

@media ( min-width : 768px) {
	.board-container {
		padding: 2rem;
	}
}

.page-title {
	color: #2c3e50;
	font-weight: 700;
	margin-bottom: 2rem;
	font-size: 1.5rem;
}

.board-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	padding: 1rem 0.5rem;
	color: #495057;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

@media ( min-width : 768px) {
	.page-title {
		font-size: 2rem;
	}
}

/* 탭 네비게이션 */
.nav-tabs {
	border-bottom: 2px solid #eee;
	margin-bottom: 1.5rem;
	flex-wrap: nowrap;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
}

.nav-tabs::-webkit-scrollbar {
	display: none;
}

.nav-tabs .nav-link {
	border: none;
	color: #6c757d;
	font-weight: 500;
	padding: 0.7rem 1rem;
	white-space: nowrap;
	border-radius: 10px 10px 0 0;
	transition: all 0.2s ease;
}

@media ( min-width : 768px) {
	.nav-tabs .nav-link {
		padding: 0.7rem 1.2rem;
	}
}

.nav-tabs .nav-link:hover {
	color: var(--primary-color);
	background-color: #f8f9fa;
}

.nav-tabs .nav-link.active {
	color: var(--primary-color);
	border-bottom: 2px solid var(--primary-color);
	font-weight: 600;
}

/* 검색바 */
.search-container {
	background: white;
	border-radius: 10px;
	padding: 0.5rem;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	width: 100%;
	margin-bottom: 1rem;
}

.search-form {
	display: flex;
	flex-wrap: wrap;
	gap: 0.5rem;
}

@media ( max-width : 767px) {
	.search-form .form-select, .search-form .form-control, .search-form .btn
		{
		width: 100%;
	}
}

@media ( min-width : 768px) {
	.search-form {
		flex-wrap: nowrap;
	}
	.search-form .form-select {
		width: auto;
	}
	.search-form .form-control {
		min-width: 300px;
	}
}

/* 테이블 & 카드 뷰 */
.board-table {
	display: none;
}

.board-cards {
	display: block;
}

@media ( min-width : 768px) {
	.board-table {
		display: table;
		border-collapse: separate;
		border-spacing: 0;
		width: 100%;
		border-radius: 10px;
		overflow: hidden;
		margin-top: 1.5rem;
	}
	.board-cards {
		display: none;
	}
}
/* 테이블 뷰 폰트 크기 조정 */
.board-table th, .board-table td {
	font-size: 1rem; /* 폰트 크기 조정 */
	text-align: center; /* 내용 가운데 정렬 */
	vertical-align: middle; /* 세로 가운데 정렬 */
}

/* 모바일 카드 뷰 폰트 크기 및 정렬 */
.board-card .card-title {
	font-size: 1rem; /* 카드 제목 폰트 크기 */
}

.board-card .card-meta {
	font-size: 0.85rem; /* 카드 메타 정보 폰트 크기 */
	display: flex;
	justify-content: center;
	gap: 1rem; /* 각 정보 간격 */
}

.board-card .category-tag {
	font-size: 0.8rem; /* 카테고리 태그 폰트 크기 */
}

.board-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	padding: 1rem;
	color: #495057;
}

.board-table td {
	padding: 1rem;
	border-top: 1px solid #f1f3f5;
	vertical-align: middle;
}

.board-table tr:hover {
	background-color: #f8f9fa;
}

/* 모바일 카드 뷰 */
.board-card {
	background: white;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1rem;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.board-card .card-title {
	font-size: 1.1rem;
	margin-bottom: 0.5rem;
	color: #2c3e50;
}

.board-card .card-meta {
	font-size: 0.9rem;
	color: #6c757d;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 0.5rem;
}

.board-card .category-tag {
	background-color: #f8f9fa;
	padding: 0.2rem;
	border-radius: 5px;
	font-size: 0.85rem;
	color: #495057;
}

/* 버튼 */
.custom-btn {
	background-color: var(--primary-color);
	border: none;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.2s ease;
	width: 90px;
}

.custom-btn:hover {
	background-color: var(--hover-color);
	transform: translateY(-1px);
}

/* 페이지네이션 */
.pagination {
	justify-content: center;
	gap: 0.3rem;
	margin: 2rem 0 1rem 0;
}

.pagination .page-link {
	border: none;
	padding: 0.5rem 1rem;
	color: #495057;
	font-weight: 500;
	border-radius: 8px;
}

@media ( max-width : 767px) {
	.pagination .page-link {
		padding: 0.4rem 0.8rem;
	}
}

.pagination .page-link:hover {
	background-color: #f8f9fa;
	color: var(--primary-color);
}

.pagination .page-item.active .page-link {
	background-color: var(--primary-color);
	color: white;
}

.dropdown-menu {
	border: none;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.dropdown-item {
	padding: 0.7rem 1.2rem;
}

.dropdown-item:hover {
	background-color: #f8f9fa;
	color: var(--primary-color);
}

/* 유틸리티 */
.actions-container {
	display: flex;
	flex-direction: column-reverse;
	gap: 1rem;
}

@media ( min-width : 768px) {
	.actions-container {
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
	}
}

.write-button-container {
	bottom: 2rem;
	right: 2rem;
	z-index: 1000;
}

.write-button-container .custom-btn {
	width: auto;
	padding: 0.7rem 1.5rem;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 767px) {
	.write-button-container {
		bottom: 2rem;
		right: 2rem;
		z-index: 1000;
	}
	.write-button-container .custom-btn {
		width: auto;
		padding: 0.7rem 1.5rem;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}
}

.badge.bg-noti.text-noti {
	font-size: 0.9rem;
	padding: 0.3rem 0.5rem;
	border-radius: 4px;
	font-weight: bold;
	background-color: #F6B426;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 영역 -->
		<div class="mainhead">
			<div class="row mx-3 align-items-center">
				<div class="col d-flex align-items-center justify-content-between">
					<!-- 로고 -->
					<div class="logo" onclick="location.href='/';">
						<img src="../../resources/assets/icon/logo.png" alt="Logo" class="img-fluid">
					</div>
					<!-- 메뉴 아이콘 -->
					<i class="bi bi-list menu-icon" id="toggleOffcanvas"></i>
				</div>
			</div>
			<div class="bot_brd mt-3 mb-4" style="width: 100% !important;"></div>
		</div>
		<div class="board-container">
			<h1 class="page-title">전기차 정보 게시판</h1>

			<!-- 카테고리 탭 -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a
					class="nav-link ${selectedCategory == 'all' ? 'active' : ''}"
					href="/board/list?cateNo=all&sort=${selectedSort}"> 전체 </a></li>
				<li class="nav-item"><a
					class="nav-link ${selectedCategory == '1' ? 'active' : ''}"
					href="/board/list?cateNo=1&sort=${selectedSort}"> 자유 </a></li>
				<li class="nav-item"><a
					class="nav-link ${selectedCategory == '2' ? 'active' : ''}"
					href="/board/list?cateNo=2&sort=${selectedSort}"> 정보 </a></li>
				<li class="nav-item"><a
					class="nav-link ${selectedCategory == '3' ? 'active' : ''}"
					href="/board/list?cateNo=3&sort=${selectedSort}"> 추천 </a></li>
				<li class="nav-item"><a
					class="nav-link ${selectedCategory == '4' ? 'active' : ''}"
					href="/board/list?cateNo=4&sort=${selectedSort}"> 질문 </a></li>
			</ul>

			<!-- 검색 & 정렬 영역 -->
			<div class="actions-container">

				<!-- 검색 바 -->
				<form action="/board/list" method="get" class="search-form">
					<!-- 현재 탭 카테고리 값을 hidden input으로 추가 -->
					<input type="hidden" name="cateNo" value="${selectedCategory}">
					<select name="searchType" class="form-select w-auto">
						<option value="all" ${param.searchType == 'all' ? 'selected' : ''}>전체</option>
						<option value="title" ${param.searchType == 'title' ? 'selected' : ''}>제목</option>
						<option value="content"	${param.searchType == 'content' ? 'selected' : ''}>내용</option>
						<option value="writer" ${param.searchType == 'writer' ? 'selected' : ''}>작성자</option>
					</select>
						<input type="text" name="searchWord" value="${param.searchWord}" class="form-control" placeholder="검색어를 입력하세요">
					<button type="submit" class="btn btn-primary custom-btn">검색</button>
				</form>

				<!-- 정렬 드롭다운 -->
				<div class="sort-dropdown">
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown"	aria-expanded="false">
						정렬:
						<c:choose>
							<c:when test="${selectedSort == 'hit'}">조회수</c:when>
							<c:when test="${selectedSort == 'recommend'}">추천수</c:when>
							<c:otherwise>최신순</c:otherwise>
						</c:choose>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="?cateNo=${selectedCategory}&sort=recent&searchType=${param.searchType}&searchWord=${param.searchWord}">최신순</a></li>
						<li><a class="dropdown-item" href="?cateNo=${selectedCategory}&sort=hit&searchType=${param.searchType}&searchWord=${param.searchWord}">조회수순</a></li>
						<li><a class="dropdown-item" href="?cateNo=${selectedCategory}&sort=recommend&searchType=${param.searchType}&searchWord=${param.searchWord}">추천수순</a></li>
					</ul>
				</div>
			</div>


			<!-- PC 테이블 뷰 -->
			<table class="table board-table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 5%">카테고리</th>
						<th style="width: 40%">제목</th>
						<th style="width: 25%">작성자</th>
						<th style="width: 15%">작성일</th>
						<th style="width: 5%">추천수</th>
						<th style="width: 5%">조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.boNo}</td>
							<td><c:if test="${board.isNotice == 'Y'}">
									<span class="badge bg-noti text-noti">공지</span>
									<!-- 공지 표시 -->
								</c:if>
									<c:if test="${board.isNotice != 'Y'}">
                    					${board.cateNm} 
                    					<!-- 일반 카테고리 -->
								</c:if>
							</td>
							<td class="text-start">
								<a class="text-decoration-none text-dark" href="/board/view?boNo=${board.boNo}">${board.boTitle}</a>
								<span class="text-primary">[${board.calculatedCommentCount}]</span>
							</td>

							<td>${board.nickname}</td>
							<td><fmt:formatDate value="${board.boRegDate}" pattern="yy.MM.dd" /></td>
							<td>${board.boRecommend}</td>
							<td>${board.boHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 모바일 카드 뷰 -->
			<div class="board-cards">
				<c:forEach var="board" items="${boardList}">
					<div class="board-card">
						<div class="category-tag mb-3">
							<c:if test="${board.isNotice == 'Y'}">
								<span class="badge bg-noti text-noti">공지</span>
								<!-- 공지 표시 -->
							</c:if>
							<c:if test="${board.isNotice != 'Y'}">
                    			${board.cateNm} 
                    			<!-- 일반 카테고리 -->
							</c:if>
						</div>
						<h2 class="card-title">
							<a href="/board/view?boNo=${board.boNo}" class="text-decoration-none text-dark"> ${board.boTitle}</a>
							<span class="text-primary">[${board.calculatedCommentCount}]</span>
						</h2>
						<div class="card-meta">
							<span>${board.nickname}</span>
							<span><fmt:formatDate value="${board.boRegDate}" pattern="yyyy-MM-dd" /></span>
						</div>
						<div class="card-meta mt-2">
							<span>조회 ${board.boHit}</span>
							<span>추천${board.boRecommend}</span>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 페이징 & 글 작성 버튼 -->
			<div class="d-flex justify-content-between align-items-center mt-3">

				<c:if test="${paging.totalPages >= 0}">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${paging.hasPrevPageGroup}">
								<li class="page-item">
									<a class="page-link" href="?page=${paging.startPage - 1}&searchType=${searchType}&searchWord=${searchWord}&cateNo=${selectedCategory}&sort=${selectedSort}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
								<li class="page-item ${i == paging.currentPage ? 'active' : ''}">
									<a class="page-link" href="?page=${i}&searchType=${searchType}&searchWord=${searchWord}&cateNo=${selectedCategory}&sort=${selectedSort}">
										${i}
									</a>
								</li>
							</c:forEach>
							<c:if test="${paging.hasNextPageGroup}">
								<li class="page-item">
									<a class="page-link" href="?page=${paging.endPage + 1}&searchType=${searchType}&searchWord=${searchWord}&cateNo=${selectedCategory}&sort=${selectedSort}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</c:if>


				<!-- 글쓰기 버튼 -->
				<div class="write-button-container" onclick="handleWriteClick();">
					<button class="btn btn-primary custom-btn">글 작성</button>
				</div>
			</div>
		</div>
		
		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
		
	</div>
	
	
	
	<!-- 부트스트랩 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    const isUserLoggedIn = "${sessionScope.login != null ? 'true' : 'false'}";
    console.log('isUserLoggedIn:', isUserLoggedIn); // 디버깅용 로그
    function handleWriteClick() {
        if (isUserLoggedIn === 'true') {
            // 로그인 상태에서는 글 작성 페이지로 이동
            window.location.href = '/board/form';
        } else {
            // 로그인 상태가 아니면 확인창 띄우기
            const userConfirmed = confirm('로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?');
            if (userConfirmed) {
                window.location.href = '/loginView'; // 로그인 페이지로 이동
            }
        }
    }
    window.onpageshow = function(event) {
        if (event.persisted) {
            // 브라우저의 캐시된 페이지가 로드된 경우 강제 새로고침
            window.location.reload();
        }
    };
	</script>
</body>
</html>

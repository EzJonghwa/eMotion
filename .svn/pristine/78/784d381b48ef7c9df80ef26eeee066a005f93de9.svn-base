<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- pwa -->
<link rel="manifest" href="/manifest.json">
<script src="${pageContext.request.contextPath}/main.js"></script>
<!-- pwa -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 프레임 워크 jquery and bootStrap-->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- 프레임 워크 jquery and bootStrap-->

<!-- 카카오 맵 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>MainPage</title>
</head>

<style>
	/* 화면 꽉차게 */
	html, body {
		height: 100%;
	}
	/* body안의 메인 컨텐츠 가운데에 위치 */
	body {
		display: flex;
		justify-content: center;
		background-color: #f8f9fa;
		/*푸터 높이만큼 여백 추가 */
		/* 철규 수정 */
	}
	
	body::-webkit-scrollbar {
		display: none;
	}
	
	/* 스크롤바 제거를 위한 css */
	.cont::-webkit-scrollbar {
		display: none;
	}

	.mainhead {
		margin-top: calc(env(safe-area-inset-top) + 2vh);
		/* 상단 안전 영역 고려 */
	}

	.logo img {
		max-height: 6vh;
		/* 로고 크기 설정 */
		display: block;
		margin: 0 auto;
		cursor: pointer;
	}

	.menu-icon {
		font-size: 6vh;
		/* 메뉴 아이콘 크기 */
		cursor: pointer;
	}

	/* main 컨텐츠 css   */
	.cont {
		background-color: white;
		width: 744px;
		height: 100%;
		-ms-overflow-style: none;
		/* 인터넷 익스플로러 */
		scrollbar-width: none;
		/* 파이어폭스 */
	}

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
	/* 메인 화면에서 다른 화면으로 이동하는 박스 사이즈 */
	.box_size {
		border-radius: 8px;
		cursor: pointer;
		height: 24vh;
		padding: 0.5rem 1rem;
		/* 위쪽 여백 줄이기 */
		margin-bottom: 20px;
		background-size: cover;
		/* 배경 이미지 크기 */
		background-position: center;
		/* 배경 이미지 위치 */
		background-repeat: no-repeat;
		display: flex;
		flex-direction: column;
		/* 아이콘과 텍스트를 세로 정렬 */
		align-items: flex-start;
		/* 왼쪽 정렬 */
		justify-content: flex-start;
		/* 상단 정렬 */
		color: white;
		font-weight: bold;
		text-shadow: 0px 0px 4px rgba(0, 0, 0, 0.5);
		transition: transform 0.2s;
	}


	/* 박스 안의 텍스트 */
	.textmenu {
		align-items: flex-start;
		/* 세로 정렬 */
		font-size: clamp(12px, 1.5vw, 20px);
		/* 최소 16px, 최대 24px 사이로 반응형 크기 */
		color: white;
		font-weight: 1000;
		gap: 0.5rem;
		/* 아이콘과 텍스트 간격 */
	}

	.textmenu i {
		font-size: 1.5rem;
		/* 아이콘 크기 */
	}

	.textmenu span {
		font-size: clamp(14px, 1.2vw, 18px);
		/* 반응형 텍스트 크기 */
		line-height: 1.2;
		/* 텍스트 줄 간격 */
		margin: 0;
		/* 기본 마진 제거 */
	}


	/* 모바일 화면에서 버튼 높이와 텍스트 크기 조정 */
	@media (max-width: 768px) {
		.box_size {
			height: 15vh;
			padding: 0.8rem;
		}

		.textmenu i {
			font-size: 1.2rem;
		}

		.textmenu span {
			font-size: 14px;
		}
	}

	/* 캐러셀 박스 */
	.box2 {
		aspect-ratio: 16 / 9;
		max-height: 32vh;
		height: 100%;
		background-color: #C9EEFF;
		border-radius: 8px;
		/* 둥근 테두리 */
		overflow: hidden;
		/* 자식 요소 잘리도록 설정 */
	}

	.carousel-control-prev,
	.carousel-control-next {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		/* 수직 가운데 정렬 */
		width: 2rem;
		/* 화살표 버튼 크기 */
		height: 3rem;
		z-index: 1;
	}

	/* 캐러셀 아이템의 배경 스타일 */
.carousel-item {
    background-size: contain; /* 이미지를 컨테이너에 맞게 조정하며 비율 유지 */
    background-repeat: no-repeat; /* 이미지 반복 제거 */
    background-position: center center; /* 이미지가 컨테이너의 가운데에 위치하도록 설정 */
    width: 100%; /* 부모의 너비에 맞춤 */
    height: 100%; /* 부모의 높이에 맞춤 */
}

/* 캐러셀 아이템의 이미지 스타일 */
.carousel-item img {
    width: 100%;
    height: 100%; /* 부모 컨테이너의 높이에 꽉 차게 설정 */
    object-fit: cover; /* 이미지 비율 유지하며 컨테이너에 맞게 확대 */
    object-position: center; /* 이미지 중심을 기준으로 정렬 */
    display: block;
    border-radius: 8px; /* 둥근 테두리 유지 (필요 시 제거 가능) */
}
	/* 캐러셀 컨테이너 높이 */
	.carousel-inner {
		height: 100%;
		/* 캐러셀 전체 높이를 부모 요소에 맞춤 */
	}

	.box_size2 {
		border-radius: 8px;
		cursor: pointer;
		height: 24vh;
		background-size: cover;
		/* 배경 이미지 크기 */
		background-position: center;
		/* 배경 이미지 위치 */
		background-repeat: no-repeat;
		display: flex;
		flex-direction: column;
		/* 아이콘과 텍스트를 세로 정렬 */
		align-items: flex-start;
		/* 왼쪽 정렬 */
		justify-content: flex-start;
		/* 상단 정렬 */
		color: white;
		font-weight: bold;
		text-shadow: 0px 0px 4px rgba(0, 0, 0, 0.5);
		transition: transform 0.2s;
		padding: 0;
	}

	.box1 {
		aspect-ratio: 16 / 9;
		/* 16:9 비율 유지 */
		max-height: 32vh;
		/* 최대 높이를 설정 */
		height: 100%;
		/* 부모 요소 높이에 맞춤 */
		background-color: #C9EEFF;
		/* 기본 배경색 */
	}


	/* 모바일 화면에서 높이 제한 */
	@media (max-width: 768px) {
		.box1 {
			max-height: 16vh;
			/* 모바일 화면에서는 더 낮은 높이 설정 */
			aspect-ratio: 16 / 9;
			/* 동일한 비율 유지 */
		}
	}

	/* 모바일 화면에서 박스 간 여백 추가 */
	@media (max-width: 768px) {
		.box_size {
			height: 16vh;
			/* 모바일에서 박스 높이 줄이기 */
			font-size: 0.8rem;
			/* 텍스트 크기 줄이기 */
			padding: 0.5rem;
			/* 안쪽 여백 줄이기 */
		}

		.box_size:hover {
			transform: scale(1);
			/* 모바일에서는 hover 효과 최소화 */
		}
	}

	/* 모바일 화면에서 높이 제한 */
	@media (max-width: 768px) {
		.box2 {
			max-height: 20vh;
			/* 모바일 화면에서는 더 낮은 높이 설정 */
			aspect-ratio: 16 / 9;
			/* 동일한 비율 유지 */
		}

		.box_size2 {
			height: 20vh;
			/* 모바일에서 박스 높이 줄이기 */
			font-size: 0.8rem;
			/* 텍스트 크기 줄이기 */
		}
	}

	/* 맵으로 이동하는 부분 */
	.box_size.mapimg {
		height: 30vh;
		min-height: 100px;
		max-height: 400px;
		background-image: url('assets/img/img.png');
		background-size: cover;
	}

	/* 마우스 올리면 크기 변화 */
	.box_size:hover {
		transform: scale(0.99);
	}

	/* HEADER 와 메인 사이의 파란색 줄 */
	.bot_brd {
		height: 4px;
		/* 영역 높이 */
		background: linear-gradient(to bottom, #d6edff, rgba(214, 237, 255, 0));
		/* 위에서 아래로 흐려짐 */
	}

	.footer-nav {
		/* 철규 수정 */
		position: fixed;
		/* 화면 하단에 고정 */
		bottom: 0;
		/* 화면 하단 */
		left: 50%;
		/* 화면의 가운데 기준으로 정렬 */
		transform: translateX(-50%);
		/* 가운데 정렬 */
		width: 744px;
		/* 부모 컨테이너의 폭에 맞춤 */
		z-index: 1050;
		/* 다른 요소 위로 배치 */
		background-color: #ffffff;
		/* 배경색 */
	}

	.footer-nav .btn {
		border: none;
		background: none;
		color: #6c757d;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		transition: color 0.2s;
	}

	.footer-nav .btn:hover {
		color: #007bff;
	}

	.footer-nav .btn i {
		font-size: 1.5rem;
		margin-bottom: 0.2rem;
	}

	.footer-nav .btn span {
		font-size: 1rem;
	}

	/* 모바일 화면에서 크기 조정 */
	@media (max-width: 768px) {
		.footer-nav .btn i {
			font-size: 1rem;
			/* 아이콘 크기 축소 */
		}

		.footer-nav .btn span {
			font-size: 0.75rem;
			/* 글씨 크기 축소 */
		}

		.footer-nav .btn {
			padding: 0.1rem;
			/* 간격 축소 */
		}

		.footer-nav {
			/* 철규 수정 */
			width: 100%;
			/* 부모 컨테이너의 폭에 맞춤 */
			max-width: 768px;
			/* 최대 폭 제한 */
		}
	}

	/* 철규 수정 */
</style>
<style>
	
	/* 오프캔버스 신버전 메뉴 */
	/* 오프캔버스 메뉴 */
    .offcanvas-menu-login-on {
        position: fixed;
        /* 화면 상단에서 숨겨놓고, 가운데 정렬 */
        top: 0;
        left: 50%;
        transform: translateX(-50%) translateY(-100%);
        
        /* 헤더/콘텐츠와 동일한 최대 폭 */
        width: 744px;
        /* max-width: 46.5rem;*/ 
        height: 350px; /* 원하는 만큼 높이 조절 */
        background: #fff;
        z-index: 1001;
        transition: transform 0.3s ease;
    }
	
	.offcanvas-menu-login-off {
        position: fixed;
        /* 화면 상단에서 숨겨놓고, 가운데 정렬 */
        top: 0;
        left: 50%;
        transform: translateX(-50%) translateY(-100%);
        
        /* 헤더/콘텐츠와 동일한 최대 폭 */
        width: 744px;
        /* max-width: 46.5rem;*/ 
        height: 500px; /* 원하는 만큼 높이 조절 */
        background: #fff;
        z-index: 1001;
        transition: transform 0.3s ease;
    }

    .offcanvas-menu-login-on.show {
        /* 열릴 때는 Y축을 0으로 */
        transform: translateX(-50%) translateY(0);
    }

	.offcanvas-menu-login-off.show {
        /* 열릴 때는 Y축을 0으로 */
        transform: translateX(-50%) translateY(0);
    }

    /* 오버레이 */
    .menu-overlay {
        position: fixed;
        top: 0; left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        opacity: 0;
        visibility: hidden;
        transition: 0.3s;
        z-index: 1000;
    }
    .menu-overlay.show {
        opacity: 1;
        visibility: visible;
    }
	
	.login-content {
	    position: fixed;
	    left: 0;
	    right: 0; /* 좌우를 0으로 설정해 중앙에 맞춤 */
	    margin: 0 auto; /* 중앙 정렬 */
	    width: calc(100% - 2rem); /* 좌우 여백을 감안한 너비 */
	    max-width: 744px; /* 최대 너비 제한 */
	    overflow-y: auto; /* 스크롤 동작 유지 */
	    scrollbar-width: none; /* Firefox 스크롤바 숨김 */
	    max-height: 70%; /* 원하는 높이 설정 */
	    box-sizing: border-box; /* 패딩 포함 크기 계산 */
	}
	
	.login-content::-webkit-scrollbar {
	    display: none; /* Chrome, Safari에서 스크롤바 숨김 */
	}
	
	.brdimg {
		width: 8.125rem;
		height: 8.125rem;
		border-radius: 50%;
		overflow: hidden;
		padding: 0;
	} 
	
	@media (max-width: 768px) {
	    /* 오프캔버스 메뉴 크기 조정 */
	    .offcanvas-menu-login-on {
	        width: 100%; /* 화면 전체 너비에 맞춤 */
	        max-width: 100%; /* 최대 너비 제한 제거 */
	        height: 350px; /* 높이를 줄임 */
	        top: auto; /* 상단 고정 제거 */
	        transform: translateX(-50%) translateY(-100%); /* 기본 위치로 변경 */
	    }
	
	    .offcanvas-menu-login-off {
	        width: 100%; /* 화면 전체 너비에 맞춤 */
	        max-width: 100%; /* 최대 너비 제한 제거 */
	        height: 500px; /* 높이를 줄임 */
	        top: auto; /* 상단 고정 제거 */
	        transform: translateX(-50%) translateY(-100%); /* 기본 위치로 변경 */
	    }
	
	    /* 로그인 컨텐츠 크기 조정 */
	    .login-content {
	        width: calc(100% - 1rem); /* 좌우 여백 줄임 */
	        max-width: 100%; /* 최대 너비 제한 제거 */
	        max-height: 71%; /* 높이 제한 줄임 */
	        font-size: 0.9rem; /* 글꼴 크기 줄임 */
	        line-height: 1.2; /* 줄 간격 조정 */
	    }
	
	    /* 프로필 이미지 크기 줄임 */
	    .login-content .brdimg {
	        width: 6rem; /* 작은 화면에서 이미지 크기 줄임 */
	        height: 6rem;
	    }
	
	    /* 버튼 크기 조정 */
	    .btn-outline-danger {
	        font-size: 0.85rem; /* 버튼 텍스트 크기 줄임 */
	        padding: 0.5rem 0.8rem; /* 패딩 조정 */
	    }
		
		.btn-primary {
			font-size: 0.70rem; /* 버튼 텍스트 크기 줄임 */
		}
		
	    /* 텍스트 크기 조정 */
	    .login-content span {
	        font-size: 1.00rem; /* 텍스트 크기 축소 */
	    }
	
	    /* 메뉴 항목 크기 조정 */
	    .row.px-3.py-3 {
	        padding: 0.5rem 0.5rem; /* 메뉴 항목의 패딩 줄임 */
	    }
	
	    .row.px-3.py-3 .col {
	        font-size: 1rem; /* 메뉴 항목 텍스트 크기 줄임 */
	    }
	
	    /* 오버레이 크기 조정 */
	    .menu-overlay {
	    	position: fixed;
	        top: 0; left: 0;
	        width: 100%;
	        height: 100%;
	        background: rgba(0,0,0,0.5);
	        opacity: 0;
	        visibility: hidden;
	        transition: 0.3s;
	        z-index: 1000;
	    }
	    
	    .fs-3{
	    	font-size: 1.2rem !important;
	    }
	}
	
	@media (max-width: 375px) {
	    /* 오프캔버스 메뉴 크기 조정 */
	    .offcanvas-menu-login-on {
	        width: 100%; /* 화면 전체 너비에 맞춤 */
	        max-width: 100%; /* 최대 너비 제한 제거 */
	        height: 350px; /* 높이를 줄임 */
	        top: auto; /* 상단 고정 제거 */
	        transform: translateX(-50%) translateY(-100%); /* 기본 위치로 변경 */
	    }
	
	    .offcanvas-menu-login-off {
	        width: 100%; /* 화면 전체 너비에 맞춤 */
	        max-width: 100%; /* 최대 너비 제한 제거 */
	        height: 350px; /* 높이를 줄임 */
	        top: auto; /* 상단 고정 제거 */
	        transform: translateX(-50%) translateY(-100%); /* 기본 위치로 변경 */
	    }
	    .login-content{
	    	max-height: 59%;
	    }
	    .fs-3{
	    	font-size: 1.0rem !important;
	    }
	}
	
</style>

<body>

	<div class="cont offmain overflow-y-auto">
		<!--서령수정-->
		<div class="mainhead mb-3">
		
			<div class="row mx-3 align-items-center">
				<div class="col d-flex align-items-center justify-content-between">
					<!-- 로고 -->
					<div class="logo" onclick="location.href='${pageContext.request.contextPath}/';">
						<img src="${pageContext.request.contextPath}/resources/assets/icon/logo.png" alt="Logo" class="img-fluid">
					</div>
					<!-- 메뉴 아이콘 -->
					<i class="bi bi-list menu-icon" id="menuButton"></i>
				</div>
			</div>
			
		</div>
		<!--서령수정-->
		<div class="bot_brd mt-3 mb-4"></div>
		<!--탑 영역 끝 -->
		<!--메인 영역 시작-->
		<div class="mainbody px-4">
			<div class="row mb-4">
				<div onclick="location.href='#'"
					class="col box_size2 box2 carousel slide align-items-center justify-content-center"
					id="carouselExampleControls" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/resources/assets/img/mainSlide_01.jpg" class="d-block w-100" alt="광고 영역 1">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/resources/assets/img/mainSlide_02.jpg" class="d-block w-100" alt="광고 영역 2">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/resources/assets/img/mainSlide_03.jpg" class="d-block w-100" alt="광고 영역 3">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon fw-semibold" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>


			<div class="row row-cols-2 row-cols-md-2 g-2 g-md-3">
				<!-- 첫 번째 버튼 -->
				<div class="col-12 col-md">
					<div onclick="location.href='/map'" class="textmenu box_size"
						style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/charger_locator.png');">
						<div class="textmenu">
							<i class="bi bi-geo-alt"></i> <!-- 아이콘 -->
							<span>충전소 및 서비스센터 길 찾기</span> <!-- 텍스트 -->
						</div>
					</div>
				</div>
				<!-- 두 번째 버튼 -->
				<div class="col-12 col-md">
					<div onclick="location.href='/filter'" class="textmenu box_size"
						style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/purchase_guide.png');">
						<div class="textmenu">
							<i class="bi bi-lightbulb"></i>
							<span>전기차 구매 추천 가이드</span>
						</div>
					</div>
				</div>
				<!-- 세 번째 버튼 -->
				<div class="col-12 col-md">
					<div onclick="location.href='./board/list'" class="textmenu box_size"
						style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/info_board.png');">
						<div class="textmenu">
							<i class="bi bi-journal"></i>
							<span>전기차 정보 게시판</span>
						</div>
					</div>
				</div>
				<!-- 네 번째 버튼 -->
				<div class="col-12 col-md">
					<div onclick="location.href='/routinemain'" class="textmenu box_size"
						style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/energy_saving_analysis.png');">
						<div class="textmenu">
							<i class="bi bi-graph-up"></i>
							<span>나의 루틴 에너지 절감량 분석</span>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- 네비게이션 영역 --
		<div class="footer-nav pb-2">
			<div class="bot_brd"></div>
			<div class="d-flex justify-content-between text-center">
				<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/'">
					<i class="bi bi-house-door"></i>
					<span>홈</span>
				</button>
				<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/map'">
					<i class="bi bi-geo-alt"></i>
					<span>길찾기</span>
				</button>
				<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/myLikeList'">
					<i class="bi bi-heart"></i>
					<span>관심전기차</span>
				</button>
				<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/loginView'">
					<i class="bi bi-gear"></i>
					<span>로그인</span>
				</button>
			</div>
		</div> -->
	</div>
	
	<!-- 오프캔버스 신버전 -->
	<!-- 오프캔버스 메뉴 오버레이 -->
    <div class="menu-overlay" id="menuOverlay"></div>

    <!-- 오프캔버스 메뉴 -->
    <div class="${sessionScope.login == null ? 'offcanvas-menu-login-on' : 'offcanvas-menu-login-off'}" id="offcanvasMenu">
        <div class="offcanvas-custom" id="customOffcanvas">
            <div class="container-fluid">
                <div class="row d-flex align-items-center py-5">
                    <div class="col text-start">
                        <h3 class="mb-0 ms-4">마이페이지</h3>
                    </div>
                    <div class="col-auto">
                        <button type="button" class="btn-close align-self-center me-3" id="closeOffcanvas" aria-label="Close"></button>
                    </div>
                </div>
                
                <div class="row">
                    <hr style="border-top: 0.125rem dashed black;">
                </div>
                
                <!-- 로그인 안 했을 때 -->
                <c:if test="${sessionScope.login == null }">
	                <div class="login-content" style="">
	                    <div class="row px-3 d-flex align-items-center py-3">
	                        <div class="brdimg">
	                            <img src="../resources/assets/img/loginImg.png" id="myImage" class="img-fluid shadow-sm w-100 h-100" style="cursor: default;" alt="임시 프로필">
	                        </div>
	                        <div class="col fs-4">
	                            <span>로그인 하신 후<br>이용하실 수 있는 서비스입니다.</span>
	                            <br><br>
	                            <a href="/loginView"><span>로그인하기</span></a>
	                        </div>
	                    </div>
	                </div>
    			</c:if>
    			
                <!-- 로그인 했을 때 -->
                <c:if test="${sessionScope.login != null }">
	                <div class="login-content" style="display: block;">
	                    <div class="row px-3 d-flex align-items-center py-3">
	                        <div class="brdimg">
	                        	<c:if test="${sessionScope.login.profileImg == null}">
									<img src="${pageContext.request.contextPath}/assets/img/non.png" id="userImage" class="img-fluid shadow-sm w-100 h-100" style="cursor: pointer;" alt="프로필 이미지">
								</c:if>
								<c:if test="${sessionScope.login.profileImg != null}">
									<img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}" id="userImage" class="img-fluid shadow-sm w-100 h-100" style="cursor: pointer;" alt="프로필 이미지">
								</c:if>
	                        </div>
	                        <div class="col fs-4">
	                            <span class="user-name fw-bold">${sessionScope.login.nickName}님</span><br>
	                            <span class="user-email">
	                            	<c:if test="${sessionScope.login.kakaoYn eq 'N' }">${sessionScope.login.email}(이메일계정)</c:if>
					  				<c:if test="${sessionScope.login.kakaoYn eq 'Y' }">${sessionScope.login.email}(카카오계정)</c:if>
	                            </span>
	                            <div class="mt-1">
		                            <a href="${pageContext.request.contextPath}/messagesViewDo?receiverEmail=${sessionScope.login.email}" class="btn btn-primary"> <i class="bi bi-chat-dots"></i>
										쪽지함
									</a>
									<span id="messageBadge"></span>
									<button class="btn btn-primary" id="subscribeBtn">푸시 알람 구독하기!</button>
									<input type="hidden" id="userId"
										value="${sessionScope.login.email}">
									<input type="hidden" value="${vapidPublicKey}" id="key">
								</div>
	                        </div>
	                    </div>
	    
	                    <!-- 로그인 시 메뉴 항목들 -->
	                    <c:if test="${sessionScope.login.kakaoYn eq 'N' }">
	                    	<div class="row px-3 py-3" onclick="location.href='${pageContext.request.contextPath}/mypageRewrite'" style="cursor: pointer;">
		                        <div class="col">
		                            <span class="fs-3">개인정보 수정</span>
		                        </div>
		                        <div class="col d-flex justify-content-end">
		                            <span class="fs-2">&gt;</span>
		                        </div>
		                        <hr>
	                    	</div>
						</c:if>
						<c:if test="${sessionScope.login.kakaoYn eq 'Y' }">
							<div class="row px-3 py-3" onclick="location.href='${pageContext.request.contextPath}/kakaomypageRewrite'" style="cursor: pointer;">
		                        <div class="col">
		                            <span class="fs-3">개인정보 수정</span>
		                        </div>
		                        <div class="col d-flex justify-content-end">
		                            <span class="fs-2">&gt;</span>
		                        </div>
		                        <hr>
	                    	</div>
						</c:if>
	    
	                    <div class="row px-3 py-3" onclick="location.href='${pageContext.request.contextPath}/saveListView'" style="cursor: pointer;">
	                        <div class="col">
	                            <span class="fs-3">보유 차량 정보</span>
	                        </div>
	                        <div class="col d-flex justify-content-end">
	                            <span class="fs-2">&gt;</span>
	                        </div>
	                        <hr>
	                    </div>
	    
	                    <div class="row px-3 py-3" onclick="location.href='${pageContext.request.contextPath}/myLikeList'" style="cursor: pointer;">
	                        <div class="col">
	                            <span class="fs-3">저장한 전기차 목록</span>
	                        </div>
	                        <div class="col d-flex justify-content-end">
	                            <span class="fs-2">&gt;</span>
	                        </div>
	                        <hr>
	                    </div>
	    
	                    <div class="row mb-5 px-3">
	                        <button class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/logoutDo'">로그아웃</button>
	                    </div>
	                </div>
                </c:if>
    
                
            </div>
        </div>
    </div>
	<!-- 오프캔버스 신버전 -->

<script>
    
// 문서 로드 후 실행
document.addEventListener('DOMContentLoaded', function() {
    // 오프캔버스 신버전
 	// 오프캔버스 관련 요소 가져오기
    const menuButton       = document.getElementById('menuButton');    // 열기 버튼
    const offcanvasMenu    = document.getElementById('offcanvasMenu'); // 오프캔버스
    const menuOverlay      = document.getElementById('menuOverlay');   // 오버레이
    const closeOffcanvasBtn= document.getElementById('closeOffcanvas');// 닫기 버튼

    // 오프캔버스 열기
    menuButton.addEventListener('click', function() {
        offcanvasMenu.classList.add('show');
        menuOverlay.classList.add('show');
    });

    // 오프캔버스 닫기 함수
    function closeOffcanvas() {
        offcanvasMenu.classList.remove('show');
        menuOverlay.classList.remove('show');
    }

    // 닫기 버튼 및 오버레이 클릭 시 닫기
    closeOffcanvasBtn.addEventListener('click', closeOffcanvas);
    menuOverlay.addEventListener('click', closeOffcanvas);
    
    $(document).ready(function () {
        $.ajax({
            url: '/checkUnreadMessages',
            type: 'GET',
            success: function (hasUnread) {
                if (hasUnread) {
                    $('#messageBadge').html('<span class="badge bg-danger ms-2">NEW</span>');
                }
            },
            error: function () {
                console.error('안 읽은 쪽지 확인 중 오류 발생');
            }
        });
    });
    
});

</script>
</body>
</html>
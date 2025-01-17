<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <!-- SmartEditor -->
    <script src="${pageContext.request.contextPath}/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js"></script>
    
    <!-- 풋터 css -->
	<link rel="stylesheet" href="/resources/css/footer.css">
	<!-- 풋터 css -->
    
    <style>
        :root {
            --primary-color: #50B0FF;
            --hover-color: #37a1f8;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
        }
		
		::-webkit-scrollbar { /* 게시판 css 추가 */
		    display: none;
		}/* 게시판 css 추가 */

        .container {
            max-width: 768px;
            margin: 0 auto;
        }

		@media ( max-width : 768px) {/* 게시판 css 추가 */
			.container {
				padding-right: 0px;
				padding-left: 0px;
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

        /* 메인 컨테이너 스타일 */
        .write-container {
            background: white;
            padding: 2rem;
        }

        .page-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 2rem;
            font-size: 1.5rem;
        }

        /* 폼 요소 스타일 */
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 0.7rem;
            transition: all 0.2s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(80, 176, 255, 0.25);
        }

        .form-control[readonly] {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }

        /* 버튼 스타일 */
        .btn-cs {
            padding: 0.7rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
        }

        .btn-primary:hover {
            background-color: var(--hover-color);
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: #e9ecef;
            border: none;
            color: #495057;
        }

        .btn-secondary:hover {
            background-color: #dee2e6;
            color: #212529;
            transform: translateY(-1px);
        }

        /* 에디터 컨테이너 */
        #smart_editor2 {
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        /* Select 스타일 */
        .form-select {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }

        .form-select:focus {
            border-color: var(--primary-color);
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(80, 176, 255, 0.25);
        }

        /* 반응형 조정 */
        @media (max-width: 768px) {
            .write-container {
                padding: 1.5rem;
            }

            .page-title {
                font-size: 1.3rem;
            }

            .btn {
                padding: 0.6rem 1.2rem;
            }
        }

        /* placeholder 스타일 */
        ::placeholder {
            color: #adb5bd;
            opacity: 1;
        }
        
    </style>
</head>
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

        <!-- 메인 컨테이너 -->
        <div class="write-container">
            <h1 class="page-title">게시글 작성</h1>

            <!-- 작성자 표시 -->
            <div class="mb-4">
                <label for="writerInput" class="form-label">작성자</label>
                <c:choose>
                    <c:when test="${not empty sessionScope.login}">
                        <input type="text" class="form-control" id="writerInput" name="nickname" 
                               value="${sessionScope.login.nickName}" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="form-control" id="writerInput" 
                               value="로그인이 필요합니다" readonly>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 글쓰기 폼 -->
            <form action="/board/writeDo" method="POST" enctype="multipart/form-data" onsubmit="return fn_check()">
                <!-- 카테고리 선택 -->
                <div class="mb-4">
                    <label for="categorySelect" class="form-label">카테고리</label>
                    <select class="form-select" id="categorySelect" name="cateNo" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="1">자유</option>
                        <option value="2">정보</option>
                        <option value="3">추천</option>
                        <option value="4">질문</option>
                    </select>
                </div>

                <!-- 제목 입력 -->
                <div class="mb-4">
                    <label for="titleInput" class="form-label">제목</label>
                    <input type="text" class="form-control" id="titleInput" name="boTitle"
                           placeholder="제목을 입력하세요" required>
                </div>

                <!-- 내용 입력 -->
                <div class="mb-4">
                    <label for="boContent" class="form-label">내용</label>
                    <textarea id="boContent" name="boContent" style="width:100%; min-height:300px;"></textarea>
                </div>

                <!-- 버튼 영역 -->
                <div class="d-flex justify-content-end gap-2">
                    <button type="button" class="btn btn-secondary btn-cs" onclick="history.back()">취소</button>
                    <button type="submit" class="btn btn-primary btn-cs">등록</button>
                </div>
            </form>
        </div>
        
        <!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- SmartEditor 설정 스크립트 -->
    <script>
        var oEditors = [];
        $(document).ready(function() {
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "boContent",
                sSkinURI: "<c:url value='/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html' />",
                htParams: {
                    bUseToolbar: true,
                    bUseVerticalResizer: true,
                    bUseModeChanger: true,
                    bSkipXssFilter: true
                },
                fCreator: "createSEditor2",
                fOnAppLoad: function() {
                    // 에디터 초기화 후 실행
                    const iframe = document.querySelector("iframe");
                    if (iframe) {
                        iframe.setAttribute("scrolling", "auto");
                    }
                }
            });
        });

        function fn_check() {
            oEditors.getById["boContent"].exec("UPDATE_CONTENTS_FIELD", []);
            const content = document.getElementById("boContent").value;

            if (!content || content.trim() === "" || content === "&nbsp;" || content === "<p>&nbsp;</p>") {
                alert("내용을 입력하세요!");
                return false;
            }
            return confirm("작성 글을 등록하시겠습니까?");
        }
        
    </script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- 풋터 css -->
<link rel="stylesheet" href="/resources/css/footer.css">
<!-- 풋터 css -->
</head>
<style>
:root { 
	--primary-color: #50B0FF;
	--hover-color: #37a1f8;
}

body {
	background-color: #f8f9fa;
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, sans-serif;
}

::-webkit-scrollbar { /* 게시판 css 추가 */
	display: none;
} /* 게시판 css 추가 */

.container {
	max-width: 768px;
	margin: 0 auto;
	background-color: white; /* 원하는 배경색 */
    background-clip: content-box; /* 배경색을 콘텐츠 영역으로 제한 */
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

/* 게시글 컨테이너 */
.board-container {
	background: white;
	border-radius: 0;
	box-shadow: none;
	padding: 2rem 1rem;
}

.page-title {
	color: #2c3e50;
	font-weight: 700;
	margin-bottom: 2rem;
	font-size: 1.5rem;
}

/* 게시글 헤더 */
.post-header {
	border-bottom: 1px solid #eee;
	padding-bottom: 1rem;
	margin-bottom: 1rem;
}

.post-title {
	font-size: 1.5rem;
	font-weight: 600;
	color: #2c3e50;
	margin-top: 6px;
}

.post-meta {
	color: #6c757d;
	font-size: 0.9rem;
}

.author-info {
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.author-img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover;
}

/* 게시글 내용 */
.post-content {
	padding: 1.5rem 0;
	min-height: 200px;
}

/* 추천 버튼 */
.recommend-btn {
	background-color: white;
	border: 2px solid #ABABAB;
	color: #ABABAB;
	padding: 0.5rem 2rem;
	border-radius: 8px;
	font-weight: 500;
	transition: all 0.2s ease;
}

.recommend-btn:hover {
	background-color: white;
	border: 2px solid #F6B426;
	color: #F6B426;
}

.recommend-btn.clicked {
	background-color: white;
	border: 2px solid #F6B426;
	color: #F6B426;
}

/* 댓글 영역 */
.comments-container {
	background: white;
	border-radius: 10px;
	padding: 1.5rem;
	margin-top: 2rem;
}

.comment-form textarea {
	border-radius: 8px;
	resize: none;
	height: 100px;
}

.comment-item {
	padding: 1rem 0;
	border-bottom: 1px solid #eee;
}

.comment-author {
	font-weight: 500;
	color: var(--primary-color);
}

.comment-actions {
	font-size: 0.9rem;
}

.comment-actions button {
	padding: 0.2rem 0.5rem;
	font-size: 0.85rem;
}

/* 이전/다음 글 네비게이션 */
.post-navigation {
	background: white;
	border-radius: 10px;
	margin-top: 1rem;
}

.post-navigation .nav-item {
	padding: 1rem;
	border-bottom: 1px solid #eee;
}

.post-navigation .nav-label {
	color: #6c757d;
	margin-right: 1rem;
}

/* 버튼 스타일 */
.custom-btn {
	background-color: var(--primary-color);
	color: #ffffff;
	border: none;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.2s ease;
}

.custom-btn:hover {
	background-color: var(--hover-color);
	transform: translateY(-1px);
}

/* 팝오버 스타일 */
.popover {
	border: none;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.popover-header {
	background: white;
	border: none;
	padding: 1rem;
	text-align: center;
}

.popover-body {
	padding: 1rem;
}

/* 반응형 조정 */
@media ( max-width : 767px) {
	.container {
		padding: 0;
	}
	.board-container {
		border-radius: 0;
	}
	.post-title {
		font-size: 1.3rem;
	}
}

.comment-form {
	display: flex;
	align-items: center;
}

.comment-form .form-control {
	flex: 1; /* 텍스트 박스가 가능한 공간을 차지 */
	height: 40px; /* 텍스트 박스 높이 설정 */
	resize: none; /* 크기 조정 비활성화 */
	line-height: 1.5; /* 텍스트 수직 정렬 */
}

.comment-form .btn {
	height: 40px; /* 버튼 높이 설정 */
	padding: 0 1rem; /* 버튼 안쪽 여백 설정 */
	display: flex;
	align-items: center;
	justify-content: center;
}

/* 스마트 에디터 내 이미지 반응형 처리 */
.post-content img, #boContent img {
	max-width: 100%; /* 부모 컨테이너를 넘지 않도록 설정 */
	height: auto; /* 이미지 비율 유지 */
	display: block; /* 블록 요소로 변경 */
	margin: 0 auto; /* 이미지 중앙 정렬 */
}

.comment-list .mb-3 {
    background-color: white;
}	

</style>

<body>
	<div class="container">
		<!-- 헤더 영역 	-->
		<div class="mainhead">
			<div class="row mx-3 align-items-center">
				<div class="col d-flex align-items-center justify-content-between">
					<!-- 로고 -->
					<div class="logo" onclick="location.href='/';">
						<img src="../../resources/assets/icon/logo.png" alt="Logo"
							class="img-fluid">
					</div>
					<!-- 메뉴 아이콘 -->
					<i class="bi bi-list menu-icon" id="toggleOffcanvas"></i>
				</div>
			</div>
			<div class="bot_brd mt-3 mb-4" style="width: 100% !important;"></div>
		</div>

		<div class="board-container border rounded">
			<!-- 게시글 헤더 -->
			<div class="post-header">
				<div class="d-flex justify-content-between align-items-start mb-3">
					<div class="d-flex justify-content-between align-items-center">
						<!-- 카테고리 -->
						<span class="badge bg-secondary me-2">[${board.cateNm}]</span>
						<!-- 제목 -->
						<h1 class="post-title d-inline">${board.boTitle}</h1>
					</div>
				</div>
				<!-- 오른쪽: 작성일 -->
				<div>
					<div>
						<span class="text-secondary">작성일: <fmt:formatDate
								value="${board.boRegDate}" pattern="yyyy-MM-dd HH:mm" />
						</span>
					</div>
					<c:if test="${board.boModDate != null}">
						<div>
							<span class="text-secondary">수정일: <fmt:formatDate
									value="${board.boModDate}" pattern="yyyy-MM-dd HH:mm" />
							</span>
						</div>
					</c:if>
				</div>
			</div>
			<!-- 프로필 이미지와 조회수 -->
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex align-items-center">
					<span class="text-secondary me-2">작성자:</span>
					<c:if test="${not empty board.profileImg}">
						<!-- 게시글 작성자의 프로필 사진 -->
						<img src="${pageContext.request.contextPath}${board.profileImg}"
							class="rounded-circle me-2" alt="${board.nickname}" width="40"
							height="40" />
					</c:if>
					<c:if test="${empty board.profileImg}">
						<!-- 기본 프로필 이미지 -->
						<img src="${pageContext.request.contextPath}/assets/img/non.png"
							class="rounded-circle me-2" alt="${board.nickname}" width="40"
							height="40" />
					</c:if>

					<span class="fw-bold text-primary" data-user-id="${board.email}"
						data-bs-toggle="popover" data-bs-trigger="click"
						title="
          <div style='font-size: 1em; text-align: center; line-height: 1.2em;'>
              ${board.nickname}<br>
              <span style='font-size: 0.85em; line-height: 1.1em;'>(${board.email})</span>
          </div>"
						data-bs-html="true"
						data-bs-content="
          <div class='text-center'>
              <c:choose>
                  <c:when test='${sessionScope.login != null && sessionScope.login.email == board.email}'>
                      <span class='text-primary fw-bold my-messages-link' style='cursor: pointer;'>나의 쪽지함 ▶</span>
                  </c:when>
                  <c:otherwise>
                      <span class='text-primary fw-bold send-msg-text' style='cursor: pointer;'>쪽지 보내기 ▶</span>
                      <div class='message-form' style='display:none; margin-top: 10px;' data-user-id='${board.email}'>
                          <textarea class='form-control mb-2' placeholder='쪽지 내용을 입력하세요'></textarea>
                          <button class='btn btn-sm custom-btn send-msg-final'>전송</button>
                      </div>
                  </c:otherwise>
              </c:choose>
          </div>"
						style="color: blue;"> ${board.nickname} </span>


				</div>
				<div>
					<span class="text-secondary">조회수: <span id="view-count">${board.boHit}</span></span>
				</div>
			</div>
			<hr class="my-4" />
			<!-- 게시글 내용 -->
			<div class="post-content">${board.boContent}</div>


			<!-- 추천 버튼 -->
			<div class="d-flex justify-content-center mt-4">
				<button id="recommend-btn"
					class="btn btn-lg recommend-btn ${hasUserRecommended ? 'clicked' : ''}"
					data-bo-no="${board.boNo}">
					추천 <span id="recommend-count" class="ms-2">${board.boRecommend}</span>
				</button>
			</div>
			<!-- 수정 및 삭제 버튼 -->
			<c:if test="${sessionScope.login != null && sessionScope.login.email != board.email}">
				<div class="d-flex justify-content-start gap-2 mb-4">
					<!-- 목록 버튼 -->
					<a href="/board/list" class="btn btn-outline-secondary">목록</a>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.login != null && sessionScope.login.email == board.email}">
				<div class="d-flex justify-content-end gap-2 mb-4">
					<!-- 목록 버튼 -->
					<a href="/board/list" class="btn btn-outline-secondary me-auto">목록</a>
					<!-- 수정 버튼 -->
					<a href="/board/editForm?boNo=${board.boNo}" class="btn btn-outline-secondary">수정</a>
					<!-- 삭제 버튼 -->
					<form action="/board/deleteDo" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
						<input type="hidden" name="boNo" value="${board.boNo}">
						<button type="submit" class="btn btn-outline-danger">삭제</button>
					</form>
				</div>
			</c:if>

		</div>



		<div class="post-navigation mb-4 border rounded">
			<ul class="list-group list-group-flush py-2">
				<li class="list-group-item d-flex justify-content-start"><span
					class="text-muted me-2">이전 글</span> <c:choose>
						<c:when test="${prevPost != null}">
							<a href="/board/view?boNo=${prevPost.boNo}"
								class="text-decoration-none">${prevPost.boTitle}</a>
						</c:when>
						<c:otherwise>
							<span class="text-muted">이전 글이 없습니다.</span>
						</c:otherwise>
					</c:choose></li>
				<li class="list-group-item d-flex justify-content-start"><span
					class="text-muted me-2">다음 글</span> <c:choose>
						<c:when test="${nextPost != null}">
							<a href="/board/view?boNo=${nextPost.boNo}"
								class="text-decoration-none">${nextPost.boTitle}</a>
						</c:when>
						<c:otherwise>
							<span class="text-muted">다음 글이 없습니다.</span>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

		<!-- 댓글 입력 -->
		<c:choose>
			<c:when test="${not empty sessionScope.login}">
				<form class="comment-form d-flex align-items-center"
					action="/comments/addDo" method="post">
					<input type="hidden" name="boNo" value="${board.boNo}">
					<div class="input-group mb-3">
						<textarea name="coContent" class="form-control"
							placeholder="댓글을 입력하세요" required></textarea>
						<button type="submit" class="btn custom-btn">작성</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<div class="alert text-center" role="alert">
					댓글 작성은 로그인 후 이용 가능합니다. <a href="/loginView" class="alert-link">로그인</a>
					하시겠습니까?
				</div>
			</c:otherwise>
		</c:choose>

		<!-- 댓글 목록 -->

		<h5 class="mb-3">
			댓글 <span class="text-primary">[${commentList.size()}]</span>
		</h5>
		<div class="bg-white border rounded p-3 comment-list">
			<c:choose>
				<c:when test="${empty commentList}">
					<p class="text-center text-muted">첫 번째 댓글을 남겨 보세요!</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="comment" items="${commentList}">
						<c:if test="${comment.coParentId == null}">

							<!-- 원댓글 -->
							<div class="comment-wrapper parent-comment mb-4">
								<div
									class="comment-header d-flex justify-content-between align-items-center">
									<div class="d-flex align-items-center">
										<c:if test="${not empty comment.profileImg}">
											<img
												src="${pageContext.request.contextPath}${comment.profileImg}"
												class="rounded-circle me-2" alt="${comment.nickname}"
												width="30" height="30" />
										</c:if>
										<c:if test="${empty comment.profileImg}">
											<img
												src="${pageContext.request.contextPath}/assets/img/non.png"
												class="rounded-circle me-2" alt="${comment.nickname}"
												width="30" height="30" />
										</c:if>
										<div>

											<span class="comment-author fw-bold text-primary"
												data-user-id="${comment.email}" data-bs-toggle="popover"
												data-bs-trigger="click"
												title="<div style='font-size: 1em; text-align: center; line-height: 1.2em;'>${comment.nickname}<br><span style='font-size: 0.85em; line-height: 1.1em;'>(${comment.email})</span></div>"
												data-bs-html="true"
												data-bs-content="
          <div class='text-center'>
              <c:choose>
                  <c:when test='${sessionScope.login != null && sessionScope.login.email == comment.email}'>
                      <span class='text-primary fw-bold my-messages-link' style='cursor: pointer;'>나의 쪽지함 ▶</span>
                  </c:when>
                  <c:otherwise>
                      <span class='text-primary fw-bold send-msg-text' style='cursor: pointer;'>쪽지 보내기 ▶</span>
                      <div class='message-form' style='display:none; margin-top: 10px;' data-user-id='${comment.email}'>
                          <textarea class='form-control mb-2' placeholder='쪽지 내용을 입력하세요'></textarea>
                          <button class='btn btn-sm custom-btn send-msg-final'>전송</button>
                      </div>
                  </c:otherwise>
              </c:choose>
          </div>"
												style="color: blue;"> ${comment.nickname} </span> <small
												class="text-muted d-block"> <fmt:formatDate
													value="${comment.coModDate != null ? comment.coModDate : comment.coRegDate}"
													pattern="yyyy-MM-dd HH:mm" /> <c:if
													test="${comment.coModDate != null}">
													<span>(수정됨)</span>
												</c:if>
											</small>
										</div>
									</div>
									<div>
										<c:if test="${sessionScope.login != null}">
											<button class="btn btn-sm btn-outline-secondary me-1"
												onclick="addReply('${comment.coNo}', this)">답글</button>
										</c:if>
										<c:if
											test="${sessionScope.login != null && sessionScope.login.email == comment.email}">
											<button class="btn btn-sm btn-outline-secondary me-1"
												onclick="updateComment('${comment.coNo}')">수정</button>
											<button class="btn btn-sm btn-outline-danger"
												onclick="deleteComment('${comment.coNo}')">삭제</button>
										</c:if>
									</div>
								</div>


								<div class="comment-body mt-2 ps-3">
									<c:choose>
										<c:when test="${comment.coDelYn == 'Y'}">
											<span class="text-secondary"><i>삭제된 댓글입니다.</i></span>
										</c:when>
										<c:otherwise>
											<span>${comment.coContent}</span>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 답글 폼 컨테이너 -->
								<div class="reply-form-container ps-4"></div>
								<!-- 대댓글 -->
								<div class="recomment-wrapper mt-3 ps-5">
									<c:forEach var="reply" items="${commentList}">
										<c:if test="${reply.coParentId == comment.coNo}">
											<div class="comment-wrapper reply-comment mb-3">
												<div
													class="comment-header d-flex justify-content-between align-items-center">
													<div class="d-flex align-items-center">
														<c:if test="${not empty reply.profileImg}">
															<img
																src="${pageContext.request.contextPath}${reply.profileImg}"
																class="rounded-circle me-2" alt="${reply.nickname}"
																width="30" height="30" />
														</c:if>
														<c:if test="${empty reply.profileImg}">
															<img
																src="${pageContext.request.contextPath}/assets/img/non.png"
																class="rounded-circle me-2" alt="${reply.nickname}"
																width="30" height="30" />
														</c:if>
														<div>

															<span class="comment-author fw-bold text-primary"
																data-user-id="${reply.email}" data-bs-toggle="popover"
																data-bs-trigger="click"
																title="<div style='font-size: 1em; text-align: center; line-height: 1.2em;'>${reply.nickname}<br><span style='font-size: 0.85em; line-height: 1.1em;'>(${reply.email})</span></div>"
																data-bs-html="true"
																data-bs-content="
													          <div class='text-center'>
													              <c:choose>
													                  <c:when test='${sessionScope.login != null && sessionScope.login.email == reply.email}'>
													                      <span class='text-primary fw-bold my-messages-link' style='cursor: pointer;'>나의 쪽지함 ▶</span>
													                  </c:when>
													                  <c:otherwise>
													                      <span class='text-primary fw-bold send-msg-text' style='cursor: pointer;'>쪽지 보내기 ▶</span>
													                      <div class='message-form' style='display:none; margin-top: 10px;' data-user-id='${reply.email}'>
													                          <textarea class='form-control mb-2' placeholder='쪽지 내용을 입력하세요'></textarea>
													                          <button class='btn btn-sm custom-btn send-msg-final'>전송</button>
													                      </div>
													                  </c:otherwise>
													              </c:choose>
													          </div>"
																style="color: blue;"> ${reply.nickname} </span> <small
																class="text-muted d-block"> <fmt:formatDate
																	value="${reply.coModDate != null ? reply.coModDate : reply.coRegDate}"
																	pattern="yyyy-MM-dd HH:mm" /> <c:if
																	test="${reply.coModDate != null}">
																	<span>(수정됨)</span>
																</c:if>
															</small>
														</div>
													</div>
													<div>
														<!-- 대댓글이 아닌 경우에만 답글 버튼 표시 -->
														<c:if test="${reply.coParentId == null}">
															<button class="btn btn-sm btn-outline-secondary me-1"
																onclick="addReply('${reply.coNo}', this)">답글</button>
														</c:if>
														<c:if
															test="${sessionScope.login != null && sessionScope.login.email == reply.email}">
															<button class="btn btn-sm btn-outline-secondary me-1"
																onclick="updateComment('${reply.coNo}')">수정</button>
															<button class="btn btn-sm btn-outline-danger"
																onclick="deleteComment('${reply.coNo}')">삭제</button>
														</c:if>
													</div>
												</div>


												<div class="comment-body mt-2 ps-3">
													<c:choose>
														<c:when test="${reply.coDelYn == 'Y'}">

															<span class="text-secondary me-2">@${comment.nickname}</span>
															<span class="text-secondary"><i>삭제된 댓글입니다.</i></span>
														</c:when>
														<c:otherwise>

															<span class="text-secondary me-2">@${comment.nickname}</span>
															<span>${reply.coContent}</span>
														</c:otherwise>
													</c:choose>
												</div>

												<!-- 답글 폼 컨테이너 -->
												<div class="reply-form-container"></div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
	</div>
	<script>
		let currentReplyForm = null;
	    // JSP에서 JavaScript로 로그인 상태 전달
	    const isUserLoggedIn = '<c:out value="${sessionScope.login != null}" />';

		// 댓글 수정
		function updateComment(commentId) {
			const content = prompt("수정할 댓글 내용을 입력하세요:");
			if (content !== null && content.trim() !== "") {
				const form = document.createElement("form");
				form.action = "/comments/updateDo";
				form.method = "post";

				const coNoInput = document.createElement("input");
				coNoInput.type = "hidden";
				coNoInput.name = "coNo";
				coNoInput.value = commentId;

				const coContentInput = document.createElement("input");
				coContentInput.type = "hidden";
				coContentInput.name = "coContent";
				coContentInput.value = content.trim();

				form.appendChild(coNoInput);
				form.appendChild(coContentInput);
				document.body.appendChild(form);
				form.submit();
			}
		}

		// 댓글 삭제
		function deleteComment(commentId) {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				const form = document.createElement("form");
				form.action = "/comments/deleteDo";
				form.method = "post";

				const coNoInput = document.createElement("input");
				coNoInput.type = "hidden";
				coNoInput.name = "coNo";
				coNoInput.value = commentId;

				form.appendChild(coNoInput);
				document.body.appendChild(form);
				form.submit();
			}
		}

		// 대댓글 추가
		function addReply(parentId, button) {
			if (currentReplyForm) {
				currentReplyForm.remove();
				currentReplyForm = null;
			}
			const replyForm = document.createElement("div");
			replyForm.classList.add("mt-2");
			replyForm.innerHTML = '<form action="/comments/addDo" method="post" class="input-group mb-3">'
					+ '<input type="hidden" name="coParentId" value="' + parentId + '">'
					+ '<input type="hidden" name="boNo" value="${board.boNo}">'
					+ '<textarea name="coContent" class="form-control" placeholder="답글을 입력하세요" required></textarea>'
					+ '<button type="submit" class="btn custom-btn">작성</button>'
					+ '</form>';

			const parentContainer = button.closest(".comment-wrapper")
					.querySelector(".reply-form-container");
			parentContainer.appendChild(replyForm);
			currentReplyForm = replyForm;
		}

		$(document).ready(function () {
		    // 추천 버튼 클릭 이벤트
		    $('#recommend-btn').on('click', function () {
		        const boNo = $(this).data('bo-no');
		        const $button = $(this);

		        $.ajax({
		            url: '/board/recommendDo',
		            type: 'POST',
		            data: { boNo: boNo },
		            success: function (response) {
		                // 서버에서 처리 성공 시 버튼 상태와 추천 수 업데이트
		                const recommendCount = parseInt($('#recommend-count').text());
		                if ($button.hasClass('clicked')) {
		                    // 추천 취소
		                    $button.removeClass('clicked');
		                    $('#recommend-count').text(recommendCount - 1);
		                } else {
		                    // 추천 추가
		                    $button.addClass('clicked');
		                    $('#recommend-count').text(recommendCount + 1);
		                }
		            },
		            error: function (xhr) {
		                if (xhr.status === 401) {
		                    alert('로그인이 필요합니다.');
		                    window.location.href = '/loginView';
		                } else {
		                    alert('추천 처리에 실패했습니다.');
		                }
		            }
		        });
		    });
		});

		document.addEventListener('DOMContentLoaded', function () {
		    const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));

		    // 모든 팝오버 인스턴스를 저장
		    const popoverList = popoverTriggerList.map(function (triggerEl) {
		        return new bootstrap.Popover(triggerEl, {
		            container: 'body',
		            html: true,
		            sanitize: false,
		            trigger: 'manual', // 수동으로 팝오버를 열고 닫음
		        });
		    });

		    let currentPopoverTrigger = null; // 현재 열려 있는 팝오버 트리거

		    document.body.addEventListener('click', function (e) {
		        const triggerElement = e.target.closest('[data-bs-toggle="popover"]');

		        // 팝오버 트리거 클릭 시
		        if (triggerElement) {
		            const popoverInstance = bootstrap.Popover.getInstance(triggerElement);

		            // 현재 팝오버와 다르다면 기존 팝오버 닫기
		            if (currentPopoverTrigger && currentPopoverTrigger !== triggerElement) {
		                bootstrap.Popover.getInstance(currentPopoverTrigger).hide();
		            }

		            // 새 팝오버 열기
		            if (popoverInstance) {
		                const isVisible = triggerElement.getAttribute('aria-describedby'); // 팝오버가 열려 있는지 확인
		                if (isVisible) {
		                    popoverInstance.hide(); // 이미 열려 있으면 닫기
		                } else {
		                    popoverInstance.show(); // 닫혀 있으면 열기
		                    currentPopoverTrigger = triggerElement; // 현재 열려 있는 팝오버 트리거 저장
		                }
		            }

		            e.stopPropagation(); // 다른 이벤트 처리 중지
		            return;
		        }

		        // 팝오버 외부 클릭 시 모든 팝오버 닫기
		        if (!e.target.closest('.popover')) {
		            if (currentPopoverTrigger) {
		                bootstrap.Popover.getInstance(currentPopoverTrigger).hide();
		                currentPopoverTrigger = null; // 현재 열려 있는 팝오버 초기화
		            }
		        }
		    });

		    // 팝오버 내부 버튼 처리
		    document.body.addEventListener('click', function (e) {
		        // 로그인 상태 확인
		        const isUserLoggedIn = '<c:out value="${sessionScope.login != null}" />' === 'true';
		        const currentUserEmail = '<c:out value="${sessionScope.login.email}" />';
		        const targetUserEmail = e.target.closest('[data-user-id]')?.getAttribute('data-user-id');

		        // "나의 쪽지함" 클릭 시 처리
		        if (e.target.classList.contains('my-messages-link')) {
		            if (isUserLoggedIn) {
		                // "나의 쪽지함"으로 이동
		                window.location.href = '${pageContext.request.contextPath}/messagesViewDo?receiverEmail=${sessionScope.login.email}'; // 나의 쪽지함 페이지 경로
		            } else {
		                alert('로그인이 필요합니다.');
		                window.location.href = '/loginView';
		            }
		        }

		        // "쪽지 보내기" 클릭 시 처리
		        if (e.target.classList.contains('send-msg-text')) {
		            if (!isUserLoggedIn) {
		                if (confirm('쪽지 보내기는 로그인 후 이용 가능합니다. 로그인하시겠습니까?')) {
		                    window.location.href = '/loginView';
		                }
		                return;
		            }

		            // 작성자와 로그인한 사용자가 동일한 경우
		            if (targetUserEmail === currentUserEmail) {
		                alert('자신에게 쪽지를 보낼 수 없습니다.');
		                return;
		            }

		            // 로그인 상태라면 폼 보이기
		            const popoverBody = e.target.closest('.popover-body');
		            if (popoverBody) {
		                const messageForm = popoverBody.querySelector('.message-form');
		                const sendMsgButton = popoverBody.querySelector('.send-msg-text');
		                if (messageForm && sendMsgButton) {
		                    messageForm.style.display = 'block';
		                    sendMsgButton.style.display = 'none';
		                }
		            }
		        }

		        // "전송" 버튼 클릭 시 메시지 처리
		        if (e.target.classList.contains('send-msg-final')) {
		            const messageForm = e.target.closest('.message-form');
		            const popoverBody = e.target.closest('.popover-body');
		            const sendMsgButton = popoverBody.querySelector('.send-msg-text');

		            if (messageForm) {
		                const textarea = messageForm.querySelector('textarea');
		                const messageContent = textarea.value.trim();
		                const receiverEmail = messageForm.getAttribute('data-user-id');


		                if (!messageContent) {
		                    alert('쪽지 내용을 입력하세요!');
		                    return;
		                }
		                if (!receiverEmail) {
		                    alert('쪽지 받는 사람의 이메일을 확인할 수 없습니다.');
		                    return;
		                }

		                // Ajax 요청으로 쪽지 데이터 전송
		                $.ajax({
		                    url: '/sendSimpleMessage',
		                    type: 'POST',
		                    data: {
		                        receiverEmail: receiverEmail,
		                        msgContent: messageContent,
		                    },
		                    success: function () {
		                        alert('쪽지가 성공적으로 전송되었습니다!');
		                        textarea.value = ''; // 폼 초기화
		                        // 입력 폼 초기화
		                        textarea.value = '';
		                        messageForm.style.display = 'none'; // 폼 숨기기
		                        if (sendMsgButton) {
		                            sendMsgButton.style.display = 'block'; // "쪽지 보내기" 버튼 보이기
		                        }
		                        // 팝오버 닫기
		                        const popoverInstance = bootstrap.Popover.getInstance(currentPopoverTrigger);
		                        if (popoverInstance) {
		                            popoverInstance.hide();
		                        }
		                    },
		                    error: function (xhr) {
		                        if (xhr.status === 401) {
		                            alert('로그인이 필요합니다.');
		                            window.location.href = '/loginView';
		                        } else {
		                            alert('쪽지 전송 중 오류가 발생했습니다.');
		                        }
		                    },
		                });
		            }
		        }
		    });
		});

	</script>
</body>
</html>
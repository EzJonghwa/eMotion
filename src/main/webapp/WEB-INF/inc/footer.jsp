<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 네비게이션 영역 -->
<c:if test="${not empty alertMessage}">
    <script>
        alert("${alertMessage}");
    </script>
</c:if>	


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
		<c:if test="${sessionScope.login == null }">
			<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/loginView'">
				<i class="bi bi-gear"></i>
				<span>로그인</span>
			</button>
		</c:if>
		<c:if test="${sessionScope.login != null }">
			<button class="btn flex-grow-1" onclick="location.href='${pageContext.request.contextPath}/'">
				<i class="bi bi-gear"></i>
				<span>로그인</span>
			</button>
		</c:if>
	</div>
</div>

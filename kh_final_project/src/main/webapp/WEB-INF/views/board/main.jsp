<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- cs -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico"
	rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/person.css"
	rel="stylesheet">

<!-- js -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<style>
.s {
	border: 1px solid gray;
	border-radius: 5px;
	padding: 30px;
}

.s1 {
	padding: 30px;
}
</style>

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-xxl py-5">
			<div class="container bg-white p-5">
				<div class="d-flex justify-content-between align-items-center p-4">
					<h2 class="mb-0">커뮤니티</h2>
					<div>
						<sec:authorize access="isAuthenticated()">
							<button class="btn btn-outline-dark" type="button"
								onclick="writePost()">게시글 작성</button>
						</sec:authorize>
					</div>
				</div>

				<div class="s justify-content-between align-items-center">
					<h5>TOP5 인기글</h5>
					
						<div class="p-3">
						<table class="board-table">
							<c:forEach var="board" items="${topReadPost}">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank"> 
											${board.boardTitle}
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						</div>

				</div>
				
				
				<div style="padding-top: 100px;">
				<div class="s1" style="padding-bottom: 2px;">
					<div class="d-flex align-items-center p-2">
						<h5>주제별 커뮤니티</h5>
					</div>
					<div class="d-grid gap-2 d-md-block">
						<a href="${pageContext.request.contextPath}/board/postall"
							class="btn btn-outline-dark mx-1">전체글</a>
						<c:forEach var="cate" items="${UBDlist}">
							<a href="${pageContext.request.contextPath}/board/postall?cate=${cate.categoryId}"class="btn btn-outline-dark mx-1">${cate.categoryName}</a>
						</c:forEach>
					</div>
				</div>

				<div class="s1">
					<div class="row">
						<div class="col-sm-6 s">
							<h5>취업준비방</h5>
							<c:forEach var="board" items="${UBD01}">
								<div>
									<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank">${board.boardTitle}
									</a>
								</div>
							</c:forEach>
							
						</div>
						<div class="col-sm-6 s">
						<h5>신입방</h5>
							<c:forEach var="board" items="${UBD02}">
								<div>
									<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank">${board.boardTitle}
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 s">
						<h5>면접방</h5>
							<c:forEach var="board" items="${UBD03}">
								<div>
									<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank">${board.boardTitle}
									</a>
								</div>
							</c:forEach>
							</div>
						<div class="col-sm-6 s">
						<h5>질문게시판 </h5>
							<c:forEach var="board" items="${UBD04}">
								<div>
									<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank">${board.boardTitle}
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				</div>
				
				
				
			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
		function writePost() {
			location.href = "${pageContext.request.contextPath}/board/writepost";
		}
	</script>
</body>
</html>

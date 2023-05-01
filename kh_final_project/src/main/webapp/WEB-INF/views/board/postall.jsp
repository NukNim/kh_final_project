<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전체글</title>
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
<link
	href="${pageContext.request.contextPath}/resources/css/board.css"
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

</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-xxl py-5">
			<div class="container bg-white p-5">
				<div class="pb-4">
					<div class="pb-4">
					    <h2>${searchResult}</h2>
					    <span>현재까지 등록된 ${searchResult} 입니다.</span>
					</div>
				</div>
				
				<!-- 숫자 인덱스	 -->
				<div class="num-container row" id="num-container">
					<div class="col num-item">
						<h4 class="in-title">게시글 수</h4>
						<span class="nums" data-count="${totalCount }">0</span><span id="num-unit">개</span><br>
					</div>
				</div>
				
				<hr>
				<div class="s">
					<c:forEach items="${boardList}" var="board">
					<div class="p-4">
						<table class="board-table">
							<tr>
								<td class="fs-5 pb-3 fw-semibold">
								<a href="${pageContext.request.contextPath}/board/detail/${board.boardNo}" target="_blank"> 
								${board.boardTitle}
								</a>
								</td>
								
							</tr>
							<tr>
								<td class="pb-3 fw-light">${board.boardContent}</td>
								
							</tr>
							<tr>
								<td>
									<div class="d-flex justify-content-between">
										<div>
											<span class="fas fa-eye">  ${board.boardRead}  </span> 
											<span class="fas fa-heart">  ${board.boardLike}  </span>
										</div>
										<div>
											<span>${board.userId}</span> 님이 <span>${board.updateDate}</span>
											에 작성
										</div>
									</div>
								</td>
							</tr>
						</table>
					
					
					
					</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</section>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
	$(document).ready(function () {
	    $('.nums').each(function () {
	        const $this = $(this),
	            countTo = $this.attr('data-count');
	        $({
	            countNum: $this.text()
	        }).animate({
	            countNum: countTo
	        }, {
	            duration: 3000,
	            easing: 'linear',
	            step: function () {
	                $this.text(Math.floor(this.countNum));
	            },
	            complete: function () {
	                $this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	                //3자리 마다 콤마 표시 적용
	            }
	        });
	    });
	});
	</script>

</body>
</html>

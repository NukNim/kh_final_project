<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<jsp:include page="/WEB-INF/views/common/cspart.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/jspart.jsp"></jsp:include>


<!-- css file link part start -->
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico"
	rel="icon">
<%-- ${pageContext.request.contextPath} --%>
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css"
	rel="stylesheet">
<!-- css file link part end -->

<!-- js part start -->
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script
	src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

<!-- js part end -->

<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.userId {
	position: fixed;;
	top: 20px;
	right: 210px;
}

</style>



<div class="container-fluid nav-bar bg-transparent">
	<!-- 로고/사이트명 -->
	<a href="index.html"
		class="navbar-brand d-flex align-items-center text-center">
		<div class="icon p-2 me-2">
			<img class="img-fluid"
				src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png"
				alt="Icon" style="width: 30px; height: 30px;">
		</div>
		<h1 class="m-0 text-primary">JOB-A</h1>
	</a>

	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
		<!-- 좌측 메뉴 -->
		<div class="container-fluid ms-auto">
			<a class="nav-link me-3" href="#">menu</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link me-3" href="#">채용정보</a> <a class="nav-link me-3"
						href="#">인재 검색</a> <a class="nav-link me-3" href="#">커뮤니티</a>
				</div>
			</div>
		</div>

		<!-- 우측메뉴 -->
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto">
				<!-- 메뉴 구분 -->
				<a href="index.html" class="nav-item nav-link active">Home</a>

				<!-- 개인 / 기업 -->
				<sec:authorize access="hasRole('ROLE_P')">
					<div>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="user_id" />
							<a class="nav-item nav-link active" href="#" id="user_id"
								style="text-decoration: none">${user_id }</a>
						</sec:authorize>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle m-1"
							data-bs-toggle="dropdown">개인서비스</a>
						<div class="dropdown-menu rounded-0 ">
							<a href="property-list.html" class="dropdown-item">MY 홈</a> 
							<a href="${pageContext.request.contextPath}/person/resume/write?userId=${user_id}" class="dropdown-item">이력서 관리</a> 
								<a
								href="property-agent.html" class="dropdown-item">입사지원 현황</a> <a
								href="property-agent.html" class="dropdown-item">스크랩한 채용공고</a> <a
								href="property-agent.html" class="dropdown-item">관심기업 정보</a>
							<hr class="dropdown-divider">
							<a href="property-agent.html" class="dropdown-item">회원정보 관리</a>
						</div>
					</div>
				</sec:authorize>

				<sec:authorize access="hasRole('ROLE_B')">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">기업서비스</a>
						<div class="dropdown-menu rounded-0 m-0">
							<a href="testimonial.html" class="dropdown-item">기업 홈</a> <a
								href="404.html" class="dropdown-item">공고/등록 관리</a> <a
								href="404.html" class="dropdown-item">지원자 관리</a> <a
								href="404.html" class="dropdown-item">인재 관리</a> <a
								href="404.html" class="dropdown-item">기업 소개</a>
							<hr class="dropdown-divider">
							<a href="404.html" class="dropdown-item">기업회원 정보</a>
						</div>
					</div>
				</sec:authorize>
			</div>

			<!-- 로그인/ 로그아웃 -->
			<div class="nav-item nav-link active">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link me-3"
						href="${pageContext.request.contextPath}/temp/login">login</a>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<div class="logouttest">
						<form action="/job/logout" method="post">
							<button class="btn nav-link" type="submit"
								style="text-decoration: none">logout</button>
						</form>
					</div>

					<%-- <a class="nav-link me-3" href="${pageContext.request.contextPath}/">logout</a> --%>
				</sec:authorize>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
</div>






</html>
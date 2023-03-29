<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<%-- ${pageContext.request.contextPath} --%>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
    <!-- css file link part end -->
    
    <title>채용공고메인</title>
    
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
    
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
    <!-- Custom Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/admin.account.js"></script>
    <!-- js part end -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- Category Start -->
	<div class="container-xxl py-5 d-flex">
		<div class="myinfo p-2 col-3 border border-primary">
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
			안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬안녕 디지몬
		</div>
		<div class="recruitlist p-2 col-9">
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
			자 이제 시작이야 자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야자 이제 시작이야
		</div>
	</div>
	<!-- Category End -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>
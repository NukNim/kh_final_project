<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
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
    <title>배너관리</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
    
    <!-- js part end -->

</head>

<body>
    <div class="container-xxl bg-white p-0">
     
    	<jsp:include page="/WEB-INF/views/common/adheader.jsp" />
		
		 <div class="container-xl px-5">
		 	<table class="table">
		 		<thead>
		 			<tr>
		 				<th scope="col">배너  사진</th>
		 				<th scope="col">제목</th>
		 				<th scope="col">등록일</th>
		 				<th scope="col">순서</th>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			<c:forEach items="${bList }" var="list">
		 				<tr>
			 				<td>
			 					<img alt="${list.bannerSub }" src="${list.bannerThum eq null? 'https://dummyimage.com/100x100/000000/ffffff.png&text=No+Image' : list.bannerThum}" style="width: 100px; height: 100px;">
			 				</td>
			 				<td><a href="${pageContext.request.contextPath}/admin/banner/detail?id=${list.bannerId}">${list.bannerSub }</a> </td>
			 				<td>${list.registDate }</td>
			 				<td>${list.bannerSeq}</td>
		 				</tr>
		 			</c:forEach>
		 		</tbody>
		 	</table>
		 </div>

		 

        
		<%-- <%@ include file="../common/footer.jsp" %> --%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    
    <script type="text/javascript">
	
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg) {
			console.log(msg);
			alert(msg);
		}
	});
    </script>


</body>

</html>
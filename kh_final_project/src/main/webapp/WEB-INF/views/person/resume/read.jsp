<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 이력서 상세보기</title>
	<!-- cs -->
	<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/person.userId.css" rel="stylesheet">
	
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
	 
	
</head>
<body>
	
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>나의 이력서</h1>
          </div>
		  <div class="row">
			<!-- 좌측 프로필 영역 -->
			<div class="col-3">
				<div class="container-xxl py-5">
					<div class="container border border-primary">
						<div class="bg-light p-3">
							<div class="bg-white rounded p-4 row" style="border: 1px dashed rgba(0, 185, 142, .3)">
								<img class="object-fit-sm-contain border" src="https://dummyimage.com/150x200/d6d6d6/000000&text=150x200" alt="">
							</div>
							<div class="">
									<span>이름 : </span>
									<span>${userinfo.userName }</span><br>
									<span>전화번호 : </span>
									<span>${userinfo.userPhone }</span><br>
									<span>생년월일 : </span>
									<span>${userinfo.userBirth }</span><br>
									<span>이메일 : </span>
									<span>${userinfo.userEmail }</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 우측 조회 영역 -->
			<div class="col-9">
				<div class="container-xxl py-5">
					<div class="container">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<h1 class="mb-3">${resume.resumeTitle }</h1>
										작성일시 : ${resume.resumeDate }
											<div class="row g-5 mt-2 align-items-center">
												<div class="mb-4">
													<div class="h3 pb-2 border-bottom">
													 	이력서 사진 
													</div>
													<div>
														 <c:choose>
															 <c:when test="${resume.resumePhoto == 'undefined'}">
															  	<img src="https://dummyimage.com/150x200/000000/ffffff.png&text=No+Image" width="150" height="200" alt="no image">
															 </c:when>
															 <c:otherwise>
															     <img src="${resume.resumePhoto}" width="150" height="200" alt="resumePhoto">
															  </c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										
										
											<div class="row g-5 mt-2 align-items-center">
												<div class="mb-4">
													<div class="h3 pb-2 border-bottom">
														포트폴리오
													</div>
													<div>
														 <c:choose>
															 <c:when test="${resume.portfFile == null}">
															  	<span>해당 파일이 존재하지 않습니다.</span>
															 </c:when>
															 <c:otherwise>
															 	<button class="btn btn-primary" onclick="portfFileCheck()">포트폴리오 확인하기</button>
															 	<button class="btn btn-primary"  onclick="portfFileDown()">포트폴리오 다운하기</button>
															  </c:otherwise>
														</c:choose> 
													</div>
												</div>
											</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
		function portfFileCheck() {
		  window.open("https://drive.google.com/viewerng/viewer?embedded=true&url=${resume.portfFile}");
		}
		
		function portfFileDown() {
			 window.location.href = "${resume.portfFile}";
		}
		
	</script>
	
	
	
</body>
</html>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 이력서 상세보기</title>
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


</head>
<body>

	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">
		<div class="text-start mx-5 mt-5">
			<h1>나의 이력서</h1>
		</div>
		<div class="row justify-content-center align-items-center">
			<!-- 우측 조회 영역 -->
			<div class="col-9 ">
				<div class="container-xxl py-5">
					<div class="container ">
						<div class="bg-light rounded p-3">
							<div class="bg-white rounded p-4"
								style="border: 1px dashed rgba(0, 185, 142, .3)">
								<div class="row g-5 align-items-center">
									<div class="mb-4">
										<input type="hidden" id="resumeNo" value="${resume.resumeNo}" />
										<h1 class="mb-3">${resume.resumeTitle }</h1>
										<%-- 작성일시 : ${resume.resumeDate } --%>
										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-3">
												<div class="h3 pb-2 border-bottom">이력서 사진</div>
												<div class="d-flex">
													<c:choose>
														<c:when test="${resume.resumePhoto == 'undefined'}">
															<img
																src="https://dummyimage.com/150x200/000000/ffffff.png&text=No+Image"
																width="150" height="200" alt="no image">
														</c:when>
														<c:otherwise>
															<img src="${resume.resumePhoto}" width="150" height="200"
																alt="resumePhoto">
														</c:otherwise>
													</c:choose>
													<div class="ms-5 mt-3 ">
														<span>이름   : </span> <span>${resume.userName }</span><br> 
														<span>전화번호 : </span> <span>${resume.userPhone }</span><br> 
														<span>생년월일 : </span> <span>${resume.userBirth }</span><br> 
														<span>이메일  : </span> <span>${resume.userEmail }</span><br>
													</div>
												</div>
											</div>
										</div>

										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-4">
												<div class="h3 pb-2 border-bottom">포트폴리오</div>
												<div>
													<c:choose>
														<c:when test="${resume.portfFile == null}">
															<span>해당 파일이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<button class="btn btn-primary"
																onclick="portfFileCheck()">포트폴리오 확인하기</button>
															<button class="btn btn-primary" onclick="portfFileDown()">포트폴리오
																다운하기</button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>

										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-4">
												<div class="h3 pb-2 ">학력사항</div>

												<div class="h5 pb-2 border-bottom">고등학교 학력사항</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty high}">
															<span>입력된 고등학교 학력사항이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>검정고시 유무</th>
																		<th>학교명(소재지)</th>
																		<th>졸업일자</th>
																		<th>전공</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${high}" var="h">
																		<tr>
																			<c:choose>
																				<c:when test="${h.ged eq 'Y'}">
																					<td>검정고시</td>
																				</c:when>
																				<c:otherwise>
																					<td></td>
																				</c:otherwise>
																			</c:choose>
																			<td>${h.highName }</td>
																			<td>${fn:substring(h.highDate, 0, 10)}</td>
																			<td>${h.highMajor }</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</c:otherwise>
													</c:choose>
												</div>

												<div class="h5 pb-2 border-bottom">대학교 학력사항</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty uni}">
															<span>입력된 대학교 학력사항이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>졸업상태</th>
																		<th>대학교 카테고리</th>
																		<th>학교명(소재지)</th>
																		<th>졸업일자</th>
																		<th>전공</th>
																		<th>학점</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${uni}" var="u">
																		<tr>
																			<td>${u.uniAct eq 'Y' ? '졸업' : u.uniAct eq 'N' ? '재학 중' : '휴학'}</td>
																			<td>${u.uniCategory eq 'T' ? '2,3년제' : '4년제'}</td>
																			<td>${u.uniName }</td>
																			<td>${fn:substring(u.uniDate, 0, 10)}</td>
																			<td>${u.uniMajor }</td>
																			<td>${u.uniPoint }</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</c:otherwise>
													</c:choose>
												</div>

												<div class="h5 pb-2 border-bottom">대학원 학력사항</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty grad}">
															<span>입력된 대학원 학력사항이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>졸업상태</th>
																		<th>대학카테고리</th>
																		<th>학교명(소재지)</th>
																		<th>졸업일자</th>
																		<th>전공</th>
																		<th>학점</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${grad}" var="g">
																		<tr>
																			<td>${g.gradAct eq 'Y' ? '졸업' : g.gradAct eq 'N' ? '재학 중' : '휴학'}</td>
																			<td>${g.gradCategory eq 'D' ? '박사' : '석사'}</td>
																			<td>${g.gradName }</td>
																			<td>${fn:substring(g.gradDate, 0, 10)}</td>
																			<td>${g.gradMajor }</td>
																			<td>${g.gradPoint }</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</c:otherwise>
													</c:choose>
												</div>


											</div>
										</div>

										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-4">
												<div class="h3 pb-2 border-bottom">경력사항</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty career}">
															<span>입력된 경력사항이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>회사명</th>
																		<th>재직기간</th>
																		<th>직급/직책</th>
																		<th>근무부서</th>
																		<th>담당업무</th>
																		<th>연봉</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${career}" var="c">
																		<tr>
																			<td>${c.carName }</td>
																			<td>${fn:substring(c.carDate, 0, 10)}</td>
																			<td>${c.carPosition }</td>
																			<td>${c.carDept }</td>
																			<td>${c.carResp }</td>
																			<td>${c.carSalary }</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</c:otherwise>
													</c:choose>
												</div>





											</div>
										</div>

										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-4">
												<div class="h3 pb-2 border-bottom">자격증</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty certi}">
															<span>입력된 경력사항이 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
															<table class="table table-hover">
																<thead>
																	<tr>
																		<th>자격증명</th>
																		<th>발행처</th>
																		<th>취득일자</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${certi}" var="ct">
																		<tr>
																			<td>${ct.certiName }</td>
																			<td>${ct.certiPub }</td>
																			<td>${fn:substring(ct.certiDate, 0, 10)}</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</c:otherwise>
													</c:choose>
												</div>




											</div>
										</div>

										<div class="row g-5 mt-2 align-items-center">
											<div class="mb-4">
												<div class="h3 pb-2 border-bottom">자기소개서</div>
												<div class="pb-5">
													<c:choose>
														<c:when test="${empty cl}">
															<span>입력된 자기소개서가 존재하지 않습니다.</span>
														</c:when>
														<c:otherwise>
														<div class="pt-2">
															<h1 class="mb-3">${resume.resumeTitle }</h1>
															<div class="h3 pt-4 ">성장과정</div>
															<div class="card">
																<div class="card-body ">${cl.clGrowth }</div>
															</div>
															<div class="h3 pt-4 ">지원동기</div>
															<div class="card">
																<div class="card-body">${cl.clMotive }</div>
															</div>
															<div class="h3 pt-4 ">장단점</div>
															<div class="card">
																<div class="card-body">${cl.clAdv }</div>
															</div>
															<div class="h3 pt-4 ">입사 후 포부</div>
															<div class="card">
																<div class="card-body">${cl.clAsp }</div>
															</div>
														</div>
															<c:if test="${not empty cl.clFile }">
																<c:set var="clFile" value="${cl.clFile}" />
																<div class="pt-2">
																	<button class="btn btn-primary" onclick="clFileCheck()">등록한
																		자기소개서 파일 확인하기</button>
																	<button class="btn btn-primary" onclick="clFileDown()">등록한
																		자기소개서 파일 다운하기</button>
																</div>
															</c:if>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-center mb-3">
							<div>
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/business/applicant/view">지원자 목록</a>
							</div>
							<div>
								<form action="passresume" method="get">
									<input type="hidden" name="applicantId" value="${resume.userId }" />
									<input type="hidden" name="applicantResume" value="${resume.resumeNo}" />
									<input type="hidden" name="applicantNo" value="${badto.baNum}" />
									<c:choose>
										<c:when test="${badto.resultType == 'Y'}">
											<a class="btn btn-primary" href="${pageContext.request.contextPath}/business/applicant/passview">합격자 목록</a>
										</c:when>
										<c:otherwise>
											<button type="submit" class="btn btn-primary" >결과 발표</button>
										</c:otherwise>
									</c:choose>	
																
								</form>
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
			window
					.open("https://drive.google.com/viewerng/viewer?embedded=true&url=${resume.portfFile}");
		}

		function portfFileDown() {
			window.location.href = "${resume.portfFile}";
		}

		function clFileCheck() {
			window
					.open(`https://drive.google.com/viewerng/viewer?embedded=true&url=${ clFile }`);
		}

		function clFileDown() {
			window.location.href = clFile;
		}

		/* $(document).ready(function() {
		 $('#view-cl').on('click', function() {
		 var resumeNo = document.getElementById('resumeNo').value;

		 $.ajax({
		 url: '',
		 type: 'POST',
		 data: { resumeNo: resumeNo },
		 dataType: 'json',
		 success: function(response) {
		 // 서버로부터 응답으로 받은 자기소개서 정보를 이용하여 새 창에 자기소개서를 보여줍니다.
		 var newWindow = window.open('', '_blank');
		 newWindow.document.write('<html><head><title>자기소개서 확인</title></head><body>');
		 newWindow.document.write('<h1>' + response.title + '</h1>');
		 newWindow.document.write('<p>' + response.content + '</p>');
		 newWindow.document.write('</body></html>');
		 },
		 error: function(error) {
		 console.log(error);
		 }
		 });
		 });
		 });  */
	</script>



</body>
</html>
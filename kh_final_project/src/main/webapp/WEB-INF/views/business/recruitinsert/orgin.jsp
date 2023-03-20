<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<title>채용공고등록</title>

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
    
    <!-- js part end -->

<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
 </head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<h1>Step01. 담당자 정보</h1>
<section>
<div>
	<form action="<%=request.getContextPath() %>/bs/recruitinsert" method="post">
		<div>
			모집분야<input type="text" name="recruitType">
		</div>
		<div>
			경력여부
			<select name="careerType">
				<option value="begin">신입</option>
				<option value="career">경력</option>
				<option value="not">경력무관</option>
			</select>
		</div>
		<div>
			담당업무<input type="text" name="inChargeType">
		</div>
		<div>
			근무부서<input type="text" name="department">
		</div>
		<div>
			직급(직책)<input type="text" name="position">
		</div>
		<div>
			필수/우대조건<input type="text" name="coditionType" placeholder="정보처리기사자격증">
		</div>
		<div>
			지원자_학력 <input type="text" name="applicant_education" placeholder="4년제 대학교 졸업 이상">
		</div>
		<div>
			지원자_성별
			<select name="applicant_gender">
				<option value="male">남자</option>
				<option value="female">여자</option>
				<option value="not">성별무관</option>
			</select>
		</div>
		<div>
			지원자_나이<input type="text" name="applicant_age" placeholder="30세 이상">
		</div>
		<div>
			연봉<input type="text" name="salary" placeholder="회사내규에 따름">		
		</div>
		<div>
			근무형태<input type="text" name="work_type" placeholder="정규직">
		</div>
		<div>
			근무요일<input type="text" name="work_day" placeholder="월~금">
		</div>
		<div>
			근무시간<input type="text" name="work_time" placeholder="오전 9시 ~ 오후 6시">
		</div>
		<div>
			공고대표직무<input type="text" name="raRepresentativeJob" placeholder="경영·사무 ▶ 기획·전략·경영 ▶  기획">
		</div>
		<div>
			지원접수기간<input type="text" name="application_period" placeholder="2023-03-15 ~ 2023-04-30">
		</div>
		<div>
			공고방식
			<select name="raType">
				<option value="normal">일반양식</option>
				<option value="company">자사양식</option>
				<option value="blind">블라인드양식</option>
			</select>
		</div>
		<div>
			지원서접수방법
			<select name="applyType">
				<option value="joba">Job-A접수</option>
				<option value="homepage">홈페이지</option>
			</select>
		</div>
		<div>
			지원서양식
			<select name="applyFormType">
				<option value="jobaForm">Job-A이력서</option>
				<option value="companyForm">자사이력서</option>
			</select>
		</div>
		<div>
			채용제목<input type="text" name="raTitle">
		</div>
		<div>
			채용내용<textarea class="raContent" cols="30" rows="20" name="raContent"></textarea>
		</div>
		<div>
			채용절차
			<c:forEach var="num" begin="1" end="5" step="1">
				<select class="process${num }" name="raProcess${num }" ${num > 2 ? "disabled" : ""}>
					<option value="">선택안함</option>
					<c:choose>
						<c:when test="${num eq 1}">
							<option value="서류전형" selected>서류전형</option>
						</c:when>
						<c:otherwise>	
							<option value="서류전형">서류전형</option>
						</c:otherwise>
					
					</c:choose>
					<option value="인적성검사">인적성검사</option>
					<option value="1차면접">1차면접</option>
					<option value="2차면접">2차면접</option>
					<option value="최종합격">최종합격</option>
				</select>
			</c:forEach>
		</div>
		<div>
			추가제출서류
			<c:forEach var="num" begin="1" end="3" step="1">
				<select class="extra${num }" name="raExtraDocument${num }" ${num > 1 ? "disabled" : ""}>
					<option value="">선택안함</option>
					<option value="Job-A인적성검사">Job-A인적성검사</option>
					<option value="포트폴리오">포트폴리오</option>
					<option value="사전인터뷰">사전인터뷰</option>
				</select>
			</c:forEach>
		</div>
	</form>
</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</body>
</html>
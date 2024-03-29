<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회사소개페이지</title>
<!-- cs -->
<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
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

<!-- ckeditor5 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<!-- map -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>

</head>

<style>
.icon-container {
	width: 50px;
	height: 50px;
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.fa-heart {
	font-size: 24px;
}

.icon-container i.fas {
	color: red;
}
</style>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>


	<div class="container-xxl py-5">
 	<h1 class="text-center">회사소개</h1>
 	
		<!-- 회사로고, 회사명, 태그 -->
		<div class="container mt-5">
			<div class="row">
				<div class="col-1">
					<div class="icon p-2 me-2" style="float: left; margin-right: 10px;">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/template/makaan/img/icon-deal.png"
							alt="Icon" style="width: 30px; height: 30px;">
					</div>
				</div>
				<div class="col-11" style="display: flex; align-items: center;">
					<h1 class="mb-3 text-primary" style="display: inline-block;">${info.userName}</h1>
					<!-- 관심기업으로 스크랩 -->
					<sec:authorize access="hasRole('ROLE_P')">
						<div class="icon-container"
							style="margin-left: auto; margin-right: 10px;">
							<i class="far fa-heart" onclick="toggleHeart(this)"></i> <input
								type="hidden" name="companyId" value="${info.userId}" />
						</div>
					</sec:authorize>
				</div>
			</div>
		</div>
		<div class="m-4">
			<div class="row fs-4">
			<div class="col-4">
				<p><i class="bi bi-telephone-fill text-primary me-3"></i><a class="text-primary me-3">대표전화</a><a>${info.bsMainPhone}</a></p>
			</div>
			<div class="col-6">
				<p><i class="bi bi-envelope-fill text-primary me-3"></i><a class="text-primary me-3">이메일</a><a>${info.userEmail}</a></p>
			</div>
			</div>
			<!-- 회사소개  -->
			<div class="text-start mx-auto mt-3 m wow fadeInUp" data-wow-delay="0.1s">
				<c:if test="${not empty currentUserId and info.userId eq currentUserId}">
				<div class="row g-0 gx-5 align-items-end">
					<div class="col-lg-6"></div>	
					<div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
						<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
							<li class="nav-item me-2">
								<button type="button" class="btn btn-outline-primary" onclick="location.href='update?no=${info.boardNo}'">수정</button>
							</li>
							<li class="nav-item me-0">
							  <button type="button" class="btn btn-outline-primary delete">삭제</button>
							</li>
						</ul>
					</div>
				</div>	
				</c:if>
				<div class=" g-0 gx-5 align-items-end fs-4">
					<c:if test="${not empty info.tag }">
						<p><i class="bi bi-tag-fill text-primary me-3"></i><a class="text-primary">${info.tag}</a></p>
					</c:if>
					<c:if test="${not empty info.employee }">
						<p><i class="bi bi-person-fill text-primary me-3"></i><a class="text-primary me-3">직  원  수</a><a>${info.employee} 명</a></p>
					</c:if>
					<c:if test="${not empty info.salaryAvg }">
						<p><i class="bi bi-wallet text-primary me-3"></i><a class="text-primary me-3">평균연봉</a><a>${info.salaryAvg} 만원</a></p>
					</c:if>
				</div>
			</div>		
		</div>
		<div class="fs-4 p-5">
		${info.boardContent }
		</div>

					
		
		<!-- 채용중인 포지션 -->
		<div class="container mt-4">
			<div class="row g-0 gx-5 align-items-end">
				<div class="col-lg-6">
					<div class="text-start mx-auto mb-5 wow slideInLeft"
						data-wow-delay="0.1s">
						<h1 class="mb-3">채용중인포지션</h1>
					</div>
				</div>
				<div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
				</div>
			</div>
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<!-- 채용공고 -->
						<c:forEach items="${recruitList}" var="recruit" varStatus="status" begin="0" end="5">
							<div class="col-lg-4 col-md-6 wow fadeInUp "
								data-wow-delay="0.1s">
								<div class="property-item rounded overflow-hidden bg-white">
									<div class="p-4 pb-0">
										<h5 class="text-primary mb-3">${recruit.companyName }</h5>
										<a class="d-block h5 mb-2" href="">${recruit.raTitle }</a>
										<p>지원날짜 ${recruit.registDate } ~ ${recruit.closeDate }</p>
									</div>
									
									<sec:authorize access="hasRole('ROLE_P')">
										<div class="d-flex border-top">
										<small class="flex-fill text-center border-end py-2"><i
											class="fa fa-ruler-combined text-primary me-2"></i> <a
											href="/job/person/viewrecruit/${recruit.raNum }">공고보기</a></small>
										<small class="flex-fill text-center border-end py-2"><i
											class="fa fa-bed text-primary me-2"></i> <a
											href="/job/person/viewrecruit/${recruit.raNum }">지원하기</a></small>
									</div>
									</sec:authorize>
									
									<sec:authorize access="hasRole('ROLE_B')">
									<div class="d-flex border-top">
										<small class="flex-fill text-center border-end py-2"><i
											class="fa fa-ruler-combined text-primary me-2"></i> <a
											href="/job/business/recruit/view?id=${recruit.raNum }">공고보기</a></small>
									</div>
									</sec:authorize>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<br>

		<!-- 오시는길 -->
		<div class="container mt-3">
			<div class="col-12 row g-0 gx-5 align-items-end">
				<div class="text-start mx-auto mb-5 wow fadeInleft"
					data-wow-delay="0.1s">
					<h1 class="mb-3">오시는길</h1>
					<p class="fs-4">
						<i class="fa fa-map-marker-alt text-primary me-2"></i>${info.addressRoad}${bsinfo.addressJibun}
						${bsinfo.addressDetail}
					</p>
					<div class="col-12 wow fadeInleft" data-wow-delay="0.2s">
						<div id="map" class="text-center"
							style="width: 800px; height: 350px; margin-top: 10px;"></div>
					</div>
				</div>
			</div>

		</div>

		<!-- newsletter Start -->
		<div class="container">
			<div class="pt-3 text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" >
				<h1>이 회사의 뉴스레터</h1>
			</div>
			<div class="row g-4">
				<c:forEach items="${news.getPage() }" var="news" varStatus="status" begin="0" end="2">
					<div class="col-lg-4 col-sm-6 wow fadeInUp mx-auto " data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
						<a class="cat-item d-block bg-light text-center rounded p-2" href="${pageContext.request.contextPath}/board/company/newsletter/view?no=${news.boardNo }">
						<div class="rounded p-2">
						<i class="bi bi-newspaper fs-1"></i>
						<p class="fs-3">${news.boardTitle }</p> 
						</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

<script>
$(document).ready(function() {
	  $(".delete").on("click", function() {
	    if (confirm("정말 삭제하시겠습니까?")) {
	      let userId = "${info.userId}";
	      let boardNo = "${info.boardNo}";      	
	      $.ajax({ 
	        url: "${pageContext.request.contextPath}/board/company/delete"
	        , type: "post"
	        , data:  {boardNo : boardNo, userId : userId}
	        , success: function(result){
	          if(result > 0){
	            location.href="${pageContext.request.contextPath}/business/aboutus/newsletter";
	            alert("삭제되었습니다")
	          }else if(result == -2){
	            alert("아이디 정보가 맞지 않습니다.");
	          }else{
	            alert("삭제에 실패 했습니다.");
	          }
	        }
	        , error: function(e){
	          alert(e +" : 오류")
	        }
	      });
	    }
	  });
	});
</script>
	<!-- ckeditor5 -->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>

	<script>
<!-- map -->
	//회원정보의 주소로 페이지 로딩하기
	var roadAddress = "${info.addressRoad}";
	var jibunAddress = "${info.addressJibun}";
	var bsAddress = (roadAddress) ? roadAddress : jibunAddress;
	   
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    //지도를 미리 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
 	// 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(bsAddress, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">기업 위치</div>'
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
    
    //마커를 미리 생성
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    
 // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        // companyId 값 가져오기
        const companyId = $("input[name='companyId']").val();
        // AJAX를 이용해 스크랩 여부 확인
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/person/checkComScrap',
            data: {companyId: companyId},
            success: function(data) {
                // 스크랩 여부에 따라 별 상태 변경
                if(data == 1) {
                    $(".icon-container i").removeClass("far").addClass("fas");
                } else {
                    $(".icon-container i").removeClass("fas").addClass("far");
                }
            }
        });
    }

 
 
  //하트 클릭 - 관심기업 스크랩 ajax
    function toggleHeart(icon) {
      const companyId = icon.parentElement.querySelector('[name=companyId]').value;
      $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/person/checkComScrap',
        data: {companyId: companyId},
        success: function(data) {
          if (data == 0) {
            // 관심기업 추가
            $.ajax({
              type: 'POST',
              url: '${pageContext.request.contextPath}/person/scrapCompany',
              data: {companyId: companyId},
              success: function() {
                icon.classList.remove('far');
                icon.classList.add('fas');
              },
              error: function(error) {
                alert("관심기업 등록에 실패하였습니다.");
              }
            });
          } else {
            // 관심기업 삭제
            $.ajax({
              type: 'POST',
              url: '${pageContext.request.contextPath}/person/deleteCompany',
              data: {companyId: companyId},
              success: function() {
                icon.classList.remove('fas');
                icon.classList.add('far');
              },
              error: function(error) {
                alert("관심기업 삭제에 실패하였습니다.");
              }
            });
          }
        },
        error: function(error) {
          console.log(error);
        }
      });
    }
 
 
</script>
	<!-- map end -->

</body>
</html>
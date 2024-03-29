<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JOB-A 채용 정보</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/person.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/info.css" rel="stylesheet">

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

	<!-- page section -->
	<section>
	<div class="container-xxl py-5">
		<div class="container-fluid bg-white p-5">
			<div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
			    <h1>채용정보검색</h1>
				<span>현재 채용 중인 공고를 검색하세요. </span>
		    </div>
			
		</div>
		<!-- 검색 부분  -->
		<div class="container-fluid" style="background-color: #f8f9fa; min-height: 300px;">
			<div class="d-flex justify-content-center align-items-center">
				<div class="fdept flex-grow-1" style="min-height: 300px;">
					<div class="m-3 fdeptList" style="min-height: 300px;">
						<c:forEach var="fList" items="${fdeptList}">
							<div class="mx-2 fcateinfo" style="cursor:pointer;">
								<input type="hidden" class="categoryId" name="categoryId"
									value="${fList.categoryId}"> <input type="hidden"
									class="categoryName" name="categoryName"
									value="${fList.categoryName}"> <input type="hidden"
									class="categoryType" name="categoryType"
									value="${fList.categoryType}"> <input type="hidden"
									class="reqCategoryId" name="reqCategoryId"
									value="${fList.categoryId}" > ${fList.categoryName}
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="mdept flex-grow-1 " style="min-height: 300px;"></div>
				<div class="ldept flex-grow-1 " style="min-height: 300px;"></div>
			</div>

			<div class="d-grid gap-2 d-md-flex justify-content-md-end p-2 count">
				<span class="ml-auto">총 <span id="total-count">${countYAdmission }</span>
					개
				</span>
			</div>

			<!-- Check Start -->
			<div style="border: 1px solid gray; padding: 10px;">
				<div class="ED">
				  <span class="p-2">학력 : </span>
				  <c:forEach var="category" items="${edList}">
				    <div class="checkbox">
				      <input type="checkbox" id="${category.categoryId}" name="userEducation" value="${category.categoryId}">
				      <label for="${category.categoryId}"><c:out value="${category.categoryName}"/></label>
				    </div>
				  </c:forEach>
				</div>
				
				<div class="CA">
				  <span class="p-2">경력 : </span>
				  <c:forEach var="category" items="${caList}">
				    <div class="checkbox">
				      <input type="checkbox" id="${category.categoryId}" name="career" value="${category.categoryId}">
				      <label for="${category.categoryId}"><c:out value="${category.categoryName}"/></label>
				    </div>
				  </c:forEach>
				</div>
				
				<div class="SC">
				  <span class="p-2">우대조건 : </span>
				  <c:forEach var="category" items="${scList}">
				    <div class="checkbox">
				      <input type="checkbox" id="${category.categoryId}" name="conditionType" value="${category.categoryId}">
				      <label for="${category.categoryId}"><c:out value="${category.categoryName}"/></label>
				    </div>
				  </c:forEach>
				</div>

				
				<div class="ET">
				  <span class="p-2">고용형태 : </span>
				  <c:forEach var="category" items="${etList}">
				    <div class="checkbox">
				      <input type="checkbox" id="${category.categoryId}" name="empTypeCode" value="${category.categoryId}">
				      <label for="${category.categoryId}"><c:out value="${category.categoryName}"/></label>
				    </div>
				  </c:forEach>
				</div>

				
				<div class="HT">
				  <span class="p-2">근무형태 : </span>
				  <c:forEach var="category" items="${htList}">
				    <div class="checkbox">
				      <input type="checkbox" id="${category.categoryId}" name="holidayType" value="${category.categoryId}">
				      <label for="${category.categoryId}"><c:out value="${category.categoryName}"/></label>
				    </div>
				  </c:forEach>
				</div>
				

				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				    <button class="btn btn-outline-dark " id="btn-reset">초기화</button> 
				</div>
			</div>
			<!-- Check End -->

			<!-- Search Start -->
			<div class="container-fluid  wow fadeIn" data-wow-delay="0.1s"
				style="padding: 35px;">
				<div class="container">
					<div class="row g-2">
						<div class="col-md-10">
							<div class="row g-2">
								<div class="col-md-12">
									<input type="text" class="form-control border-1 py-3"
										id="search" placeholder="찾으시는 회사명, 연봉 등 원하는 조건을 검색해보세요. 검색어로 먼저 검색합니다.">
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<button class="btn btn-dark border-0 w-100 py-3 search-button">Search</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Search End -->
		</div>


		<!--  채용공고 부분 -->
		<div class="container-fluid bg-white p-5 recruit-Container">
			<c:forEach var="recruit" items="${recruitList}">
				<table class="recruit-table">
					<tr>
						<td>
							<sec:authorize access="isAuthenticated()">
								<a href="${pageContext.request.contextPath}/person/viewrecruit/${recruit.raNum}"target="_blank"> 
								<span class="bold">${recruit.companyName}</span><br><br> ${recruit.raTitle}
								</a>
							</sec:authorize>
							<sec:authorize access="!isAuthenticated()">
								  <a href="${pageContext.request.contextPath}/person/viewrecruit/${recruit.raNum}"target="_blank" onclick="showLoginAlert()">
						            <span class="bold">${recruit.companyName}</span><br><br> ${recruit.raTitle}
						          </a>
							</sec:authorize>
						</td>
					</tr>
					<tr>
						<sec:authorize access="hasAnyRole('ROLE_P')">
							<td class="star-icon" data-raNum="${recruit.raNum}"
								onclick="handleStarClick(event)"><span class="far fa-star"
								aria-hidden="true"></span> <span class="date">~${recruit.closeDate}</span>
							</td>
						</sec:authorize>
						<sec:authorize access="!isAuthenticated()">
							<td>~${recruit.closeDate}</td>
						</sec:authorize>
					</tr>

				</table>
			</c:forEach>
		</div>
	</div>
	</section>



	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- page script -->
	<script>
	
	//1단계 카테고리 
	$('.fcateinfo').on('click',function() {

				let id = $(this).find('.categoryId').val();
				let type = $(this).find('.categoryType').val();
				let reqid = $(this).find('.reqCategoryId').val();

				//2단계 
				$
						.ajax({
							url : "${pageContext.request.contextPath}/person/listmcate",
							type : "post",
							data : {
								categoryId : id
							},
							dataType : "json",
							success : function(result) {
								let htmlVal = '<div class="m-3 mdeptList" style="min-height: 300px; cursor:pointer;">';
								htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
								htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+reqid+'">';
								for (i = 0; i < result.length; i++) {
									let list = result[i];
									htmlVal += '<div class="mx-2 mcateinfo">';
									htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
									htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
									htmlVal += list.categoryName;
									htmlVal += '</div>';
								}
								htmlVal += '</div>';
								$(".mdept").html(htmlVal);
							},
							error : function(e) {
								alert(e + " : 오류")
							}

						});
			});

	//2단계 카테고리 
	$(document).on('click','.mcateinfo',function() {

				let id = $(this).find('.categoryId').val();
				let type = $(this).closest('.mdeptList').find(
						'.categoryType').val();

				//3단계
				$.ajax({
							url : "${pageContext.request.contextPath}/person/listlcate",
							type : "post",
							data : {
								categoryId : id
							},
							dataType : "json",
							success : function(result) {

								let htmlVal = '<div class="m-3  ldeptList" style="min-height: 300px; cursor:pointer;">';
								htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
								htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+id+'">';
								for (i = 0; i < result.length; i++) {
									let list = result[i];
									htmlVal += '<div class="mx-2 lcateinfo">';
									htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
									htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
									htmlVal += list.categoryName;
									htmlVal += '</div>';
								}
								htmlVal += '</div>';
								$(".ldept").html(htmlVal);
							},
							error : function(e) {
								alert(e + " : 오류")
							}
						});

			});

	//3단계 카테고리 
	$(document).on('click','.lcateinfo', function() {
				var categoryId = $(this).find('.categoryId').val();
				$.ajax({
							type : 'POST',
							url : "${pageContext.request.contextPath}/person/recruit/info",
							data : {
								categoryId : categoryId
							},
							success : function(result) {
								if (!result || result.length === 0) {
									let htmlVal = '<p>현재 채용 중인 공고가 없습니다.</p>';
									$(".recruit-Container").html(
											htmlVal);

									let totalCount = 0; // 검색 결과 총 개수
									$('#total-count').text("0");
								} else {
									// 새로운 내용 출력
									let recruitTable = '<div class="container-fluid bg-white p-5 recruit-Container">';
									for (i = 0; i < result.length; i++) {
										recruitTable += '<table class="recruit-table">';
										recruitTable += '<tr>';
										recruitTable += '<td>';
										recruitTable += '<sec:authorize access="isAuthenticated()">';
										recruitTable += '<a href="' + '${pageContext.request.contextPath}/person/viewrecruit/' + result[i].raNum + '" target="_blank">';
										recruitTable += '<span class="bold">' + result[i].companyName + '</span><br><br>' + result[i].raTitle;
										recruitTable += '</a>';
										recruitTable += '</sec:authorize>';
										recruitTable += '<sec:authorize access="!isAuthenticated()">';
										recruitTable += '<a href="' + '${pageContext.request.contextPath}/person/viewrecruit/' + result[i].raNum + '" target="_blank" onclick="showLoginAlert()">';
										recruitTable += '<span class="bold">' + result[i].companyName + '</span><br><br>' + result[i].raTitle;
										recruitTable += '</a>';
										recruitTable += '</sec:authorize>';
										recruitTable += '</td>';
										recruitTable += '</tr>';
										recruitTable += '<tr>';
										recruitTable += '<sec:authorize access="hasAnyRole(\'ROLE_P\')">';
										recruitTable += '<td class="star-icon" data-raNum="' + result[i].raNum + '" onclick="handleStarClick(event)">';
										recruitTable += '<span class="far fa-star" aria-hidden="true"></span>';
										recruitTable += '<span class="date">~' + result[i].closeDate + '</span>';
										recruitTable += '</td>';
										recruitTable += '</sec:authorize>';
										recruitTable += '<sec:authorize access="!isAuthenticated()">';
										recruitTable += '<td>~' + result[i].closeDate + '</td>';
										recruitTable += '</sec:authorize>';
										recruitTable += '</tr>';
										recruitTable += '</table>';

									}
									recruitTable += '</div>';
									$('.recruit-Container').html(
											recruitTable);

									let totalCount = result.length; // 검색 결과 총 개수
									$("#total-count").text(
											totalCount); // 검색 결과 총 개수 출력
								}
							},
							error : function() {
								alert('채용 정보를 가져오는데 실패하였습니다.');
							}
						});
			});



	//search 
	$(function() {
	 $('.search-button').click(function() {
		    var searchKeyword = $('#search').val(); // 검색창에 입력한 검색어를 가져옴
		    
		    var checkedKeywords = {};
		    $('input[type="checkbox"]:checked').each(function() {
		      var name = $(this).attr('name');
		      var value = $(this).val();
		      if (checkedKeywords[name]) {
		        checkedKeywords[name].push(value); // 이미 해당 name으로 체크된 값이 있다면, 배열에 추가
		      } else {
		        checkedKeywords[name] = [value]; // 해당 name으로 체크된 값이 없다면, 새로운 배열 생성
		      }
		    });
		    var aaa = {
			        keyword: searchKeyword,
			        checkedKeywords: checkedKeywords
			      };
		    $.ajax({
		      type : 'POST',
		      url : "${pageContext.request.contextPath}/person/search",
		      contentType:"application/json; charset=utf-8",
		      data: JSON.stringify(aaa),
	  success : function(result) {
			if (!result || result.length === 0) {
				let htmlVal = '<p>현재 채용 중인 공고가 없습니다.</p>';
				$(".recruit-Container").html(
						htmlVal);
	
				let totalCount = 0; // 검색 결과 총 개수
				$('#total-count').text("0");
			} else {
				$('.recruit-Container').empty(); // 이전 결과 지우기
	
				// 새로운 내용 출력
				let recruitTable = '<div class="container-fluid bg-white p-5 recruit-Container">';
				for (i = 0; i < result.length; i++) {
					recruitTable += '<table class="recruit-table">';
					recruitTable += '<tr>';
					recruitTable += '<td>';
					recruitTable += '<sec:authorize access="isAuthenticated()">';
					recruitTable += '<a href="' + '${pageContext.request.contextPath}/person/viewrecruit/' + result[i].raNum + '" target="_blank">';
					recruitTable += '<span class="bold">' + result[i].companyName + '</span><br><br>' + result[i].raTitle;
					recruitTable += '</a>';
					recruitTable += '</sec:authorize>';
					recruitTable += '<sec:authorize access="!isAuthenticated()">';
					recruitTable += '<a href="' + '${pageContext.request.contextPath}/person/viewrecruit/' + result[i].raNum + '" target="_blank" onclick="showLoginAlert()">';
					recruitTable += '<span class="bold">' + result[i].companyName + '</span><br><br>' + result[i].raTitle;
					recruitTable += '</a>';
					recruitTable += '</sec:authorize>';
					recruitTable += '</td>';
					recruitTable += '</tr>';
					recruitTable += '<tr>';
					recruitTable += '<sec:authorize access="hasAnyRole(\'ROLE_P\')">';
					recruitTable += '<td class="star-icon" data-raNum="' + result[i].raNum + '" onclick="handleStarClick(event)">';
					recruitTable += '<span class="far fa-star" aria-hidden="true"></span>';
					recruitTable += '<span class="date">~' + result[i].closeDate + '</span>';
					recruitTable += '</td>';
					recruitTable += '</sec:authorize>';
					recruitTable += '<sec:authorize access="!isAuthenticated()">';
					recruitTable += '<td>~' + result[i].closeDate + '</td>';
					recruitTable += '</sec:authorize>';
					recruitTable += '</tr>';
					recruitTable += '</table>';

				}
				recruitTable += '</div>';
				
				
				$('.recruit-Container').html(recruitTable);
	
				let totalCount = result.length; // 검색 결과 총 개수
				$("#total-count").text(
						totalCount); // 검색 결과 총 개수 출력
			}
		},
		error : function() {
			alert('채용 정보를 가져오는데 실패하였습니다.');
		}
			});
		});
	});



	// 스크랩 
	function handleStarClick(event) {
	  const clickedRaNum = event.target.closest('.star-icon').getAttribute('data-raNum');
	  console.log(clickedRaNum);
	
	  document.querySelectorAll('.star-icon').forEach(function(el) {
	    const raNum = el.getAttribute('data-raNum');
	    if (raNum === clickedRaNum) {
	      $(el).find('span.fa-star').toggleClass("far fas").toggleClass("text-warning");
	    }
	  });
	  
	  $.ajax({
	    type: "POST",
	    url: "${pageContext.request.contextPath}/person/checkScrap",
	    data: { raNum: clickedRaNum },
	    success: function (result) {
	      
	      if (result === 1) {
	        $.ajax({
	          type: "POST",
	          url: "${pageContext.request.contextPath}/person/deleteJob",
	          data: { raNum: clickedRaNum },
	          success: function (result) {
	          },
	          error: function () {
	            alert("스크랩 삭제에 실패하였습니다.");
	          },
	        });
	      } else {
	        $.ajax({
	          type: "POST",
	          url: "${pageContext.request.contextPath}/person/scrapJob",
	          data: { raNum: clickedRaNum },
	          success: function (result) {
	            // do something
	          },
	          error: function () {
	            alert("스크랩에 실패하였습니다.");
	          },
	        });
	      }
	    },
	    error: function () {
	      alert("스크랩 여부 확인에 실패하였습니다.");
	    },
	  });
	}

	
	
	// 초기화 버튼
	$('#btn-reset').click(function() {
	    $('input[type="checkbox"]').prop('checked', false);
	    $('#search').val('');
	});

	
	
	// 페이지 실행 시 실행되는 함수
	window.onload = function() {
	  var starIcons = document.querySelectorAll('.star-icon');
	  starIcons.forEach(function(starIcon) {
	  var raNum = starIcon.getAttribute('data-raNum');

	    $.ajax({
	      type: 'POST',
	      url: '${pageContext.request.contextPath}/person/checkScrap',
	      data: {raNum: raNum},
	      success: function(data) {
	        // 스크랩 여부에 따라 별 상태 변경
	        if(data == 1) {
	          $(starIcon).find('span.fa-star').removeClass('far').addClass('fas').addClass('text-warning');
	        } else {
	          $(starIcon).find('span.fa-star').removeClass('fas').addClass('far').removeClass('text-warning');
	        }
	      }
	    });
	  });
	};
	
	// 비로그인 시 
	 function showLoginAlert() {
	        alert("로그인 후 더 많은 서비스를 이용해보세요.");
	        location.href = "${pageContext.request.contextPath}/person/login";
	    }

	
	</script>
	
</body>
</html>
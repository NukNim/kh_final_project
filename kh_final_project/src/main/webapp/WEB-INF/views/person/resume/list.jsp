<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리 </title>
</head>
<body>
	<!-- haeder : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>이력서 관리</h1>
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
										<h1 class="mb-3">이력서 목록</h1>
										<p>
										1. 이력서 생성한 뒤 작성해주세요.<br>
										2. 이력서는 최대 5개까지 생성하실 수 있습니다. <br>
										3. 생성된 이력서로 채용공고마다 다른 이력서로 입사지원이 가능합니다. 
										(단, 입사 지원 후 이력서 수정 내용은 반영되지 않습니다.) <br>
										4. 인재정보에는 작성하신 이력서 중 대표 이력서 1개만 공개 가능합니다. 
										</p>
										<br>	
											<sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal.username" var="user_id" />
												<div class="d-grid gap-2 d-md-flex justify-content-md-end">
													<a class="" href="${pageContext.request.contextPath}/person/resume/write?userId=${user_id}">이력서 생성</a>
												</div>
											</sec:authorize>
										<br>
										<br>
										<table class="table table-hover">
										  <thead>
										    <tr>
										   	  <th scope="col">이력서고유번호 출력용</th>
										      <th scope="col">이력서 제목</th>
										      <th scope="col">최종 수정일</th>
										      <th scope="col">포트폴리오 파일</th>
										      <th scope="col"></th>
										    </tr>
										  </thead>
										  <tbody class="table-group-divider">
										  <c:forEach items="${resumelist }" var="resume">
										    <tr>
										      <td>${resume.resumeNo }</td>
										      <td>${resume.resumeTitle }</td>
										      <td>${resume.resumeDate }</td>
										      <td>${resume.portfFile }</td>
										      <td>
											      <button type="button" class="btn btn-outline-dark">수정</button>
											      <form method="post" action="delete">
											      	<input type="hidden" name="resumeNo" value="${resume.resumeNo }" required>
											      	<button type="submit" class="btn btn-outline-dark">삭제</button>
										      	  </form>
										      </td>
										    </tr>
										  </c:forEach>
										  </tbody>
										</table>
										
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
	
	// 이력서 alret
	var msg = "${msg}";
	if(msg) {
		alert(msg);
	}
	</script>
</body>
</html>
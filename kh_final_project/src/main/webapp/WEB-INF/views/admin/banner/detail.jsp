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
    <title>배너상세</title>
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
			
				<form action="detail" method="post" enctype="multipart/form-data" onsubmit="return updateCheck();">
				<input type="hidden" class="bannerId" id="bannerId" name="bannerId" value="${detail.bannerId}" />
				<table class="my-5 table table-borderless">
					<thead>
						<tr>
							<th scope="col" class="col-4"></th>
							<th scope="col" class="col-auto"></th>
							<th scope="col" class="col-1"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>미리보기</td>
							<td>
								<img id="thumArea" class="thumArea img-fluid" alt="${detail.bannerSub }" 
									src="${detail.bannerThum eq null? 'https://dummyimage.com/200x200/000000/ffffff.png&text=No+Image' : detail.bannerThum}" style="width: 200px; height: 200px;">
							</td>
							<td>
						      	<input type="file" accept="image/*" class="form-control thumImage" id="thumImage" name ="thumImage" onchange="setThumbnail(this)">
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="bannerSub" class="bannerSub form-control" value="${detail.bannerSub }"> 
							</td>
						</tr>
						<tr>
							<td>배너 링크</td>
							<td>
								<input type="text" name="bannerLink" class="bannerLink form-control" value="${detail.bannerLink}"> 
							</td>
						</tr>
						<tr>
							<td>배너 순서</td>
							<td>
								<input type="text" name="bannerSeq" class="bannerSeq form-control" value="${detail.bannerSeq }">
							</td>
						</tr>
						<tr>
							<td>마지막 수정자</td>
							<td>${detail.userId }</td>
						</tr>
						<tr>
							<td>마지막 수정일</td>
							<td>${detail.registDate}</td>
						</tr>
					</tbody>
				</table>
				<a href="${pageContext.request.contextPath}/admin/banner" class="btn btn-primary">목록으로</a>
				<button type="submit" class="btn btn-primary">수정</button>
				</form>
					 	
		 </div>




        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	<script type="text/javascript">
	
	
		function updateCheck(){
			if($('.bannerSub').val() == null || $('.bannerSub').val() == ''){
				alert("제목을 입력해 주세요");
				return false;
			}else if($('.bannerLink').val() == null || $('.bannerLink').val() == ''){
				alert("배너 링크를 입력해 주세요");
				return false;
			}else if($('.bannerSeq').val() == null || $('.bannerLink').val() == ''){
				alert("배너 순서를 입력해 주세요");
				return false;
			}
			
			return true;
		}
		
		/* <!-- 이미지 미리보기 --> */	
		function setThumbnail(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    
			    reader.onload = function(e) {
			      var img = new Image();
			      img.src = e.target.result;
			      img.onload = function() {
			        // 썸네일 크기 설정
			        var canvas = document.createElement("canvas");
			        var context = canvas.getContext("2d");
			        var size = 200;
			        var width = img.width;
			        var height = img.height;
			        if (width > height) {
			          if (width > size) {
			            height *= size / width;
			            width = size;
			          }
			        } else {
			          if (height > size) {
			            width *= size / height;
			            height = size;
			          }
			        }
			        canvas.width = size;
			        canvas.height = size;
			        context.drawImage(img, 0, 0, width, height, 0, 0, size, size);

			        // 이미지 출력
			        var thumbnail = canvas.toDataURL("image/png");
			        document.getElementById("thumArea").src = thumbnail;
			      };
			    };
			    
			    reader.readAsDataURL(input.files[0]);
			  }
			}
	</script>

</body>

</html>
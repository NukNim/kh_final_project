</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기업 뉴스레터</title>
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
<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css"
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
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
	

<style>
.modal {
  z-index: 9999; /* 모달창을 다른 요소들보다 더 위쪽에 나타나도록 설정 */
}
</style>
</head>
<body>
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
		<div class="container-fluid  p-5 ">

			<!-- 목록 -->
			<div class="table-responsive bg-white m-2 p-5" style="height: 800px;  ">
			<h1 class="text-center mb-5"><i class="bi bi-envelope"></i>&nbsp;뉴스레터&nbsp;<i class="bi bi-envelope"></i></h1>
				<div class="text-end me-5">
					<button type="button" class="btn btn-primary ms-5" data-bs-toggle="modal" data-bs-target="#newsletter">작성하기</button><hr><br>
				</div>
				<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" class="col-1">No.</th>
					      <th scope="col" class="col-7">제목</th>
					      <th scope="col" class="col-2">작성일</th>
					    </tr>
					  </thead>
					  <c:forEach items="${news.getPage() }" var="news">
					  <tbody>
					    <tr>
					      <th scope="row">${news.boardNo}</th>
					      <td><a href="${pageContext.request.contextPath}/board/company/newsletter/view?no=${news.boardNo}">${news.boardTitle }</a></td>
					      <td>${news.updateDate.substring(0, 10)  }</td>
					    </tr>
					  </tbody>
					  </c:forEach>
			   </table> 
			<!-- 페이지네이션  -->
				<div class="mt-5">
				 	<ul class = "pagination text-center justify-content-center ">
						<c:choose>
							<c:when test="${news.prevPage eq -1 }">
								<li class="page-item disabled"><a class="page-link">prev</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/business/aboutus/newsletter?pnum=${news.prevPage }">prev</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="pNum" items="${news.pageList }">
							<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${pageContext.request.contextPath}/business/aboutus/newsletter?pnum=${pNum}">${pNum }</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${news.nextPage eq -1 }">
								<li class="page-item disabled"><a class="page-link">next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/abusiness/aboutus/newsletter?pnum=${news.nextPage }">next</a></li>
							</c:otherwise>
						</c:choose>					
					</ul>			
				</div>
			</div>

		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="newsletter" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center" id="staticBackdropLabel">뉴스레터
						작성</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath }/business/aboutus/newsletterform" method="post" >
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>제목</h4>
							</div>
							<div class="col-10 ">
								<input type="text" class="form-control "
									name="boardTitle" placeholder="제목을 입력해주세요" required>
							</div>
						</div>
						<div class="row pt-3">
							<div class="col-2 text-center font-monospace">
								<h4>관련링크</h4>
							</div>
							<div class="col-10 ">
								<input type="url" class="form-control" name="link" id="link" oninput="fetchLinkTitle()" placeholder="링크를 입력하세요">
								<input type="text" class="mt-2 form-control" name="linkTitle" id="linkTitle" style="display:none" readonly>
								<input type="text" class="mt-2 form-control" name="linkTitle" id="linkTitle2" placeholder="기사 제목을 입력하세요"
									   style="display:none">
							</div>
						</div>

						<div class="row pt-3">
							<div class="col-2 text-center font-monospace">
								<h4>내용작성</h4>
							</div>
							<div class="col-10 ">
								<div class="mb-3 ">
									<textarea id="newsContent" name="boardContent" style="height: 500px;"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary" id="btn-newsletter" onclick="return checkAll();">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>


</script>		
<script>
function checkAll() {
    var boardContent = editor.getData();
    if (!checkExistData(boardContent, "내용")) {
        return false;
    }

    // 모든 필드가 유효한 경우 true를 반환합니다.
    return true;
}

function checkExistData(value, dataName) {
    if (value.trim() === "") {
        alert(dataName + "을(를) 입력해주세요!");
        return false;
    }
    return true;
}

	  function fetchLinkTitle() {
		  const link = document.getElementById("link");
		  const linkTitle = document.getElementById("linkTitle");
		  const linkTitle2 = document.getElementById("linkTitle2");

		// 입력된 URL에서 Title 추출
		    fetch(link.value)
		      .then(response => response.text())
		      .then(html => {
		        const parser = new DOMParser();
		        const doc = parser.parseFromString(html, "text/html");
		        const title = doc.querySelector("title").innerText;
		        linkTitle.style.display = "block"; // 링크가 보이도록 함
		        linkTitle.value = title;
		      })
		      .catch(error => {
		        console.log(error);
		        linkTitle2.focus();
				linkTitle2.style.display = "block"; // 링크가 보이도록 함
		        linkTitle2.value = null; //못 찾았을 때 넣어줄 값
		      });
		  }
	</script>
	
	<!-- ckeditor5 -->
	<script>
	class UploadAdapter {
	    constructor(loader) {
	        this.loader = loader;
	    }
	    upload() {
	        return this.loader.file.then( file => new Promise(((resolve, reject) => {
	            this._initRequest();
	            this._initListeners( resolve, reject, file );
	            this._sendRequest( file );
	        })))
	    }
	    _initRequest() {
	        const xhr = this.xhr = new XMLHttpRequest();
	        xhr.open('POST', 'imageUpload', true);
	        xhr.responseType = 'json';
	        console.log(xhr);
	        console.log(xhr.response);
	    }
	    _initListeners(resolve, reject, file) {
	        const xhr = this.xhr;
	        const loader = this.loader;
	        const genericErrorText = '파일을 업로드 할 수 없습니다.'
	        xhr.addEventListener('error', () => {reject(genericErrorText)})
	        xhr.addEventListener('abort', () => reject())
	        xhr.addEventListener('load', () => {
	            const response = xhr.response
	            console.log(response);
	            if(!response || response.error) {
	                return reject( response && response.error ? response.error.message : genericErrorText );
	            }
	            resolve({
	                default: response.url //업로드된 파일 주소
	            })
	        })
	    }
	    _sendRequest(file) {
	        const data = new FormData();
	        data.append('upload',file);
	        this.xhr.send(data);
	    }
	}
	
	function MyCustomUploadAdapterPlugin(editor) {
	    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader)
	    }
	}
	
	
    
	let editor;
    ClassicEditor
    .create( document.querySelector ('#newsContent'),{
    	language: "ko"
    	, extraPlugins: [MyCustomUploadAdapterPlugin]
		, simpleUpload :{
			uploadUrl : 'imageUpload',
		}
    	
    	, config : {
    		height:'400px;'
	   		, width:'100%'
    	}
    })
    .then( newEditor => {
	          editor = newEditor;
	        } )
    .catch( error => {
        console.error( error );
    });
    

	</script>

</body>
</html>

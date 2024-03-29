<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>기업 뉴스레터 수정</title>
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
<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>


</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>


	<div class="container-xxl py-5">
		<form
			action="${pageContext.request.contextPath }/board/company/updateNewsletter"
			method="post">
			<input type="hidden" name="boardNo" value="${news.boardNo }">

			<div class="row ">
				<div class="col-2 text-center font-monospace">
					<h4>제목</h4>
				</div>
				<div class="col-10 was-validated">
					<input type="text" class="form-control is-invalid"
						name="boardTitle" value="${news.boardTitle}" required>
					<hr>
				</div>
			</div>
			<div class="row ">
				<div class="col-2 text-center font-monospace">
					<h4>관련링크</h4>
				</div>
				<div class="col-10 ">
					<input type="url" class="form-control" name="link" id="link"
						oninput="fetchLinkTitle()" value="${news.link }"
						placeholder="링크를 입력하세요"> 
						<input type="text"
						class="mt-2 form-control" name="linkTitle" id="linkTitle2"
						placeholder="기사 제목을 입력하세요" style="display: none">
						<input type="text"
						class="mt-2 form-control" name="linkTitle" id="linkTitle" 
						value="${news.linkTitle }" readonly> 
					<hr>
				</div>
			</div>

			<div class="row ">
				<div class="col-2 text-center font-monospace">
					<h4>내용작성</h4>
				</div>
				<div class="col-10 ">
					<div class="mb-3">
						<textarea id="newsLetter" name="boardContent">${news.boardContent }</textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light" onclick="goBack()">취소</button>
				<button type="submit" class="btn btn-primary" onclick="return checkAll();">수정</button>
			</div>
		</form>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

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
	
	
	
	var msg = "${msg}";
	if(msg) {
		alert(msg);
	}
	
	function goBack() {
	  window.history.back();
	}
	
	</script>

	<script>	  
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

	<!-- ckeditor5 이미지 업로드를 위한 업로드 어뎁터 추가  -->
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
	        xhr.open('POST', '${pageContext.request.contextPath}/board/company/imageUpload', true);
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
    .create( document.querySelector ('#newsLetter'),{
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
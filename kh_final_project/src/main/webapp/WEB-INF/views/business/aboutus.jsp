<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home</title>
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
<link href="${pageContext.request.contextPath}/resources/css/business.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/recruit.insert.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	

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
	<!-- haeder  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- page section -->
	<section>
	<div class="accordion m-5 p-2 " id="accordion">
	  	<div class="accordion-item">
		    <h2 class="accordion-header" id="">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
		        <a class="fw-bold fs-3">회사소개</a>
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
		    	<div class="accordion-body bg-white">
		      		<c:if test="${empty companyinfo }">
						<p>미작성 상태입니다 회사소개를 작성해주세요</p>
						<p><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#companyinfo"><i class="bi bi-arrow-up-right-square"></i>&nbsp;&nbsp;작성하러가기</button></p>
					</c:if>
					<c:if test="${not empty companyinfo }">
					<div class="text-end">
						<a class="fs-5 btn btn-outline-primary" href="<%=request.getContextPath()%>/board/company/companyinfo/view?no=${companyinfo.boardNo }"><i class="bi bi-arrow-up-right-square" ></i>&nbsp;등록된 게시물 바로가기 </a>
					</div>
					</c:if>
		      </div>
		    </div>
	  	</div>
	    <div class="accordion-item">
		    <h2 class="accordion-header" id="">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
		       	<a class="fw-bold fs-3">뉴스레터</a>
		       
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
		      <div class="accordion-body bg-white">
				  <div class="text-end">
						<a class="btn btn-light fs-5" href="<%=request.getContextPath()%>/business/aboutus/newsletter" role="button">더보기</a>
						<button type="button" class="btn btn-primary fs-5" data-bs-toggle="modal" data-bs-target="#newsletter">등록</button>
						<div class="row m-2 justify-content-center">
						<c:forEach items="${news.getPage() }" var="news" varStatus="status" begin="0" end="5">
						    <div class="col-lg-3 col-md-6 text-center m-3 p-2 rounded-3 card">
							    <i class="bi bi-envelope-heart fs-3 text-primary"></i>
							  <hr>
							    <h5 class="card-title text-primary fs-4">${news.boardTitle }</h5>
							    <p>${news.updateDate.substring(0, 10) }</p>
								<hr>
							    <a class="fs-6" href="${pageContext.request.contextPath}/board/company/newsletter/view?no=${news.boardNo }" >상세보기 및 수정</a>
							</div>
					    </c:forEach>
						</div>
				  </div>
		      </div>
		    </div>
  		</div>
	</div>

	
	
	
	
					
					
					<!-- Q&A 
					<div class="border border-secondary">
						<h1> Q&A </h1>
						<a type="button" class="btn btn-light" href="<%=request.getContextPath()%>/business/aboutus/qna">더보기</a>
							
						<!-- 숫자 인덱스 -->
						<!-- 
						<div class="num-container row" id="num-container">
							<div class="col num-item">
								<h4 class="in-title">게시글 수</h4>
								<span class="nums" data-count="180">0</span><span id="num-unit">개</span><br>
							</div>
							<div class="col num-item">
								<h4 class="in-title">미답변 게시글</h4>
								<span class="nums" data-count="1143">0</span><span id="num-unit">개</span><br>
							</div>
							<div class="col num-item">
								<h4 class="in-title">답변완료 게시글</h4>
								<span class="nums" data-count="34">0</span><span id="num-unit">개</span><br>
							</div>
						</div>
					</div> -->
					
	</section>


	<!-- Modal -->
	<!-- 회사소개 -->
	<div class="modal fade" id="companyinfo" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-fullscreen modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">


				<div class="modal-header">
					<h3 class="modal-title text-center" id="staticBackdropLabel">회사소개
						작성</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/business/aboutus/infoform" method="post"
						enctype="multipart/form-data">
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>제목</h4>
							</div>
							<div class="col-10 was-validated">
								<input type="text" name="boardTitle" class="form-control is-invalid"
									 placeholder="제목을적어주세요" required> 
								<hr>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>직 원 수</h4>
							</div>
							<div class="col-10 ">
								<p>직원수를 숫자로 입력해주세요 (단위:명)
								<input type="text" name="employee" class="form-control " placeholder=" 예시)300"> </p>
								<hr>
							</div>
						</div>
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>평균연봉</h4>
							</div>
							<div class="col-10 ">
								<p>회사의 평균 연봉을 입력해주세요 (단위:만원)
								<input type="text" class="form-control " name="salaryAvg"  placeholder=" 예시)3500" ></p>
								<hr>
							</div>
						</div>

						<div class="row ">
							<div class="col-2 text-center">
								<h4>태그</h4>
							</div>
							<div class="col-10 text-start">
								<p>
									<a class="fw-bold">근무/휴가</a> <input type="checkbox" name="tag"
										value="유연근무">유연근무 <input type="checkbox" name="tag"
										value="재택근무">재택근무 <input type="checkbox" name="tag"
										value="주35시간">주35시간 <input type="checkbox" name="tag"
										value="주4일근무">주4일근무 <input type="checkbox" name="tag"
										value="육아휴직">육아휴직 <input type="checkbox" name="tag"
										value="출산휴가">출산휴가 <input type="checkbox" name="tag"
										value="리프레시휴가">리프레시휴가
								</p>
								<p>
									<a class="fw-bold">보상</a> <input type="checkbox" name="tag"
										value="성과금">성과금 <input type="checkbox" name="tag"
										value="상여금">상여금 <input type="checkbox" name="tag"
										value="연말보너스">연말보너스 <input type="checkbox" name="tag"
										value="스톡옵션">스톡옵션
								</p>
								<p>
									<a class="fw-bold">기업문화</a> <input type="checkbox" name="tag"
										value="수평적조직">수평적조직 <input type="checkbox" name="tag"
										value="스타트업">스타트업 <input type="checkbox" name="tag"
										value="자율복장">자율복장 <input type="checkbox" name="tag"
										value="워크샵">워크샵 <input type="checkbox" name="tag"
										value="반려동물">반려동물
								</p>
								<p>
									<a class="fw-bold">편의</a> <input type="checkbox" name="tag"
										value="식비지원">식비지원 <input type="checkbox" name="tag"
										value="간식제공">간식제공 <input type="checkbox" name="tag"
										value="사내카페">사내카페 <input type="checkbox" name="tag"
										value="사내식당">사내식당 <input type="checkbox" name="tag"
										value="주차">주차 <input type="checkbox" name="tag"
										value="수면실">수면실 <input type="checkbox" name="tag"
										value="휴게실">휴게실 <input type="checkbox" name="tag"
										value="헬스장">헬스장 <input type="checkbox" name="tag"
										value="안마의자">안마의자
								</p>

								<p>
									<a class="fw-bold">지원</a> <input type="checkbox" name="tag"
										value="택시비">택시비 <input type="checkbox" name="tag"
										value="셔틀버스">셔틀버스 <input type="checkbox" name="tag"
										value="차량지원">차량지원 <input type="checkbox" name="tag"
										value="기숙사">기숙사 <input type="checkbox" name="tag"
										value="건강검진">건강검진 <input type="checkbox" name="tag"
										value="동호회">동호회 <input type="checkbox" name="tag"
										value="복지포인트">복지포인트 <input type="checkbox" name="tag"
										value="문화비">문화비 <input type="checkbox" name="tag"
										value="운동비">운동비 <input type="checkbox" name="tag"
										value="자기계발비">자기계발비
								</p>

								<p>
									<a class="fw-bold">교육</a> <input type="checkbox" name="tag"
										value="교육비">교육비 <input type="checkbox" name="tag"
										value="도서구매비">도서구매비 <input type="checkbox" name="tag"
										value="직무교육">직무교육 <input type="checkbox" name="tag"
										value="세미나비">세미나비 <input type="checkbox" name="tag"
										value="어학교육">어학교육 <input type="checkbox" name="tag"
										value="해외연수">해외연수
								</p>
								<hr>
							</div>
						</div>
						<!--  
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>기업사진</h4>
							</div>
							<div class="col-10 ">
								<div class="mb-3">
									<input class="form-control" type="file" id="infoPhoto" multiple>
									<label for="infoPhoto" class="form-label">기업 대표 사진을
										등록해주세요</label>
								</div>
							</div>
						</div> -->
						<div class="row ">
							<div class="col-2 text-center font-monospace">
								<h4>소 개 글</h4>
							</div>
							<div class="col-10  ">
								<div class="mb-3">
									<textarea id="infoContent" name="boardContent" ></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button type="reset" class="btn btn-light">초기화</button>
							<button type="submit" class="btn btn-primary" id="btn-info" onclick="return checkInfo();">등록</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- 뉴스레터 -->
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
							<button type="submit" class="btn btn-primary" id="btn-newsletter" onclick="return checkNews();">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
  
<script>
	function checkInfo() {
	    var boardContent = editor.getData();
	    if (!checkExistData(boardContent, "내용")) {
	        return false;
	    }
	
	    // 모든 필드가 유효한 경우 true를 반환합니다.
	    return true;
	}
	
	function checkNews() {
	    var boardContent = editor2.getData();
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
	<!-- 숫자 카운트 애니메이션 -->
	<script>
        $('.nums').each(function () {
            const $this = $(this),
                countTo = $this.attr('data-count');
            $({
                countNum: $this.text()
            }).animate({
                countNum: countTo
            }, {
                duration: 3000,
                easing: 'linear',
                step: function () {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function () {
                    $this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                    //3자리 마다 콤마 표시 적용
                }
            });
        });
    </script>

<!-- ckeditor5 이미지 업로드를 위한 업로드 어뎁터 추가  -->
	<script type="text/javascript">
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
	        xhr.open('POST', '${pageContext.request.contextPath}/business/aboutus/imageUpload', true);
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
    .create( document.querySelector('#infoContent'),{
    	language: "ko"
    	, extraPlugins: [MyCustomUploadAdapterPlugin]
		, simpleUpload :{
			uploadUrl : 'imageUpload',
		}
    	
    	, config : {
    		height:'400px'
	   		, width:'100%'
    	}
    })
    .then( newEditor => {
     editor = newEditor;
	} )
    .catch( error => {
        console.error( error );
    });
    
   let editor2;
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
    		editor2 = newEditor;
	        } )
    .catch( error => {
        console.error( error );
    });
    
	</script>
</body>
</html>
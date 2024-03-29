<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>account</title>
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
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
<!-- style -->	

	
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="container-xxl ">
		<h1 class="text-center m-3">마이페이지</h1>
		<div class="container-xxl py-5">
			<div class="row">
				<!-- profile area start -->
				<div class="col-md-3 col-sm-4 ">
					<div class="team-item rounded overflow-hidden pt-5">
						<div class="position-relative m-auto profileArea " style="width: 200px; height: 200px;">
							<img id="userPicArea" class="img-fluid"
								src="${bsinfo.userPic eq null? 'https://dummyimage.com/200x200/d6d6d6/000000&text=200x200' : bsinfo.userPic }" alt="" style="width: 100%; height: 100%;">
						</div>
						<div class="text-center p-4 mt-3">
							<h5 class="fw-bold mb-0">${bsinfo.userName}</h5>
							<small>${bsinfo.userEmail}</small>
							<p><button class="btn btn-primary mt-5" onclick="location.href='<%=request.getContextPath()%>/business/aboutus'">회사소개작성</button></p>
						</div>
					</div>
				</div><!-- profile area end -->
				<!-- info area start -->
				<div class="col-md-8 col-sm-8 ">
					<div class="container" style="height: 850px;">
						<div>
							<form action="<%=request.getContextPath() %>/business/account/info" method="post" enctype="multipart/form-data" class="text-center">
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">이메일</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="userEmail" name ="userEmail" value="${bsinfo.userEmail}">
							    </div>
							 </div>
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">사업자번호</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="bsLicense" name ="bsLicense" value="${bsinfo.bsLicense}">
							    </div>
							 </div>
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">대표전화</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="bsMainPhone" name ="bsMainPhone" value="${bsinfo.bsMainPhone}">
							    </div>
							 </div>
							<div class="mb-1 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">주소</label>
							    <div class="col-sm-7">
									<input type="text" class="form-control" id="postcode" name="addressPostcode" value="${bsinfo.addressPostcode}">
								</div>
								<div class="col-sm-2">
									<input type="button" class="form-control" onclick="execDaumPostcode()" value="주소찾기"><br>
								</div>	
							</div>		
							<div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">도로명주소</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="roadAddress" name ="addressRoad" value="${bsinfo.addressRoad}">
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">지번주소</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="jibunAddress" name ="addressJibun" value="${bsinfo.addressJibun}">
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">상세주소</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="detailAddress" name ="addressDetail" value="${bsinfo.addressDetail}">
	  							  <span id="guide" style="color:#999;display:none"></span>
									<div id="map" class="col" style="width:580px;height:300px;margin-top:10px; "></div>
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label ">기업사진</label>
							    <div class="col-sm-9">
								  <input class="form-control" type="file" accept="image/*" id="userImage" name ="userImage" onchange="setThumbnail(this)">
							    </div>
							 </div>
							<p class="text-center mt-5">
								<button class="btn btn-primary" type="submit" value="수정하기">수정하기</button>
								<button class="btn btn-primary" type="reset">취소</button>
							</p>
							</form>
							</div>
						</div>
					</div><!-- info area end -->
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4">
					</div>
					<!-- password / secede -->
					<div class="col-md-8 col-sm-8 " style="height: 550px;"><hr><br>
					<h4 class="text-center m-2 ">비밀번호 변경 및 탈퇴</h4>
					<p class="text-center">비밀번호 확인 후 변경과 탈퇴가 가능합니다.</p>
						<!-- password -->
						<form class="m-5" name="pwForm" action="pwChk" method="post" onsubmit="return checkPassword();">
							 <div class="mb-3 row">
							    <label for="confirmPw"  class="col-sm-3 col-form-label">현재 비밀번호</label>
							    <div class="col-sm-6">
							      <input type="password" class="form-control" id="confirmPw" name="confirmPw">
							    </div>
							    <button class="col-sm-2 btn btn-primary" type="submit" >확인</button>
								  <span class="pw_input_re_1 text-center" >비밀번호가 일치합니다</span>
								  <span class="pw_input_re_2 text-center" >비밀번호가 일치하지 않습니다.</span>
								  <span class="pw_input_re_3 text-center" >비밀번호를 입력해주세요</span>
							 </div>
						</form>
						<!-- update password -->
						<form action="updatePw" method="post" id="newPwForm" name="newPwForm"  onsubmit="return newPassword();">	
							 <div class="mb-3 row ">
							    <label for="userPw" class="col-sm-3 col-form-label text-center">새 비밀번호</label>
							    <div class="col-sm-8 ">
							      <input type="password" class="form-control " id="newPw" name="userPw" disabled="disabled" >
								  <span class="pwck_input_re_3 text-center" >비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다</span>
							    </div>
							 </div>
							 <div class="mb-3 row ">
							    <label for="newPw2" class="col-sm-3 col-form-label text-center">새 비밀번호 확인</label>
							    <div class="col-sm-8 ">
							      <input type="password" class="form-control " id="newPw2" name="userPw" disabled="disabled" >
							      <span class="pwck_input_re_1 text-center" >비밀번호가 일치합니다</span>
								  <span class="pwck_input_re_2 text-center" >비밀번호가 일치하지 않습니다.</span>
							    </div>
							 </div>	<br>	
							 <p class="text-center">
							 <button class="btn btn-primary" id="btnChangePw" disabled="disabled" type="submit" >비밀번호 변경</button>
							 <button class="btn btn-primary" type="reset">취소</button>
							 </p>
						</form>
						<p class="text-center"><a href="${pageContext.request.contextPath }/person/findpw" class="link-primary">비밀번호를 잊으셨나요?</a></p>
							 
						<!-- secede --><br>
						<p class="text-end">
						<button class="btn btn-primary" id="btnSecede" disabled="disabled" onclick="location.href='<%=request.getContextPath()%>/person/delete'">회원탈퇴 하러가기</button>
						</p>
						
					</div><!-- password / secede end -->
				
				</div>
				
				
			</div>
	</div><!-- 전체컨테이너 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- map start -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef072fe97e426b6ce05b6cb96feab5e&libraries=services"></script>

<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                     	// 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">내 기업</div>'
                        });
                        infowindow.open(map, marker);
                    }
                });
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>
	//회원정보의 주소로 페이지 로딩하기
	var roadAddress = "${bsinfo.addressRoad}";
	var jibunAddress = "${bsinfo.addressJibun}";
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
                content: '<div style="width:150px;text-align:center;padding:6px 0;">내 기업</div>'
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
 	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
    function setMapType(maptype) { 
        var roadmapControl = document.getElementById('btnRoadmap');
        var skyviewControl = document.getElementById('btnSkyview'); 
        if (maptype === 'roadmap') {
            map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
            roadmapControl.className = 'selected_btn';
            skyviewControl.className = 'btn';
        } else {
            map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
            skyviewControl.className = 'selected_btn';
            roadmapControl.className = 'btn';
        }
    }
    // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
    function zoomIn() {
        map.setLevel(map.getLevel() - 1);
    }
    // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
    function zoomOut() {
        map.setLevel(map.getLevel() + 1);
    }
    
    //마커를 미리 생성
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.537187, 127.005476),
        map: map
    });
</script>
<!-- map end -->

<!-- updatePassword -->

<script>
	//비밀번호 확인시 공백 확인
	function checkPassword() {
		  var confirmPw = document.getElementById("confirmPw").value;
		  if (confirmPw.trim() == "") {
			$('.pw_input_re_3').css("display","inline-block"); 
		    return false; // submit 방지
		  }
		  return true; // submit 허용
		  console.log(confirmPw);
		}
	
	function newPassword() {
		  // 비밀번호 필드에서 값 가져오기
		  var newPw = document.getElementById("newPw").value;
		  var newPw2 = document.getElementById("newPw2").value;

		  // 빈칸 검사
		  if (newPw === "" || newPw2 === "") {
		    alert("빈칸이 있습니다. 비밀번호를 입력해주세요");
		    return false;
		  }

		  // 비밀번호 패턴 검사
		  var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
		  if (!pattern.test(newPw)) {
		    alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다.");
		    return false;
		  }

		  // 두 비밀번호 필드 값 비교
		  if (newPw !== newPw2) {
		    alert("비밀번호가 일치하지 않습니다.");
		    return false;
		  }

		  // 모든 검사를 통과한 경우, 폼 제출
		  return true;
		}

	
	
	//비밀번호 일치시, 버튼 활성화
	$(document).ready(function() {
		var chkpw = "${chkpw}";
		if (chkpw === "비밀번호 일치") {
			console.log(chkpw);
			$('.pw_input_re_1').css("display","inline-block"); 
			$("#newPw").prop("disabled", false).focus();
			$("#newPw2").prop("disabled", false);  //.addClass("is-invalid")
			$("#btnChangePw").prop("disabled", false);
			$("#btnSecede").prop("disabled", false);
			return true;
		} else if (chkpw === "비밀번호 불일치") {
		    console.log(chkpw);
		    $("#confirmPw").focus();
		    $('.pw_input_re_2').css("display","inline-block"); 
		    return false;
		} else {
			return false;
		}
		

	
	var msg = "${msg}";
	if(msg) {
		alert(msg);
	}
	
	});
	<!-- 이미지 미리보기 -->	
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


				        canvas.width = size;
				        canvas.height = size;
				        context.drawImage(img, 0, 0, width, height, 0, 0, size, size);

				        // 이미지 출력
				        var thumbnail = canvas.toDataURL("image/png");
				        document.getElementById("userPicArea").src = thumbnail;
				      };
				    };
				    
				    reader.readAsDataURL(input.files[0]);
				  }
				}
</script>



	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Cardamoyeo</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- SCRIPTS -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<!-- 	<script -->
<%-- 		src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script> --%>

	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>


	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64c3c7f6dc4c99843451bcb90bd610c5&libraries=services"></script>	
	

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">


<title>store_detail</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.fa {
	font-size: 50px;
	cursor: pointer;
	user-select: none;
}

.fa:hover {
	color: red;
}

/*보류*/
/*리뷰*/
span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}

/*review*/
.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('resources/images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}
/* 레이아웃 외곽 너비 400px 제한*/
.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('resources/images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}
</style>
<script type="text/javascript">
	function modifyboard() {
		storeModify.submit();
	}
	
	
	function filebb(){
		if($("#filebtn").attr("value") == "삭제"){
			//삭제를 누르면 파일명이 없어야 함
			//삭제를 누르면 삭제 취소로 바꿈
			$("#filebtn").attr("value", "삭제 취소");
			$("#fileView").html(
					"<input type ='file' name ='store_image' multiple='multiple'>"
					+"<input type ='hidden' name ='fileDel' value ='${store[0].store_image}'>"
			);	
		}else{
			$("#fileDel").attr("value", "삭제");
			$("#fileView").html("파일명 :'${store[0].store_image}'");
		}
	}

</script>
	<script type="text/javascript">
							//주차권 요금, 이용공간수는 input에 숫자만 입력 받고 자동으로 금액 콤마(,)찍기
							$(document).ready(function(){
								 $(".onlyNumber").keypress(function (event) {
						                if (event.which && (event.which< 48|| event.which >57)) {   //숫자만 받기
						                    event.preventDefault();
						                }
						            }).keyup(function () {
						                if ($(this).val() != null && $(this).val() != '') {
						                    var text = $(this).val().replace(/[^0-9]/g, '');
						                    $(this).val(comma(text));
						                }

						            });

						//콤마찍기
						function comma(x) {
						            var temp = "";
						            
						            num_len = x.length;
						            co = 3;
						            while (num_len > 0) {
						                num_len = num_len - co;
						                if (num_len < 0) {
						                    co = num_len + co;
						                    num_len = 0;
						                }
						                temp = "," + x.substr(num_len, co) + temp;
						            }
						            return temp.substr(1);
						        }
							});	
							</script>	
	

	
</head>
<body id="top">

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>


	<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->


	 <!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <jsp:include page="header.jsp" />
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
				<div class="ml-auto">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="user_id"/>
						 <p>${user_id }님, 반갑습니다!</p>
              	    	 <a href="<c:url value='logout' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>로그아웃</a>
              	    	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              	    	<sec:authorize access="hasAuthority('ROLE_U')">
							<a href="<c:url value='userMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
						</sec:authorize>
              	    	<sec:authorize access="hasAuthority('ROLE_M')">
							<a href="<c:url value='managerMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ROLE_O')">
							<a href="<c:url value='ownerMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
							<a href="<c:url value='storeForm?user_id=${user_id }' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>매장등록</a>
						</sec:authorize>
					</sec:authorize>
					
					<sec:authorize access="! isAuthenticated()">
					  <div class="ml-auto">
                		<a href="<c:url value='register' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">회원가입</a>
                		<a href="<c:url value='/login' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>일반로그인</a>
                		<a href="<c:url value='/login_owner' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>업체로그인</a>
                	  </div>
					</sec:authorize>

				</div>				
			<a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>
			 
        </div>
      </div>
    </header>


		<!-- HOME -->
			<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/bg_parking.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold">Store_modify</h1>
						<div class="custom-breadcrumbs">
							<a href="index.html">Home</a> <span class="mx-2 slash">/</span> <a
								href="portfolio.html">Portfolio</a> <span class="mx-2 slash">/</span>
							<span class="text-white"><strong>Store_modify</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<form action="storeModify" method="post" enctype="multipart/form-data">
			<section class="site-section pb-0 portfolio-single" id="next-section">

				<div class="container">

					<div class="row mb-5 mt-5">
						

						<!-- hidden으로 값을 날려주고 비활성화 상태에서 체크를 하면 활성화 상태가 되어 파일 업로드를 수정할 수 있다. -->
				
						<br />
						<br />

						<div class="mb-4">
							<h3 class="mb-4 h4 border-bottom">
								매장명 <br /> <input type="text" class="form-control"
									id="store_name" name="store_name"
									value="${store[0].sdto.store_name}">
							</h3>
							<br />
							<br />
							<br />
							
					
							<input type="hidden" class="form-control" id="menu_num"
									name="menu_num" value="${store[0].mdto.menu_num}">
							
							<div class="form-group" id="fileView" >
								<label for="company-website-tw d-block">Upload Image</label> <br>
								
								
								<c:forEach items="${store}" var="dto">
									<input type="hidden" class="form-control" id="store_image_seq"
											name="store_image_seq" value="${dto.store_image_seq}">
								<input type="text" class ="form-control" id="store_image" value="${dto.store_image}">
								</c:forEach>
								
								
								<input type="file" name="store_image" multiple="multiple">
							</div>
		
							<input type="button" id="filebtn" value="삭제" onclick="filebb()"/>


							<input type="hidden" class="form-control" id="store_seq"
								name="store_seq" value="${store[0].store_seq}"> 
						


							<!-- 리뷰 총점 표시 -->
							<script type="text/javascript"
								src="https://code.jquery.com/jquery-latest.js">
								
							</script>
							<script type="text/javascript">
//  								$(function() {
//  									$.fn.generateStars = function() {
//  										return this.each(function(i, e) {
//  											$(e).html(
// 													$('<span/>').width(
// 															$(e).text() * 16));
//  										});
// 									};
 									// 숫자 평점을 별로 변환하도록 호출하는 함수
//  									$('.star-prototype').generateStars();
//  								}); 
							</script>
							<!-- 							<p class="mb-0"> -->
							<!-- 								<span class="star-prototype">4.5</span> -->
							<!-- 							</p> -->
						</div>



						<div class="row mb-4">

							<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
								<strong class="d-block text-black">영업 시간</strong> <input
									type="text" class="form-control" id="store_time_open"
									name="store_time_open" value="${store[0].sdto.store_time_open}">
								- <input type="text" class="form-control" id="store_time_close"
									name="store_time_close"
									value="${store[0].sdto.store_time_close}">
							</div>
							<div class="inputbox">
						<div class="inputtitle">주소</div>
							<div class="inputs">
									<div class="inputs">
										<input type="text" id="keyword" name="keyword" size="50" style="text-align:center; width:300px; height:30px; letter-spacing: 0px" placeholder="무슨시 무슨구 정확하게 입력하세요"/>
										<button type="button" id="searchbtn" class="btn btn-primary btn-lg" onclick="ajax_store(keyword.value)">검색</button>
										<input type="text" id="viewadress" name="store_address" class="form-control" placeholder="주소를 확인해주세요 (입력 불가)" value="${store[0].sdto.store_address}"/><br/>
										<input type="hidden" id="picklat" name="store_latitude" title="위도"/>
										<input type="hidden" id="picklng" name="store_longitude" title="경도"/>
									</div>				
									<div id="map" style="width:600px;height:600px;"></div>
							</div>
					</div>
							<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
								<strong class="d-block text-black">매장 연락처</strong> <input
									type="text" class="form-control" id="store_phone"
									name="store_phone" value="${store[0].sdto.store_phone}">
							</div>
							<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
								<strong class="d-block text-black mb-3">혼잡도&이용공간수</strong> <input
									type="text" class="form-control onlyNumber" id="store_space"
									name="store_space" value="${store[0].sdto.store_space}">
								<a href="#" class="btn btn-outline-danger border-width-2">혼잡</a>
								<a href="#" class="btn btn-outline-success border-width-2">여유</a>
							</div>
						</div>

						<div class="block__87154 mb-0" style="font-size: 20px;">

							<blockquote>
								<i class="fa fa-automobile" style="font-size: 24px"></i>
								<!-- checkbox아니면 dropdown으로 일단 checkbox사용 -->
								<strong>주차권 요금</strong><br /> 기본요금 (10분당) : <input type="text" class="form-control onlyNumber" id="store_money"
									name="store_money" value="${store[0].mdto.store_money}"><br /> 1시간권 :
								<input type="text" class="form-control onlyNumber" id="one_time"
									name="one_time" value="${store[0].mdto.one_time}">
								<br /> 2시간권 : <input type="text" class="form-control onlyNumber" id="two_time"
									name="two_time" value="${store[0].mdto.two_time}"> <br />
								일일권 : <input type="text" class="form-control onlyNumber" id="one_day"
									name="one_day" value="${store[0].mdto.one_day}"> <br /> 정기권 : <input type="text" class="form-control onlyNumber" id="month_time"
									name="month_time" value="${store[0].mdto.month_time}"> <br />
							</blockquote>

						</div>

					</div>
				</div>

			</section>
			<section class=" py-3 site-section mb-5">
			</section>
			<!-- 입출차 주의사항 -->
			<section class="site-section bg-light">
				<div class="container">
					<i class="fa fa-warning" style="font-size: 40px; color: red"></i><span
						class="text-danger"><strong>입출차 주의사항</strong></span> <br /> <input
						type="text" class="form-control" id="store_content"
						name="store_content" value="${store[0].sdto.store_content}">



					<p>
						★유효시간 : ?<br /> ★입출차 제한 : ?<br /> ★입출차 방법 : 번호판 자동 인식<br />
						★차단기가 열리지 않을 시 인터폰을 통해 안내 받으세요<br />
					</p>
					<div class="pt-3">
						<p>
							<strong>안내사항</strong><br /> -선불주차권으로 입차 후 구매건 사용 불가<br /> -만차
							혹은 현장 사정에 따라 주차가 어려울 수 있음<br /> -입차 후 주차권 환불 불가<br /> -출차 후 재입차
							시 주차권 적용 불가<br /> -주차권 유효시간 초과시 전액 현장요금 적용<br /> -건물 내 주차할인 중복
							적용 불가<br /> -구매 당일 동일주차권 동일차량번호로 재구매 불가<br /> -연박 주차 불가<br />
						</p>
					</div>
				</div>
			</section>
			<div class="container pb-5">

				<button class="btn btn-primary">수정 완료</button>
				&nbsp;&nbsp; <a href="storeList">목록으로 </a> &nbsp;&nbsp;
			</div>

		</form>
		



	
 <jsp:include page="footer.jsp" />

	</div>
<script>

function ajax_store(keyword){
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false
	})
//-------------검색하는 것--------------------------------------------------------------------------------------------
		var v;
	
		var input = document.getElementById("keyword").value;
		v = input;
		//-------------있어야 함--------------
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.5528651260197 , 126.92697175639572 ), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		//------------있어야 함----------------

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(v, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker1 = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        }); 
		        
		     // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:250px;text-align:center;padding:6px 0;"><b>입력 주소</b><br/>'+input+'</div>'
		        });

        		var lat = coords.getLat(result[0].y);
                var lng = coords.getLng(result[0].x);

		        infowindow.open(map, marker1);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     }		    
		     $("#viewadress").val(input);	

		     $("#picklat").val(lat);
		     $("#picklng").val(lng);		     
		});


//체크 마크 부분 ------------------------- 두 번 넣어서 꼼수임
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	    
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {

	        if (status === kakao.maps.services.Status.OK) {

	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">체크 주소</span>' + 
	                            detailAddr + 
	                        '</div>';        
	            
	                        
	            var latlng = mouseEvent.latLng;

	            var lat = latlng.getLat();
	            var lng = latlng.getLng();
 
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);

	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	        $("#viewadress").val(result[0].address.address_name); 

	        $("#picklat").val(lat);
	        $("#picklng").val(lng);
	    });
	});
//체크 마크 부분 두 번 넣어서 꼼수임	
		
}

//-------------------------지도 바로 나오게 하는 체크 부분-----------------------------------
		//꼼수 부분
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng('${store[0].sdto.store_latitude}', '${store[0].sdto.store_longitude}'), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch('${store[0].sdto.store_address}', function(result, status) {

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
		            content: '<div style="width:250px;text-align:center;padding:6px 0;"><b>주소</b><br/>${store[0].sdto.store_address}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 

		}); 
		// 꼼수 부분
		
		//----------------------------------------------------------------
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">체크 주소</span>' + 
		                            detailAddr + 
		                        '</div>';    

		             var latlng = mouseEvent.latLng;
		             
		             var lat = latlng.getLat();
		             var lng = latlng.getLng();
            
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		        $("#viewadress").val(result[0].address.address_name);    
		        
		        $("#picklat").val(lat);
		        $("#picklng").val(lng);
		    });
		});
		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}

</script>
</body>
</html>


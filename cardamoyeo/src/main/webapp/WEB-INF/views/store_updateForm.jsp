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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js"></script>

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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
#abcd {
	display: none;
}
</style>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<script type="text/javascript">
		$(function(){
			$(".contents .btn").click(function(){
				$("#abcd").toggle("fast");
			});
		});
	</script>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>

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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	64c3c7f6dc4c99843451bcb90bd610c5&libraries=services"></script>
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
						<h1 class="text-white font-weight-bold">매장등록</h1>
						<div class="custom-breadcrumbs">
							<a href="#">Home</a> <span class="mx-2 slash">/</span> <span
								class="text-white"><strong>매장등록</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="site-section">
			<div class="container">

				<div class="row align-items-center mb-5">
					<div class="col-lg-8 mb-4 mb-lg-0">
						<div class="d-flex align-items-center">
							<div>
								<h2>store_updateForm</h2>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="row"></div>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-lg-12">
						<form class="p-4 p-md-5 border rounded" method="post"
							action="storeForm_write?user_id=${user_id }" enctype="multipart/form-data">
							
							<input type="hidden" class="form-control" name= "user_id" id="user_id" value="${user_id}">
							<input type="hidden" class="form-control" id="store_seq">
							<input type="hidden" class="form-control" id="store_busy">
							<input type="hidden" class="form-control" id="store_black">
							<h3 class="text-black mb-5 border-bottom pb-2">매장 등록</h3>
							<div class="form-group">
								<label for="company-website-tw d-block">Upload Image</label> <br> <label class="btn btn-primary btn-md btn-file">
									Browse File<input type="file" name="store_image"  multiple="multiple">
								</label>
								
								
							</div>
							<div class="form-group">
								<label for="store_name">매장명</label> <input type="text"
									class="form-control" id ="store_name" name ="store_name" placeholder="매장이름을 적어주세요">
							</div>

							<div class="form-group">
								<!-- 숫자만 입력되게 함 -->
								<label for="store_space">이용공간 수</label> <input type="text"
									class="form-control onlyNumber" id ="store_space" name="store_space"
									placeholder="이용가능한 공간수를 적어주세요">
							</div>
						<div class="inputbox">
						<div class="inputtitle">주소</div>
							<div class="inputs">
									<div class="inputs">
										<input type="text" id="keyword" name="keyword" size="50" style="text-align:center; width:300px; height:30px; letter-spacing: 0px" placeholder="무슨시 무슨구 정확하게 입력하세요"/>
										<button type="button" id="searchbtn" class="btn btn-primary btn-lg" onclick="ajax_store(keyword.value)">검색</button>
										<input type="text" id="viewadress" name="store_address" class="form-control" placeholder="주소를 확인해주세요 (입력 불가)"/><br/>
										<input type="hidden" id="picklat" name="store_latitude" title="위도"/>
										<input type="hidden" id="picklng" name="store_longitude" title="경도"/>
									</div>				
									<div id="map" style="width:600px;height:600px;"></div>
							</div>
					</div>
							<br/>
							<div class="form-group">
								<label for="store_phone">매장 연락처</label> <input type="text"
									class="form-control" name="store_phone" placeholder="매장연락처를 적어주세요">
							</div>
							<div class="form-group">
								<label for="store_time">운영 시간</label> <input type="time"
									class="form-control" name="store_time_open" placeholder="07:00">
								<input type="time" class="form-control" name="store_time_close"
									placeholder="23:00">
							</div>
							<!-- **체크 -->
							<div class="form-group">
								<label for="store_content">입출차 주의사항 및 안내사항</label>
								<textarea class="form-control" rows="10" name="store_content"
									placeholder="입출차 주의사항 및 안내사항"></textarea>
							</div>
							<br />
							<!-- 요금은 숫자만 입력 할수 있도록 함 -->
							<div class="form-group">
								<h5>
									<strong>주차권 종류</strong>
								</h5>
								<i class="fa fa-exclamation" style="font-size: 30px; color: red"></i>
								<span class="bg-light">숫자만 입력가능</span> <i
									class="fa fa-exclamation" style="font-size: 30px; color: red"></i>

								<br />
								<div class="form-group">
									<label for="store_money">기본요금 (10분당)</label> <input type="text"
										class="form-control onlyNumber" id="store_money" name="store_money">
								</div>
								<div class="form-group">
									<label for="one_time">1시간 권</label> <input type="text"
										class="form-control onlyNumber" id="one_time" name="one_time">
								</div>
								<div class="form-group">
									<label for="two_time">2시간 권</label> <input type="text"
										class="form-control onlyNumber" id="two_time" name="two_time">
								</div>
								<div class="form-group">
									<label for="one_day">일일 권</label> <input type="text"
										class="form-control onlyNumber" id="one_day" name="one_day">
								</div>
								<div class="form-group">
									<label for="month_time">정기 권</label> <input type="text"
										class="form-control onlyNumber" id="month_time" name="month_time">
								</div>
								<br />
								<div class="form-group">
									<label for="store_bank">은행명</label> <input type="text"
										class="form-control" name="store_bank" id ="store_bank">
								</div>
								<div class="form-group">
									<label for="store_account">계좌번호</label> <input type="text"
										class="form-control" name="store_account" id ="store_account">
								</div>
								<br /> <br />
							</div>




							<div class="contents">
								<input type="button" class="btn btn-primary" value="사업자 번호 추가하기" /><br />
								<br />
								<br />
							</div>

							<div id="abcd">
								<div class="form-group">
									<label for="store_license_number">사업자 번호</label> <input type="text"
										class="form-control" name ="store_license_number" id="store_license_number" placeholder="사업자 등록번호 10자리 입력">
								</div>
								<div class="form-group">
									<label for="company-website-tw d-block">사업자등록 파일첨부</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  	파일올리기<input type="file" name="file" id="store_license_image">
                </label>
							</div>
							
							</div>


							<div style="text-align: right">
								<button class="btn btn-block btn-primary btn-md">등록하기</button>
							</div>

						
						</form>
					</div>
				</div>
			</div>
		</section>
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
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch('마포구 양화로15길 17', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
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




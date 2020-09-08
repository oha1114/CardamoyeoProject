<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
  <head>
    <title>Cardamoyeo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
    

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">  
    
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:550px;height:1000px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

<!-------------------->

.map_wrap .www{
	height: 300px;
	width: 300px;
	background-color: #99ccff;
}

</style>
      <script type="text/javascript" >
      	$(function(){
      		$("#searchman").trigger("click");
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
    </div> <!-- .site-mobile-menu -->
    

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
      <!-- <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Post A Job</h1>
            <div class="custom-breadcrumbs">
              <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <a href="#">Job</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Post a Job</strong></span>
            </div>
          </div>
        </div>
      </div> -->
    </section>

    
   
	
<!-- 지도를 표시할 div 입니다 -->

<div class="map_wrap">
    
	<div id="map" style="width:100%;height:900px;"></div>
    <div id="menu_wrap" class="bg_white" width="200px">
        <div class="option">
                <!-- <form onsubmit="test1(); return false;"> -->
<!--                 <form id="frm"> -->
                	<input type="text" id="keyword" name="keyword" value="${keyword}" size="50" style="text-align:center; width:300px; height:30px; letter-spacing: 0px" placeholder="무슨구 정확하게 입력하세요"/>
                	<button type="button" id="searchman" class="btn btn-primary btn-lg" onclick="ajax_store(keyword.value)">검색</button>
                  <!-- <input type="text" value="홍대 맛집" id="keyword" size="50" style="text-align:center; width:300px; height:30px; letter-spacing: 0px"> 
                    <button type="submit" class="btn btn-primary btn-lg">검색하기</button> -->
<!--                 </form> -->
        </div>
        <hr>
        <ul id="placesList">

        </ul>
        <div id="pagination">
        	        	<table class="table table-hover" id="dataTables-example">
							<thead>
									<tr align="center">
										<th>번호</th>
										<th>주차장명</th>
									</tr>
								</thead>
								<tbody id="frm">
								<%-- <c:if test="${!empty mlist }">
									<c:forEach items="${mlist }" var="store" varStatus="status">
										<tr align="center" valign="middle" bordercolor="#333333"
											onmouseover="this.style.backgroundColor='F8F8F8'"
											onmouseout="this.style.backgroundColor=''">
											<td height="23" style="font-family: Tahoma; font-size: 10pt;">${store.store_seq}
												<!-- index : 0 ~ , count : 1 ~ -->
											</td>
											<td style="font-family: Tahoma; font-size: 10pt;">
												<div align="left">
													 
													<a href="storeDetail?store_seq=${store.store_seq }">${store.store_name}</a>
												</div>
											</td>
											<td style="font-family: Tahoma; font-size: 10pt;">
												<div align="center"></div>
											</td>
											<td style="font-family: Tahoma; font-size: 10pt;">
												<div align="center">
													<a href="#"></a>
												</div>
										</tr>
									</c:forEach>
									<tr class="title">
										
									</tr>
								</c:if>

								<c:if test="${empty mlist }">
									<tr align="center">
										<td colspan="8"><font size=2>등록된 글이 없습니다.</font></td>
									</tr>
								</c:if> --%>
					</tbody>
			</table>
        </div>
    </div>
    
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64c3c7f6dc4c99843451bcb90bd610c5&libraries=services"></script>
<!-- 뭔가 될 것 같은 애매한 시도 -->
<script>
var map;
var lists;
function ajax_store(keyword){
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false,
		success:function(obj){

			var listele="";
			lists=obj.mlist;
				for(var i = 0; i < lists.length; i++){
				
				listele+='<tr align="center" valign="middle" bordercolor="#333333" onmouseover="this.style.backgroundColor=\'F8F8F8\'" onmouseout="this.style.backgroundColor=\'F8F8F8\'">'
				+ 	'<td height="23" style="font-family: Tahoma; font-size: 10pt;">'
				+lists[i].store_seq
				+	'</td>'
				+	'<td style="font-family: Tahoma; font-size: 10pt;">'
				+		'<div align="left" onmouseover="testInfowindow('+lists[i].store_latitude+','+lists[i].store_longitude+',\''+lists[i].store_name+'\',true)" onmouseout="testInfowindow('+lists[i].store_latitude+','+lists[i].store_longitude+',\''+lists[i].store_name+'\',false)">'
				+			'<a href="storeDetail?store_seq='+lists[i].store_seq+'">'
				+ lists[i].store_name
				+	'</a></div></td></tr>'
			}
						
			$("#frm").html(listele);

			//-------------있어야 함--------------
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(lists[0].store_latitude , lists[0].store_longitude ), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			 map = new kakao.maps.Map(mapContainer, mapOption);
			//------------있어야 함----------------

//다다다다시
			var positions = [];

		    for (var i = 0; i < lists.length; i++) {
			     var mapcoord={	
			    		map : map,
		                content: '<div>'+lists[i].store_name+'</div>', 
		                latlng: new kakao.maps.LatLng(lists[i].store_latitude , lists[i].store_longitude)
		            }
			     positions.push(mapcoord);
			}
			for (var i = 0; i < positions.length; i ++) {
	            // 마커를 생성합니다
	            var marker = new kakao.maps.Marker({
	                map: map, // 마커를 표시할 지도
	                position: positions[i].latlng // 마커의 위치
	                //content: positions[i].content
	            });
	            // 마커에 표시할 인포윈도우를 생성합니다 
		            var infowindow = new kakao.maps.InfoWindow({
		                content: positions[i].content // 인포윈도우에 표시할 내용
		            });
	            	//---마우스 오버 아웃
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        }
		     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		        function makeOverListener(map, marker, infowindow) {
		            return function() {
		                infowindow.open(map, marker);
		            };
		        }
		        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		        function makeOutListener(infowindow) {
		            return function() {
		                infowindow.close();
		            };
		        }
			//--------------------마우스 오버 아웃
		}
	});
}

// 생성된 인포윈도우 담아둘 전역변수
var infowindow1;
    
function testInfowindow(x,y,z,bool){
    if(bool){
    	// 인포윈도우를 생성합니다
		infowindow= new kakao.maps.InfoWindow({
		    position : new kakao.maps.LatLng(x, y),   //인포윈도우 표시 위치입니다
		    content : z
		});	
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map,
						new kakao.maps.Marker({
							map:map,
						    position: new kakao.maps.LatLng(x, y) 
						})
		); 
    }else{
//	    	// 마커 위에 인포윈도우를 제거합니다.
		infowindow.close();
    }		  
}
</script>
















<!-- <script>
// 꼼수 부분
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

var v;
function test1(){
	var input = document.getElementById("testtest").value;
	v = input;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(v, function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
}
</script> -->


<!-- 애매한 시도 -->
<!-- <script>
var v;
function test1(){
	var input = document.getElementById("testtest").value;
	v = input;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.5528651260197 , 126.92697175639572 ), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(v, function(result, status) {
	
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        
	     	// 마커가 표시될 위치입니다 
	        var markerPosition  = new kakao.maps.LatLng(37.55498745005133 , 126.92072255582038 ); 

	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	        	map: map,
	            position: markerPosition
	        });
	    } 
	});    
}
</script> -->

















<!-- <script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

var v;
function test1(){
	var input = document.getElementById("testtest").value;
	v = input; 
 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(v, function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   
</script> -->




    
<!-- 임시======================================== 중요한 것 =====================0731 오전 등원 직후========================-->
<!-- 뭔가 될 것 같은 애매한 시도 -->
<!-- <script>
var lists;
function ajax_store(keyword){
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false,
		success:function(obj){
			//alert(obj.mlist.length);
			
			var listele="";
			lists=obj.mlist;
			//alert(lists[0].store_name);
			for(var i = 0; i < lists.length; i++){
				
				listele+='<tr align="center" valign="middle" bordercolor="#333333" onmouseover="this.style.backgroundColor=\'F8F8F8\'" onmouseout="this.style.backgroundColor=\'F8F8F8\'">'
				+ 	'<td height="23" style="font-family: Tahoma; font-size: 10pt;">'
				+lists[i].store_seq
				+	'</td>'
				+	'<td style="font-family: Tahoma; font-size: 10pt;">'
				+		'<div align="left">'
				+			'<a href="storeDetail?store_seq=${store.store_seq }">'
				+lists[i].store_name
				+	'</a></div></td></tr>'
						
				
			}
			$("#frm").html(listele);
				
		}
	})
//----------------------------------------------------------------------------------------------구 test1()------------
	var v;
	
		var input = document.getElementById("keyword").value;
		v = input;
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.5528651260197 , 126.92697175639572 ), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(v, function(result, status) {

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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색 주소</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    //-------------------------------===================찐 줄======================-------------------------------------    
		   	 var positions = [];
		   	
		    for (var i = 0; i < lists.length; i++) {
			     var mapcoord={	
		                content: '<div>'+lists[i].store_name+'5</div>', 
		                latlng: new kakao.maps.LatLng(lists[i].store_latitude , lists[i].store_longitude)
		            }
			     
				positions.push(mapcoord);
			}

// 		        var positions = [
// 		           {	
// 		                content: '<div>카카오</div>', 
// 		                latlng: new kakao.maps.LatLng(37.5528651260197 , 126.920677)
// 		            },
// 		            {
// 		                content: '<div>생태연못</div>', 
// 		                latlng: new kakao.maps.LatLng(37.550936, 126.929477)
// 		            },
// 		            {
// 		                content: '<div>텃밭</div>', 
// 		                latlng: new kakao.maps.LatLng(37.550879, 126.929940)
// 		            },
// 		            {
// 		                content: '<div>근린공원</div>',
// 		                latlng: new kakao.maps.LatLng(37.551393, 126.920738)
// 		            }
// 		        ];

		        for (var i = 0; i < positions.length; i ++) {
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 표시할 지도
		                position: positions[i].latlng // 마커의 위치
		            });
		         // 마커에 표시할 인포윈도우를 생성합니다 
		            var infowindow = new kakao.maps.InfoWindow({
		                content: positions[i].content // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		            /* kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {        
		                window.open(positions[i].content);
		            }); */
		        }
		        /* function(mouseEvent){
		        	window.open('www.naver.com');
		        } */
		        
		     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		        function makeOverListener(map, marker, infowindow) {
		            return function() {
		                infowindow.open(map, marker);
		            };
		        }

		        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		        function makeOutListener(infowindow) {
		            return function() {
		                infowindow.close();
		            };
		        }
		     } 
		});    
}
</script> -->



<!-- -------------------------------------0731 오후 1시 25분-----------------또다시 도전-------------- -->
<!-- 뭔가 될 것 같은 애매한 시도 -->
<!-- <script>







var lists;
function ajax_store(keyword){
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false,
		success:function(obj){
			//alert(obj.mlist.length);
			
			var listele="";
			lists=obj.mlist;
			//alert(lists[0].store_name);
			for(var i = 0; i < lists.length; i++){
				
				listele+='<tr align="center" valign="middle" bordercolor="#333333" onmouseover="this.style.backgroundColor=\'F8F8F8\'" onmouseout="this.style.backgroundColor=\'F8F8F8\'">'
				+ 	'<td height="23" style="font-family: Tahoma; font-size: 10pt;">'
				+lists[i].store_seq
				+	'</td>'
				+	'<td style="font-family: Tahoma; font-size: 10pt;">'
				+		'<div align="left">'
				+			'<a href="storeDetail?store_seq=${store.store_seq }">'
				+lists[i].store_name
				+	'</a></div></td></tr>'
						
				
			}
			$("#frm").html(listele);
				
		}
	})
//----------------------------------------------------------------------------------------------구 test1()------------
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
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        }); 
		        
		     // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색 주소</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    //-------------------------------===================찐 줄======================-------------------------------------    
		   	 var positions = [];
		   	
		    for (var i = 0; i < lists.length; i++) {
			     var mapcoord={	
		                content: '<div>'+lists[i].store_name+'5</div>', 
		                latlng: new kakao.maps.LatLng(lists[i].store_latitude , lists[i].store_longitude)
		            }			     
				positions.push(mapcoord);
			}
		        for (var i = 0; i < positions.length; i ++) {
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 표시할 지도
		                position: positions[i].latlng // 마커의 위치
		            });
		         // 마커에 표시할 인포윈도우를 생성합니다 
		            var infowindow = new kakao.maps.InfoWindow({
		                content: positions[i].content // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		        }
		     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		        function makeOverListener(map, marker, infowindow) {
		            return function() {
		                infowindow.open(map, marker);
		            };
		        }
		        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		        function makeOutListener(infowindow) {
		            return function() {
		                infowindow.close();
		            };
		        }
		     } 
		});    
}

function ajax_store2(keyword){
	
	//alert("안녕");
	
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false,
		success:function(obj){

			var listele="";
			lists=obj.mlist;
			//alert(lists[0].store_name);
			for(var i = 0; i < lists.length; i++){
				
				listele+='<tr align="center" valign="middle" bordercolor="#333333" onmouseover="this.style.backgroundColor=\'F8F8F8\'" onmouseout="this.style.backgroundColor=\'F8F8F8\'">'
				+ 	'<td height="23" style="font-family: Tahoma; font-size: 10pt;">'
				+lists[i].store_seq
				+	'</td>'
				+	'<td style="font-family: Tahoma; font-size: 10pt;">'
				+		'<div align="left">'
				+			'<a href="javascript:callFunction();" onclick="return false;">'
				+lists[i].store_name
				+	'</a></div></td></tr>'
			}
			
			$("#frm").html(listele);

			//-------------있어야 함--------------
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(lists[0].store_latitude , lists[0].store_longitude ), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			//------------있어야 함----------------
			
			var positions = [];
		   	
		    for (var i = 0; i < lists.length; i++) {
			     var mapcoord={	
		                content: '<div>'+lists[i].store_name+'5</div>', 
		                latlng: new kakao.maps.LatLng(lists[i].store_latitude , lists[i].store_longitude)
		            }
			     positions.push(mapcoord);
			}
			for (var i = 0; i < positions.length; i ++) {
	            // 마커를 생성합니다
	            var marker = new kakao.maps.Marker({
	                map: map, // 마커를 표시할 지도
	                position: positions[i].latlng // 마커의 위치
	            });
	         // 마커에 표시할 인포윈도우를 생성합니다 
	            var infowindow = new kakao.maps.InfoWindow({
	                content: positions[i].content // 인포윈도우에 표시할 내용
	            });
	            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        }
	     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	        function makeOverListener(map, marker, infowindow) {
	            return function() {
	                infowindow.open(map, marker);
	            };
	        }
	        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	        function makeOutListener(infowindow) {
	            return function() {
	                infowindow.close();
	            };
	        }
		}
	});
}
</script> -->
<!-- <script>
function ajax_store(keyword){
	$.ajax({
		url:"map_list",
		method:"post",
		dataType:"json",
		data:{"keyword":keyword},
// 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		async:false,
		success:function(obj){
			//alert(obj.mlist.length);
			
			var listele="";
			lists=obj.mlist;
			//alert(lists[0].store_name);
			for(var i = 0; i < lists.length; i++){
				
				listele+='<tr align="center" valign="middle" bordercolor="#333333" onmouseover="this.style.backgroundColor=\'F8F8F8\'" onmouseout="this.style.backgroundColor=\'F8F8F8\'">'
				+ 	'<td height="23" style="font-family: Tahoma; font-size: 10pt;">'
				+lists[i].store_seq
				+	'</td>'
				+	'<td style="font-family: Tahoma; font-size: 10pt;">'
				+		'<div align="left">'
				+			'<a href="storeDetail?store_seq=${store.store_seq }">'
				+lists[i].store_name
				+	'</a></div></td></tr>'
						
				
			}
			$("#frm").html(listele);
				
		}
	})
//----------------------------------------------------------------------------------------------구 test1()------------
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
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        }); 
		        
		     // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색 주소</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    //-------------------------------===================찐 줄======================-------------------------------------    
		   	 var positions = [];
		   	
		    for (var i = 0; i < lists.length; i++) {
			     var mapcoord={	
		                content: '<div>'+lists[i].store_name+'5</div>', 
		                latlng: new kakao.maps.LatLng(lists[i].store_latitude , lists[i].store_longitude)
		            }			     
				positions.push(mapcoord);
			}
		        for (var i = 0; i < positions.length; i ++) {
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 표시할 지도
		                position: positions[i].latlng // 마커의 위치
		            });
		         // 마커에 표시할 인포윈도우를 생성합니다 
		            var infowindow = new kakao.maps.InfoWindow({
		                content: positions[i].content // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		        }
		     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		        function makeOverListener(map, marker, infowindow) {
		            return function() {
		                infowindow.open(map, marker);
		            };
		        }
		        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		        function makeOutListener(infowindow) {
		            return function() {
		                infowindow.close();
		            };
		        }
		     } 
		});    
}
</script> -->





    

  
  </div>

    <!-- SCRIPTS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/stickyfill.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/quill.min.js"></script>
    
    
    <script src="js/bootstrap-select.min.js"></script>
    
    <script src="js/custom.js"></script>
   

     
</body>
</html>
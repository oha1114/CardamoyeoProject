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

#gallery {
	width: 600px;
	height: 500px;
	margin: 0;
}
</style>


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
						<h1 class="text-white font-weight-bold">매장상세페이지</h1>
						<div class="custom-breadcrumbs">
							<a href="index.html">Home</a> <span class="mx-2 slash">/</span>
							<span class="text-white"><strong>Store_Detail</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<form action="storeModify" method="post" enctype="multipart/form-data">
		<input type="hidden" name ="user_id" id="user_id" value="${user_id}"/>
			<section class="site-section pb-0 portfolio-single" id="next-section">
				<div class="container">
					<div class="row mb-5 mt-5">
						<div id="gallery" class="carousel slide" data-ride="carousel">
							<c:set var="count" value="0" />
							<div class="carousel-inner">
								<div class="col-lg-8">

									<c:forEach items="${store}" var="dto">
										<input type="hidden" class="form-control" id="store_image_seq"
											name="store_image_seq" value="${dto.store_image_seq}">
										<div class="carousel-item ${count == 0?'active':''}">
											<figure>
												<img src="upload/${dto.store_image}" alt="Image"
													style="width: 615; height: 416px;" />
											</figure>
										</div>

										<c:set var="count" value="1" />
									</c:forEach>

								</div>
							</div>
							<a class="carousel-control-prev" href="#gallery" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#gallery" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
						<script>
							var timer = setInterval(function() {
								$('#nextButton').trigger('click');
							}, 2000)
						</script>



						<div class="col-lg-4 ml-auto h-100 jm-sticky-top">
							<div class="mb-4">
								<input type="hidden" class="form-control" id="store_seq"
									name="store_seq" value="${store[0].store_seq}"> <input
									type="hidden" class="form-control" id="store_image_seq"
									name="store_image_seq" value="${store[0].store_image_seq}">

								<input type="hidden" class="form-control" id="menu_num"
									name="menu_num" value="${store[0].mdto.menu_num}">

								<h3 class="mb-4 h4 border-bottom">${store[0].sdto.store_name}

								</h3>
								<!-- 리뷰 총점 표시 -->
								<script type="text/javascript"
									src="https://code.jquery.com/jquery-latest.js">
									
								</script>
								<script type="text/javascript">
								$(document).ready(function(){
									$.fn.generateStars = function() {
										return this .each(function(i, e) {
											$(e).html(
												$('<span/>').width(
													$(e).text() * 16));
												});
									};
								
									
										// 숫자 평점을 별로 변환하도록 호출하는 함수
										$('.star-prototype').generateStars();
								});	
								</script>
								<c:if test="${total[0].store_star!=null}">
								<p class="mb-0">
									<span class="star-prototype">${total[0].store_star}</span>(${total[0].store_star})
								</p>
								</c:if>
								<c:if test ="${total[0].store_star==null}">
									<p class="mb-0">
									<span>등록된 리뷰가 없습니다.</span>
								</p>
								</c:if>
							</div>


							<div class="row mb-4">

								<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
									<strong class="d-block text-black">영업 시간</strong><br />
									${store[0].sdto.store_time_open} -
									${store[0].sdto.store_time_close}
								</div>
								<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
									<strong class="d-block text-black">매장 주소</strong><br />
									${store[0].sdto.store_address}
								</div>
								<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
									<strong class="d-block text-black">매장 연락처</strong><br />
									${store[0].sdto.store_phone}
								</div>
								<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
									<strong class="d-block text-black mb-3">혼잡도&이용공간수</strong><br />
									${store[0].sdto.store_space}
									<c:if test="${store[0].sdto.store_space <'100'}">
									 <a href="#" class="btn btn-outline-danger border-width-2">혼잡</a> 
									</c:if>
									<c:if test="${store[0].sdto.store_space >'100'}">
									 <a href="#" class="btn btn-outline-success border-width-2">여유</a>
									 </c:if>
								</div>
							</div>

							<div class="block__87154 mb-0" style="font-size: 20px;">
								
								<blockquote>
									<i class="fa fa-automobile" style="font-size: 24px"></i>
									<!-- checkbox아니면 dropdown으로 일단 checkbox사용 -->
									<strong>주차권 요금</strong><br /> 
									기본요금 (10분당) :	${store[0].mdto.store_money}
										<br />
									1시간권 : ${store[0].mdto.one_time}
									<br />
									  2시간권 : ${store[0].mdto.two_time}
									 <br /> 
									 일일권 : 	${store[0].mdto.one_day} 
									<br /> 
									 정기권 : 	${store[0].mdto.month_time} 
									<br />
								</blockquote>

							</div>
						</div>
					</div>
				</div>
			</section>
			<section class=" py-3 site-section mb-5">
				<div class="container">

					<div class="row">
					
						<sec:authorize access="hasAuthority('ROLE_U')">
						<c:choose>
							<c:when test="${empty ke}">
							<div class="col-md-4 text-center">

								<!-- like and dislike -->
								<i onclick="myFunction(this)" class="fa fa-heart-o"></i>
							</div>
								</c:when>
								<c:otherwise>
									
								<div class="col-md-4 text-center">
									<i onclick="myFunction(this)" class="fa fa-heart"></i>
								</div>
							
								</c:otherwise>
							</c:choose>
							<script>
								function myFunction(x) {
									
									if (x.classList.contains("fa-heart")) {
										x.classList.remove("fa-heart");
										x.classList.add("fa-heart-o");
										
										$.ajax({
											type : "POST",
											url : "likeNo",
											data : {"user_id":"${user_id}",
													"store_seq":"${store[0].store_seq}"},
											dataType : "text",
											success : function(data){
												consol.log(data);
												alert(data);
											},
											error : function(){
												
											}
										});
										
										
									} else {
										x.classList.remove("fa-heart-o");
									
										x.classList.add("fa-heart");
										
										$.ajax({
											type : "POST",
											url : "likeOk",
											data : {"user_id":"${user_id}",
													"store_seq":"${store[0].store_seq}"},
											dataType : "text",
											success : function(data){
												consol.log(data);
												alert(data);
											},
											error : function(){
												
											}
										});
									}
								}
							</script>
							<div class="col-md-4 text-center">
								<a href="#"
									class="btn btn-md btn-outline-primary border-width-2 d-block">실시간
									채팅하기</a>
							</div>
							<div class="col-md-4 text-center">
								<a href="resForm?store_seq=${store[0].store_seq }&user_id=${user_id}"
									class="btn btn-md btn-primary border-width-2 d-block">예약하기</a>
							</div>
						</sec:authorize>



					</div>
				</div>
			</section>
			<!-- 입출차 주의사항 -->
			<section class="site-section bg-light">
				<div class="container">
					<i class="fa fa-warning" style="font-size: 40px; color: red"></i><span
						class="text-danger"><strong>입출차 주의사항</strong></span><br />

					<br /> 
					<p>
						<strong>★입출차 규정<br/>&nbsp;&nbsp;&nbsp; ${store[0].sdto.store_content}<br /></strong> ★입출차 방법 : 번호판 자동 인식<br />
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
			<sec:authorize access="hasAuthority('ROLE_O')">
				<div class="container">

					<a href="storeModifyForm?store_seq=${store[0].store_seq}">수정</a>
					&nbsp;&nbsp; <a href="storeList?user_id=${user_id }">목록보기</a> &nbsp;&nbsp; <a
						href="storeDelete?store_seq=${store[0].store_seq}&user_id=${user_id}">삭제</a>
				</div>
			</sec:authorize>
		</form>
		<script type="text/javascript">
					//별점 마킹 모듈 프로토타입으로 생성
					function Rating() {};
					Rating.prototype.rate = 0;
					Rating.prototype.setRate = function(newrate) {
						//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
						this.rate = newrate;
						let items = document.querySelectorAll('.rate_radio');
						items.forEach(function(item, idx) {
							if (idx < newrate) {
								item.checked = true;
							} else {
								item.checked = false;
							}
						});
					}
					let rating = new Rating();//별점 인스턴스 생성

					document.addEventListener('DOMContentLoaded', function() {
						//별점선택 이벤트 리스너
						document.querySelector('.rating').addEventListener(
								'click', function(e) {
									let elem = e.target;
									if (elem.classList.contains('rate_radio')) {
										rating.setRate(parseInt(elem.value));
									}
								})
					});

					//상품평 작성 글자수 초과 체크 이벤트 리스너
					document.querySelector('.review_textarea').addEventListener('keydown',function() {
										//리뷰 400자 초과 안되게 자동 자름
										let review = document.querySelector('.review_textarea');
										let lengthCheckEx = /^.{400,}$/;
										if (lengthCheckEx.test(review.value)) {
											//400자 초과 컷
											review.value = review.value.substr(0, 400);
										}
									});

					//저장 전송전 필드 체크 이벤트 리스너
					document.querySelector('#save').addEventListener('click',function(e) {
										//별점 선택 안했으면 메시지 표시
										if (rating.rate == 0) {
											rating.showMessage('rate');
											return false;
										}
										//리뷰 5자 미만이면 메시지 표시
										if (document.querySelector('.review_textarea').value.length < 5) {
											rating.showMessage('review');
											return false;
										}
										//폼 서밋
									});
					Rating.prototype.showMessage = function(type) {//경고메시지 표시
						switch (type) {
						case 'rate':
							//안내메시지 표시
							document.querySelector('.review_rating .warning_msg').style.display = 'block';
							//지정된 시간 후 안내 메시지 감춤
							setTimeout(
									function() {
										document.querySelector('.review_rating .warning_msg').style.display = 'none';
									}, 1000);
							break;
						case 'review':
							//안내메시지 표시
							document.querySelector('.review_contents .warning_msg').style.display = 'block';
							//지정된 시간 후 안내 메시지 감춤
							setTimeout(
									function() {
										document.querySelector('.review_contents .warning_msg').style.display = 'none';
									}, 1000);
							break;
						}
					}

					// 					var locked =0;
					// 					function show(star){
					// 						if(locked)
					// 							return;
					// 						var i;
					// 						var image;
					// 						var el;
					// 						var e = document.getElementById('startext');
					// 					}
				</script>
<br/><br/>
	<input type="hidden" name ="user_id" id="user_id" value="${user_id}"/>
<c:choose>
<c:when test="${!empty list}">
		<!-- 리뷰작성 -->
		<section class="site-section">
		<sec:authorize access="hasAuthority('ROLE_U')">
			<div class="wrap">
				<h2>Review</h2>
				<form name="reviewform" class="reviewform" method="post"
					action="reviewform">
					<input type="hidden" name ="user_id" id="user_id" value="${user_id}"/>
					<input type="hidden" name="rate" id="rate" value="0" /> <input
						type="hidden" class="form-control" name="store_seq" id="store_seq"
						value="${store[0].store_seq}"> <input type="hidden"
						name="review_seq" id="review_seq" value="0" />
					<p class="title_star">별점과 리뷰를 남겨주세요.</p>

					<div class="review_rating">
						<div class="warning_msg">별점을 선택해 주세요.</div>
						<div class="rating">
							<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
							<input type="checkbox" name="store_star" id="rating1" value="1"
								class="rate_radio" title="1점"> <label for="rating1"></label>
							<input type="checkbox" name="store_star" id="rating2" value="2"
								class="rate_radio" title="2점"> <label for="rating2"></label>
							<input type="checkbox" name="store_star" id="rating3" value="3"
								class="rate_radio" title="3점"> <label for="rating3"></label>
							<input type="checkbox" name="store_star" id="rating4" value="4"
								class="rate_radio" title="4점"> <label for="rating4"></label>
							<input type="checkbox" name="store_star" id="rating5" value="5"
								class="rate_radio" title="5점"> <label for="rating5"></label>
						</div>
					</div>
					<div class="review_contents">
						<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
						<textarea rows="10" class="review_textarea" name="review_content"
							id="review_content" placeholder="리뷰를 작성해주세요"></textarea>
					</div>
					<div class="cmd">
						<button class="btn btn-block btn-primary btn-md" id="save" name ="save">등록</button>
					</div>
				</form>
				
			</div>
			</sec:authorize>
		</section>
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
		</c:choose>
		<!-- 리뷰작성 끝 -->
		<!-- 등록된 리뷰 리스트 부분 -->
		<div class="container">
		
			
			<c:forEach var="rv" items="${review}">
			<ul class="job-listings mb-5">
				<li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
					
					<div class="job-listing-logo">
						<i class="fa fa-user" style="font-size: 90px"></i>
					</div> 
						
							<div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">

								<div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
									<h2>${rv.rdto.user_id}</h2>
									<span> <c:if test="${rv.rdto.store_star == 1}">
											<img src="images/star_1.PNG">
										</c:if> <c:if test="${rv.rdto.store_star == 2}">
											<img src="images/star_2.PNG">
										</c:if> <c:if test="${rv.rdto.store_star == 3}">
											<img src="images/star_3.PNG">
										</c:if> <c:if test="${rv.rdto.store_star == 4}">
											<img src="images/star_4.PNG">
										</c:if> <c:if test="${rv.rdto.store_star == 5}">
											<img src="images/star_5.PNG">
										</c:if>
									</span><br /><br />
									${rv.rdto.review_content }
								</div>
								<div class="job-listing-location mt-3 mt-sm-0 custom-width w-25">
									<span class="icon-calendar-o"></span>|<fmt:formatDate value="${rv.rdto.review_date }" type="date" pattern="yyyy-MM-dd"/> 
								
								</div>&nbsp;&nbsp;
								<!-- 리뷰는 작성한사용자만 삭제 가능 -->
								<div class = "mt-3 mt-sm-0 ">
									<sec:authorize access="hasAuthority('ROLE_U')">
										<a href="reviewDel_1?review_seq=${rv.rdto.review_seq}&store_seq=${store[0].store_seq}" style="font-size:25px">X</a>
									</sec:authorize>
								</div>
								
							</div>
				</li>
			
			</ul>				
						</c:forEach>
					
			
			
			
		</div>
		<!-- 등록된 리뷰리스트 부분 끝 -->



 <jsp:include page="footer.jsp" />
	</div>

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
</body>
</html>

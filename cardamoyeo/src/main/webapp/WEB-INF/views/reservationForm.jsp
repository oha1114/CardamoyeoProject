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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<h1 class="text-white font-weight-bold">reservationForm</h1>
						<div class="custom-breadcrumbs">
							<a href="#">Home</a> <span class="mx-2 slash">/</span> <span
								class="text-white"><strong>reservationForm</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<script type="text/javascript">
		//중복선택 방지
		function oneCheckbox(a){

      	  var obj = document.getElementsByName("menu_type");

       	 	for(var i=0; i<obj.length; i++){
	
          	  if(obj[i] != a){

               	 obj[i].checked = false;
          	  }
 	   	 	}
       	 	
       	 	
       	 	
       	 	$("#total").text($(a).prev("span").text());
       	 	
       	 $("#res_pay").val($("#total").text());
       	
       	 
   		 }	
		
		$("input:checkbox[name='menu_type']:checked").val()
		</script>


		<!-- ****여기가 진짜****** -->
		<section class="site-section">
			<div class="container">
				<form class="p-4 p-md-5 border rounded" method="post" action="resForm_1">
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 mb-4 mb-lg-0">
							<div class="d-flex align-items-center">
								<div>
									<h2>결제페이지</h2>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="row"></div>
						</div>
					</div>
					<div class="row mb-5">

						<div class="col-lg-12">

							<input type="hidden" class="form-control" name ="store_seq" id="store_seq" value ="${store[0].sdto.store_seq}">
							
							<input type="hidden" class="form-control" name ="user_id" id="user_id" value="${user_id}">
							<h3 class="text-black mb-5 border-bottom pb-2">${store[0].sdto.store_name}</h3>
							<br />
							<h5 class="text-black mb-5 border-bottom pb-2">${store[0].sdto.store_address}</h5>
							<div class="form-group">
								<label for="car_num">차량번호</label> <input type="text"
									class="form-control" id="car_num" name="car_num"
									placeholder="345조9995">
							</div>

							<div class="form-group">
								<!-- 숫자만 입력되게 함 -->
								<label for="res_intime">입차 예상 시간</label> <input type="time"
									class="form-control" id="res_intime" name="res_intime"
									placeholder="입차 예상 시간을 입력해주세요">
							</div>
							<div class="form-group">
								<label for="res_date">이용 날짜</label> <input type="date"
									class="form-control" id="res_date" name="res_date">
							</div>
							<br /> <br />
							<div class="form-group">
								<h5>
									<strong>주차권 요금</strong><br /> <br />
								</h5>
								<label id="store_money">기본요금 (10분당)</label> :
								<span>${store[0].mdto.store_money}</span> 원&nbsp;&nbsp;<input type="checkbox"
									name="menu_type" value="기본요금" onclick="oneCheckbox(this)">
								<br /> <br /> <label id="one_time">1시간권 </label>:
								<span>${store[0].mdto.one_time}</span> 원&nbsp;&nbsp;<input type="checkbox"
									name="menu_type" value="1시간권" onclick="oneCheckbox(this)">
								<br /> <br /> <label id="two_time"> 2시간권</label> :
								<span>${store[0].mdto.two_time}</span> 원&nbsp;&nbsp;<input type="checkbox"
									name="menu_type" value="2시간권" onclick="oneCheckbox(this)">
								<br /> <br /> <label id="one_day"> 일일권</label> :
								<span>${store[0].mdto.one_day}</span> 원&nbsp;&nbsp;<input type="checkbox"
									name="menu_type" value="일일권" onclick="oneCheckbox(this)">
								<br /> <br /> <label id="month_time">정기권 </label>:
								<span>${store[0].mdto.month_time}</span> 원&nbsp;&nbsp;<input type="checkbox"
									name="menu_type" value="정기권" onclick="oneCheckbox(this)">
								<br />

							</div>
							<h5 class="text-inline border-bottom pt-5"
								style="text-align: right">
								<strong>결제 금액 : </strong><input type="hidden" name="res_pay" id="res_pay"/><span id="total"></span> 원
							</h5>
							
						</div>

					</div>
					<div class="row align-items-center mb-5">

						<div class="col-lg-4 ml-auto">
							<div class="row">
								<div class="col-6">
									<a href="storeDetail?store_seq=${store[0].store_seq}"
										class="btn btn-block btn-light btn-md"><span
										class="icon-open_in_new mr-2"></span>취소하기</a>
								</div>
								<div class="col-6">
								  <button class="btn btn-block btn-primary btn-md">다음</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</section>


	<jsp:include page="footer.jsp" />

	</div>








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


</body>
</html>
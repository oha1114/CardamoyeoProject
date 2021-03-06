<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap, java.util.Set, java.util.Map, java.util.Iterator"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">
<head>
   <title>Cardamoyeo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
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
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">마이페이지</h1>
            <div class="custom-breadcrumbs">
              <a href="<%=request.getContextPath()%>">Home</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Mypage</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>


	<div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">관리자 마이페이지</h1>
            <div class="custom-breadcrumbs">
              <span class="text-white"><strong>Mypage</strong></span>
            </div>
          </div>
        </div>
	</div>

    <section class="site-section services-section bg-light block__62849" id="next-section">
      <div class="container">
        
        <div class="row">          
          <div class="col-6 col-md-6 col-lg-6 mb-4 mb-lg-5">           
            <a href="userManager" class="block__16443 text-center d-block">
              <span class="custom-icon mx-auto"><span class="icon-user d-block"></span></span>
              <h3>사용자 정보관리</h3>
            </a>            
			<input type="hidden" id="user_id" name="user_id" value="${user_id }">
          </div> 
          <div class="col-6 col-md-6 col-lg-6 mb-4 mb-lg-5">
            <a href="ownerManager" class="block__16443 text-center d-block">
              <span class="custom-icon mx-auto"><span class="icon-laptop d-block"></span></span>
              <h3>업체 정보관리</h3>
            </a>            
          </div>
          <div class="col-6 col-md-6 col-lg-6 mb-4 mb-lg-5">
            <a href="managerInfo?user_id=${user_id }" class="block__16443 text-center d-block">
              <span class="custom-icon mx-auto"><span class="icon-magnet d-block"></span></span>
              <h3>관리자 정보관리</h3>
            </a>
          </div>
          <div class="col-6 col-md-6 col-lg-6 mb-4 mb-lg-5">            
            <a href="userDel" class="block__16443 text-center d-block">
              <span class="custom-icon mx-auto"><span class="icon-plug d-block"></span></span>
              <h3>회원탈퇴</h3>
            </a>
          </div>
        </div>        
      </div>
    </section>

    <jsp:include page="footer.jsp" />
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
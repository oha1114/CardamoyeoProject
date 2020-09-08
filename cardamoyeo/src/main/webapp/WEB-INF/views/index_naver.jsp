<%@page import="com.hk.cardamoyeo.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="ko">
  <head>
    <title>Cardamoyeo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <link rel="shortcut icon" href="ftco-32x32.png">
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">    
    <script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
charset="utf-8"></script>
  
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
          
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
				<div class="ml-auto">
						 <div id="name"></div>
              	    	 <a href="<c:url value='logout' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>로그아웃</a>
              	    	 <a href="<c:url value='userMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
              	    	
              	    	<sec:authorize access="hasAuthority('ROLE_M')">
							<a href="<c:url value='managerMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ROLE_O')">
							<a href="<c:url value='ownerMypage' />" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">마이페이지</a>
							<a href="<c:url value='/owner/store' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>매장등록</a>
						</sec:authorize>
					
				</div>				
			<a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>
			 
        </div>
      </div>
    </header>

    <!-- HOME -->
    <section class="home-section section-hero overlay bg-image" style="background-image: url('images/bg_parking.jpg');" id="home-section">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="mb-5 text-center">
              <h1 class="text-white font-weight-bold">Cardamoyeo &nbsp;<i class="fas fa-car"></i></h1>
              <p>Find the parking lot in the area you want.</p>
            </div>
            <form method="post" action="map" class="search-jobs-form">
              <div class="row mb-5">           
                <div class="input-group mb-3">
                	<input type="text" id="keyword" name="keyword" size="50" class="form-control form-control-lg" placeholder="구, 주차장 이름으로 검색 가능"/>
                	<div class="input-group-append">
                		<button type="submit" id="searchman" class="btn btn-primary btn-lg">검색</button>
                	</div>
                </div>
              </div>  
            </form>
          </div>
        </div>
      </div>

      <a href="#next" class="scroll-button smoothscroll">
        <span class=" icon-keyboard_arrow_down"></span>
      </a>

    </section>
    
    <section class="site-section py-5" id="next" style="background: #90c317;">
      <div class="container">
        <div class="row mt-2 justify-content-center">
          <div class="col-md-7 text-center">
            <h2 class="section-title mb-2 text-white">서비스소개</h2>
          </div>
        </div>
      </div>
    </section>
    
    <section class="site-section py-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 text-center mt-4 mb-5">
            <div class="row justify-content-center">
              <div class="col-md-12">
                <img alt="serviceImage" src="<%=request.getContextPath()%>/resources/images/service1.jpg">
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <jsp:include page="footer.jsp" />
  
  </div>

    <!-- SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var name = ${result}.response.name;
		$("#name").text(name + "님, 반갑습니다!");
	});
  </script>
     
  </body>
</html>
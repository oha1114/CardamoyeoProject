<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
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
    </div>
    

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
            <h1 class="text-white font-weight-bold"><a href="qna_list" class="text-white">Q&A</a></h1>
            <div class="custom-breadcrumbs">
              <!-- <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <a href="#">Job</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Post a Job</strong></span> -->
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
	                <h2>Q&A 등록하기</h2>
	              </div>
	            </div>
	          </div>
	        </div>
        
	        <div class="wrapper-custom">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form role="form" action="qna_view" method="post" id="frm">
									<div class="form-check">
									    <label class="form-check-label">
											<!-- <input class="form-check-input" type="checkbox" name='user_id' id='user_id' checked>사용자 -->
											<!-- <input type="text" class="form-control" name='user_id' id='user_id' placeholder="사용자"> -->
											<sec:authentication property="principal.username" var="user_Id"/>
											<input type="hidden" class="form-control" name='user_id' id='user_id' value="${user_Id }">
									    </label>  
									</div>
									<div class="form-group">
										<label>제목</label> 
										<input class="form-control" name='board_title' id='board_title' placeholder="제목">
									</div>
									<div class="form-group">
										<label>비밀번호</label> 
										<input class="form-control" name='board_pass' id='board_pass' placeholder="비밀번호">
									</div>
									<div class="form-group">
										<label for="comment">내용</label>
										<textarea class="form-control" row="5" name="board_content" id="board_content" maxlength="2048" style="height: 350px;" placeholder="내용"></textarea>
									</div>
									<div class="form-check">
									    <label class="form-check-label">
									      <input class="form-check-input" type="checkbox" name='board_secret' id='board_secret' checked disabled>비밀글입니다. 비밀번호를 기억해주세요.
									      <%-- <% String checkValue=request.getParameter("board_secret"); %> --%>
									    </label>
									</div>							
									<div class="text-center">
										<button type="submit" id="savebutton" name="savebutton" class="btn btn-outline btn-primary">등록</button>
										<button type="reset" class="btn btn-outline btn-danger"><a href="qna_list" class="text-white">취소</a></button>
									</div>
								</form>
							</div>
						</div>
					</div>
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
   
	<script type="text/javascript">
	$(function(){
		$("#frm").submit(function(){
			if($("#board_title").val() == ""){
				$("#board_title").focus();
				alert("제목을 입력하세요");
				return false;
			}
			if($("#board_pass").val() == ""){
				$("#board_pass").focus();
				alert("비밀번호를 입력하세요");
				return false;
			}
			if($("#board_content").val() == ""){
				$("#board_content").focus();
				alert("내용을 입력하세요");
				return false;
			}
		});
		
	});
	</script>
     
</body>
</html>
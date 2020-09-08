<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
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
						<sec:authentication property="principal.username" var="user_Id"/>
						 <p>${user_Id }님, 반갑습니다!</p>
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
							<a href="<c:url value='/owner/store' />" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>매장등록</a>
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
            <h1 class="text-white font-weight-bold">로그인</h1>
            <div class="custom-breadcrumbs">
              <a href="index">Home</a> <span class="mx-2 slash">/</span>
              <a href="myPage">로그인</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>아이디/비밀번호 찾기</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section">
      <div class="container">
        <div>
          <div class="col-lg-12">
            <h2 class="mb-4">아이디/비밀번호 찾기</h2>
            <h6 class="mb-4">※가입시 인증한 이메일로 정보 찾기가 가능합니다</h6>
          </div>
              <div style="margin-bottom: 10px;"
				  class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
				<label class="custom-control-label font-weight-bold"	for="search_1">아이디 찾기</label>
			  </div>
			  <div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
				<label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
			  </div>
			  
			  <div id="searchI">
                <div class="form-group">
                  <div class="mb-3 mb-md-0">
                    <label class="text-black" for="user_name">이름</label>
                    <input type="text" id="user_name" name="user_name" class="form-control">
                    <label class="text-black" for="user_email">이메일주소</label>
                    <input type="text" id="user_email" name="user_email" class="form-control">
                    <div class="ml-auto mt-4" align="right">
			      		<button type="button" id="searchBtn" onclick="findId()" class="btn btn-primary btn-md">확인</button>
			      		<a href="${pageContext.request.contextPath}" class="btn btn-primary btn-md">취소</a>
			    	</div>
			    	<h5 style="color:red">※인증완료후 아래 공간에 아이디가 나타납니다.</h5>
			    	<div id="id_value" style="font-size:30px;"></div>
                  </div>
                </div>
              </div>
              
              <div id="searchP" style="display: none;">
               <form action="findPassword">
                <div class="form-group">
                  <div class="mb-3 mb-md-0">
                    <label class="text-black" for="user_id">아이디</label>
                    <input type="text" id="user_id" name="user_id" class="form-control">
                    <label class="text-black" for="user_email">이메일주소</label>
                    <input type="email" id="user_email" name="user_email" class="form-control">
                    <div class="ml-auto mt-4" align="right">
			      		<input type="submit" id="searchBtn2" onclick="idSearch_click()" class="btn btn-primary btn-md" value="확인"/>
			      		<a href="${pageContext.request.contextPath}" class="btn btn-primary btn-md">취소</a>
			    	</div>
                  </div>
                </div>
               </form>
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
    <script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
    
    
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

	<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	</script>

	<script>
		// 아이디 & 스토어 값 저장하기 위한 변수
		var idV = "";
		function findId(){
		// 아이디 값 받고 출력하는 ajax
			$.ajax({
				type:"POST",
				url:"findId",
				data: {"user_name":$('#user_name').val(),"user_email":$('#user_email').val()},
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text(data);
						// 아이디값 별도로 저장
						idV = data;
					}
				},
				error : function() {
			          alert('통신실패!!');
			        }
			});	
	    }
	</script>

	<script type="text/javascript">
	$("#searchBtn2").click( function(e) {
		$.ajax({
			type:"GET",
			url:"findPassword",
			data: {"user_id":$('#user_id').val(),"user_email":$('#user_email').val()},
			success:function(data){
				if(data == 0){
					alert("회원정보를 확인해주세요!")
				} else {
					alert("임시번호가 발급되었습니다.");
				}
			},
			error : function() {
		          alert('통신실패!!');
		        }
		});	
		
	});
	</script>

</body>
</html>
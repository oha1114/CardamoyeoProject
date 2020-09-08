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
            <h1 class="text-white font-weight-bold"><a href="managerMypage" class="text-white">관리자 마이페이지</a></h1>
            <div class="custom-breadcrumbs">
<!--               <a href="#">Home</a> <span class="mx-2 slash">/</span>
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

                <h2>사용자 관리 페이지</h2>
                <a href="managerMypage">뒤로 가기</a><br/>
                <form action="userManager">
                	<input type="text" id="keyword" name="keyword" value="${keyword}" size="50" style="text-align:center; width:300px; height:30px; letter-spacing: 0px" placeholder="아이디 검색"/>
					<button type="submit" id="searchBtn" class="btn btn-primary btn">검색</button>
                </form>
                
              </div>
            </div>
          </div>
        </div>    
     
     	
	<!-- /.row -->
			
	<div class="row">
	
		<div class="col-lg-12">		
			<table class="table table-hover">
			<thead>
				<tr>
					<th>순번</th>
					<th class="text-center">아이디</th>
					<th class="text-center">이름</th>
					<th class="text-center">이메일</th>
					<th class="text-center">닉네임</th>
					<th class="text-center">연락처</th>
					<th class="text-center">성별</th>
					<th class="text-center">주소</th>
					<th class="text-center">삭제</th>
				</tr>
			</thead>
			<tbody id="frm">
			
			</tbody>
			
			<c:forEach items="${list}" var="dto">
							<tr>
								<td class="text-center">${dto.user_num}</td>
								<td class="text-center">${dto.user_id}</td>
								<td class="text-center">${dto.user_name}</td>
								<td class="text-center">${dto.user_email}</td>
								<td class="text-center">${dto.user_nic}</td>
								<td class="text-center">${dto.user_phone}</td>
								<td class="text-center">${dto.user_gender}</td>
								<td class="text-center">${dto.user_address}</td>
								<td class="text-center"><button class="btn btn-outline btn-primary"><a href="UserDelete?user_num=${dto.user_num}" class="text-white">삭제</a></button></td>
							</tr>
				</c:forEach>
		
			</table>
		</div>
	</div>

	<%-- <td><a href="user_detail_manager?user_seq=${dto.user_seq}">${dto.user_id}</a></td> --%>

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
     
     
    <!-- <script>
    var lists;
    function ajax_user(keyword){
    	$.ajax({
    		url:"userManager",
    		method:"post",
    		dataType:"json",
    		data:{"keyword":keyword},
//     		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
    		async:false,
    		success:function(obj){

    			var listele="";
    			lists=obj.ulist;
    				for(var i = 0; i < lists.length; i++){
    				
    			'<tr>'
					+'<td>'+lists[i].user_num+'</td>'
					+'<td>'+lists[i].user_id+'</td>'
					+'<td><a href="#">'+lists[i].user_name+'</a></td>'
					+'<td>'+lists[i].user_email+'</td>'
					+'<td>'+lists[i].user_nic+'</td>'
					+'<td>'+lists[i].user_phone+'</td>'
					+'<td>'+lists[i].user_gender+'</td>'
					+'<td>'+lists[i].user_address+'</td>'
					+'<td><button class="btn btn-outline btn-primary"><a href="UserDelete?user_num='+lists[i].user_num+'" class="text-white">삭제</a></button></td>'
				+'</tr>'

    			}
    						
    			$("#frm").html(listele);
    		}
    	});
    }

    </script>  -->

     <script type="text/javascript">
     	$(function(){
     		$("searchBtn").click(function(){
     			self.location = "keyword=" + encodeURIComponent($('#keyword').val())
     		});
     	});
     </script>
     
  </body>
</html>
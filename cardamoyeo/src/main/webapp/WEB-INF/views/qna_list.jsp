<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%
	String pNum = "1";
	if(request.getParameter("pNum") != null){
		pNum = request.getParameter("pNum");
	}
%>

</head>
<body id="top">
<!--  -->
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
              	    	 <a href="<c:url value='logout'/>" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>로그아웃</a>
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
                <h2>Q&A 사용자용</h2>
              </div>
            </div>
          </div>
        </div>
 
<%
	Map<String, Integer> map = (Map<String, Integer>)request.getAttribute("pMap");
%>         
        	
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12"></div>		
			<div class="col-lg-12">
				<table class="table table-hover" id="dataTables-example">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일</th>
							<!-- <th class="text-center">답변여부</th> -->
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty list}">
							<tr class="text-center"><td colspan="4">---Q&A내용이 없습니다.---</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><a href="qna_pass?board_seq=${dto.board_seq}">${dto.board_title}</a><span style="color:red;"> (${dto.commentCount})</span></td>
									<td class="text-center">${dto.user_id}</td>
									<td class="text-center"><fmt:formatDate value="${dto.board_date}" pattern="yyyy-MM-dd"/> </td>
									<%-- <td class="text-center">${dto.board_read}</td> --%>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
	
				</table>
				
				<!-- 3차 페이징 -->
	            <div class="custom-pagination ml-auto">
					<table align="center">
						<tr>
							<td colspan="5" style="text-align: center;">
								<ul class="pagination" style="margin:0 auto;">					
									<a href="qna_list?pNum=<%=map.get("prePageNum")%>">◀</a>							
									<%
									for(int i=map.get("startPage") ;i<=map.get("endPage");i++){
									%>
											<li><a href="qna_list?pNum=<%=i%>" <%=pNum.equals(i+"")?"class='active' style='font-weight: bold;'":"" %>  ><%=i%></a></li>
											<%-- <li><a href="qna_list?pNum=<%=i%>" <%=pNum.equals(i+"")?"style='font-weight: bold;text-decoration: underline;'":"" %>  ><%=i%></a></li> --%>
									<%
									}
									%>
									<a href="qna_list?pNum=<%=map.get("nextPageNum")%>">▶</a>						
								</ul>
							</td>
						</tr>
					</table>
				</div>		
			</div>
		</div>
		<div class="col-xs-6 text-right addbtn">
			<sec:authorize access="hasAuthority('ROLE_U')">
			<button id='writeBtn' type="button" class="btn btn-outline btn-primary">
				<a href="qna_write" class="text-white">글쓰기</a>								
			</button>
			</sec:authorize>
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
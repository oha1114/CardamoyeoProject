<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
              <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <a href="#">마이페이지</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>My Q&A</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

	<!-- List -->
    <section class="site-section">
      <div class="container">
        <div class="row">
          
          <jsp:include page="sidebar_user.jsp" />
          
          <div class="col-lg-9">
            <div class="row mb-5 justify-content-center">
          	  <div class="col-md-7 text-center">
                <h2 class="section-title mb-2">My Q&A</h2>
              </div>
            </div>

		    <div>
			  <table class="table table-hover">
				<thead>
					<tr align="center">
						<th style="width:220px;">글번호</th>
						<th>제목</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<c:if test="${!empty qnalist }">
				  <c:forEach items="${qnalist }" var="board" varStatus="status">
				    <tr align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''">
					 <td height="23" style="font-family:Tahoma;font-size:10pt;">
					    ${status.index +1} <!-- index : 0 ~ , count : 1 ~ -->
					 </td>
					 <td style="font-family:Tahoma;font-size:10pt;">
					   <div align="center">
					    <sec:authorize access="hasAuthority('ROLE_U')">
						 <a href="qna_pass?board_seq=${board.board_seq }">
							${board.board_title }
						 </a><span style="color:red;"> (${board.commentCount})</span>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ROLE_O')">
						 <a href="qna_pass_owner?board_seq=${board.board_seq }">
							${board.board_title }
						 </a><span style="color:red;"> (${board.commentCount})</span>
						</sec:authorize>
					   </div>
					 </td>
					 <td style="font-family:Tahoma;font-size:10pt;">
					   <div align="center">
						 <fmt:formatDate value="${board.board_date }" type="date" pattern="yyyy-MM-dd"/> 
					   </div>
					 </td>	
				  </tr>
				 </c:forEach>
				  <tr align="center">
					<td colspan="3">
					  <div class="row pagination-wrap">
							<div class="col-md-7 text-center text-md-right">
								<div class="custom-pagination ml-auto">
									<div class="d-inline-block">
										<jsp:include page="../views/public/includePage.jsp"></jsp:include><br />
									</div>
								</div>
							</div>
						</div>
				    </td>
				  </tr>
			</c:if>
			
			<c:if test="${empty qnalist }">
			  <tr align="center">
		  		<td colspan="3">
				  <font size=2>등록된 글이 없습니다.</font>
				</td>
			  </tr>
		   	</c:if>
		   	
			  <tr align="right">
			    <td colspan="3">
	   		      <a href="qna_write">[글쓰기]</a>
		        </td>
			  </tr>
		</table>
            
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
    <script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
    
    
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
   
    <script type="text/javascript">
	$("#QandADel").click( function(e) {
		if(confirm("삭제하시겠습니까?") == false) {
            return false;
        }
	});
	</script>
	
	<script type="text/javascript">
	$("#userDel").click( function(e) {
		if(confirm("정말 탈퇴하시겠습니까?") == false) {
            return false;
        }
	});
	</script>
     
     
  </body>
</html>
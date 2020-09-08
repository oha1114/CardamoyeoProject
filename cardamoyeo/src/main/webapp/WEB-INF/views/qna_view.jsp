<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	                <h2>Q&A</h2>
	              </div>
	            </div>
	          </div>
	        </div>
		<div class="container" id="frm">
			<table class="table table-bordered" cellpadding="0" cellspacing="0">
				<tr>
					<th style="font-family:돋음; font-size:12" height="16">
						<div align="center">제 목&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
					${dto.board_title}
					</td>
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12" height="16">
						<div align="center">작성자&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
					${dto.user_id}
					</td>
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12" height="16">
						<div align="center">작성날짜&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
					<fmt:formatDate value="${dto.board_date}" pattern="yyyy-MM-dd HH시mm분"/>
					<%-- ${dto.board_date} --%>
					</td>
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12">
						<div align="center">내 용</div>
					</th>
					<td width=800 height=250 style="font-family:돋음; font-size:12">
						${dto.board_content}
					</td>
				</tr>
			</table>
			<div class="text-center">
				<button type="submit" data-oper="list" class="btn btn-outline btn-primary"><a href="qna_list" class="text-white">목록</a></button>
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasAuthority('ROLE_U')">
							<button type="submit" data-oper="remove" class="btn btn-outline btn-primary" id="qnaDeleteBtn"><a href="javascript:qnaDeleteConfirm()" class="text-white">삭제</a></button>
							<%-- <button type="submit" data-oper="remove" class="btn btn-outline btn-primary" id="qnaDeleteBtn"><a href="qna_delete?seq=${dto.board_seq }" class="text-white">삭제</a></button> --%>
							<button type="submit" id="modify" class="btn btn-outline btn-primary"><a href="qna_modify?board_seq=${dto.board_seq }" class="text-white">수정</a></button>
						</sec:authorize>
					</sec:authorize>
			</div>
		</div><br/>
<!-- 댓글 작성 -->
			
			<div>
			<sec:authorize access="hasAuthority('ROLE_M')">
				<form action="replyWrite" method="post">    
					<input type="hidden" name="board_seq" value="${dto.board_seq }"/>&nbsp;&nbsp;
					<sec:authentication property="principal.username" var="user_id"/>
					<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>
					<table align="center">
				     	<tr>
				     		<td>
				     			<div class="form-group">
									<textarea class="form-control" type="text" row="5" name="reply_content" id="reply_content" maxlength="2048" style="width:1000px; height: 100px;" placeholder="댓글을 작성하세요"></textarea>					
								</div>
								<div class="form-check" align="right">					
										<button type="submit" id="btnReply" class="btn btn-outline btn-primary">댓글</button>												    
								</div>	
				     		</td>
				     	</tr>
		     		</table><br/><br/>
				</form> 
				</sec:authorize>
				<!-- 댓글 목록 출력할 위치 -->
				<div id="listReply" class="container-fluid" align="right">
					<table class="table table-bordered" cellpadding="0" cellspacing="0">
							<c:forEach var="dto" items="${replyList}">
								<tr>
									<td>
										<b>${dto.user_id}(<fmt:formatDate value="${dto.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>)</b>
										<br/>
										<p>	${dto.reply_content }</p>
										<div>
											<button type="button" class="btn btn-outline btn-primary"><a href="replyDeleteView?reply_seq=${dto.reply_seq}" class="text-white">삭제</a></button>
										</div>	
									</td>
								</tr>	
							</c:forEach>						
					</table>
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
   
	<script>
		function qnaDeleteConfirm(){
			var isDelete=confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href="qna_delete?seq=${dto.board_seq}"
			}
		}
	</script>

</body>
</html>
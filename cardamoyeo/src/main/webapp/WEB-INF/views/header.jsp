<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="site-logo col-6"><a href="<%=request.getContextPath()%>">Cardamoyeo</a></div>
	
	<nav class="mx-auto site-navigation">
		<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
			<li><a href="<%=request.getContextPath()%>"
				class="nav-link active">Home</a></li>
			<li><a href="index#next">서비스소개</a></li>
			<li><a href="notice_list">공지사항</a></li>
			<sec:authorize access="hasAuthority('ROLE_U')">
				<li><a href="qna_list">Q&A</a></li>
			</sec:authorize>
            <sec:authorize access="hasAuthority('ROLE_M')">
				<li><a href="qna_go">Q&A</a></li>
			</sec:authorize>
			<sec:authorize access="hasAuthority('ROLE_O')">
				<li><a href="qna_list_owner">Q&A</a></li>
			</sec:authorize>
		</ul>
	</nav>
</body>
</html>
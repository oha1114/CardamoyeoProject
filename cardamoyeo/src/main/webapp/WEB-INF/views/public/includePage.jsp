<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.username" var="user_id"/>

<c:if test="${page <= 1 }">[이전]&nbsp;</c:if>
<c:if test="${page > 1 }"><a href="${pageUrl}page=${page -1 }&user_id=${user_id}">[이전]</a>&nbsp;</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="i" step="1">
	<a href="${pageUrl }page=${i }&user_id=${user_id}">${i }</a>&nbsp;
</c:forEach> 
<c:if test="${page >= maxPage }">[다음]&nbsp;</c:if>
<c:if test="${page < maxPage }"><a href="${pageUrl}page=${page +1 }&user_id=${user_id}">[다음]</a></c:if>

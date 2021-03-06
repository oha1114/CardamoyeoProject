<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cardamoyeo</title>

</head>
<body>
<sec:authentication property="principal.username" var="user_id"/>
	<div class="col-lg-3 mr-auto">
            <div class="border p-4 rounded">
              <ul class="list-unstyled block__47528 mb-0">
                <li><span class="active">마이페이지</span></li>
                <li><a href="userManager">사용자 정보관리</a></li>
                <li><a href="ownerManager">업체 정보관리</a></li>
                <li><a href="managerInfo?user_id=${user_id }">관리자 정보관리</a></li>
                <li><a href="userDel" id="userDel">회원탈퇴</a></li>
              </ul>
            </div>
	</div>

</body>
</html>
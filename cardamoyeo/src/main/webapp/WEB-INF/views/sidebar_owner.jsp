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
              <ul class="list-unstyled mb-0">
        		   <li><span class="active">마이페이지</span></li>
         		 	 <li><a href="storeList?user_id=${user_id}">매장 관리</a></li>
					<li><a href="storeForm">매장 등록</a></li>
					<li><a href="sResList?user_id=${user_id}">결제 내역 관리</a></li>
					<li><a href="userQna?user_id=${user_id}">My Q&A</a></li>
					<li><a href="ownerInfo?user_id=${user_id}">회원정보관리</a></li>
               	    <li><a href="userDel" id="userDel">회원탈퇴</a></li>
              </ul>
            </div>
          </div>

</body>
</html>

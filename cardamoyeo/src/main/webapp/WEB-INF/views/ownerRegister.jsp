<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Cardamoyeo</title>
	<script type="text/javascript">
	$(function() {
		$("#frm").submit(
				function() {
					if ($("#user_id").val() == "") {
						$("#user_id").focus();
						alert("아이디를 입력하세요.");
						return false;
					}
					
					/*
					if($("idx").val() == false) {
						alert("아이디 중복체크를 하십시오.");
						return false;
					}
					*/
					if ($("#user_pass").val() == "") {
						$("#user_pass").focus();
						alert("비밀번호를 입력하세요.");
						return false;
					}
					else {
						if ($("#user_pass").val() != $("#rePwd").val()) {
							$("#user_pass").val("");
							$("#rePwd").val("");
							$("#user_pass").focus();
							alert("비밀번호가 다릅니다.");
							return false;
						}	
					}
					
					if ($("#user_name").val() == "") {
						$("#user_name").focus();
						alert("사용자 이름을 입력하세요.");
						return false;
					}

					if ($("#user_email").val() == "") {
						$("#user_email").focus();
						alert("사용자 이메일을 입력하세요.");
						return false;
					}
					
				});
	});
	$(document).ready(function(e){
		
		var idx = false;
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck",
				type: "GET",
				data:{
					"user_id":$('#user_id').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#user_id').val()) != '' ){
						idx=true;
						$('#user_id').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
		});
	});
	$(document).ready(function(e){
		var idx = false;
		$('#emailCk').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/emailCheck",
				type: "GET",
				data:{
					"user_email":$('#user_email').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#user_email').val()) != '' ){
						idx=true;
						$('#user_email').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용가능한 이메일 입니다.</td></tr>";
						$('#emailCheck').empty();
						$('#emailCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>이미 사용중인 이메일 입니다.</td></tr>";
						$('#emailCheck').empty();
						$('#emailCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
		});	
	});
   </script>

    <style>
    #frm .help-block{
            display: none;
        }
    #frm .glyphicon{
            display: none;
        }
    .star {
    	color: red;
    }
    </style>
</head>
<body>
	    <div class="row mb-5">
          <div class="col-lg-12">
            <form action="join1" method="post" id="frm" name="frm" class="p-4 p-md-5 border rounded" enctype="multipart/form-data">
               <h3 class="text-black mb-5 border-bottom pb-2">
              	일반 <input type="radio" value="U" name="user_role" id="user_role" onclick="userChange()"/> &nbsp; &nbsp;
			  	제휴업체 <input type="radio" value="O" name="user_role" id="user_role" checked/></h3>
              <input type="hidden" name = "user_num" id = "user_num" value="1">
              <input type="hidden" name = "owner_ok" id = "owner_ok" value="Y">
              <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" /> <br/>
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="userId">아이디</label>
                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="Id"/>
                <input type="button" id="check" name="check" class="btn btn-primary btn-md mt-3" value="중복확인"/>
              	<div id="idCheck"></div>
              </div>

              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="userPass">비밀번호</label>
                <input type="password" class="form-control" id="user_pass" name="user_pass" placeholder="Password"/>
              	<span id="pwdRegErr" class="help-block">8글자 이상 입력하세요.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="rePwd">비밀번호 재확인</label>
                <input type="password" class="form-control" id="rePwd" name="rePwd" placeholder="Password Check"/>
              	<span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="user_name">이름</label>
                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name"/>
              </div>
              
              <div class="form-group">
                <label for="userNic">닉네임</label>
                <input type="text" class="form-control" id="user_nic" name="user_nic" placeholder="Nickname"/>
              </div>
              
              <div class="form-group">
                <label for="userPhone">연락처</label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Phone"/>
              </div>
              
              <div class="form-group">
              	<label for="userGender">성별</label><br/>
              	남  <input type="radio" value="M" name="user_gender" id="user_gender" checked/> &nbsp; &nbsp;
				여  <input type="radio" value="F" name="user_gender" id="user_gender" />
              </div>              
              
              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="email">이메일</label>
                <input type="text" class="form-control" id="user_email" name="user_email" placeholder="you@yourdomain.com"/>
                <input type="button" class="btn btn-primary btn-md mt-3" id="emailCk" name="emailCk" value="중복확인"/>
                <div id="emailCheck"></div>
              	<span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group">
                <label for="userAddress">주소</label>
                <input type="text" class="form-control" id="user_address" name="user_address" placeholder="상세주소를 입력해주세요."/>
              </div>
              
              <div class="form-group">
              <span class="star">*</span>&nbsp;
              <div class="form-group">
                <label for="storeLicenseNumber">사업자등록번호</label>
                <input type="text" class="form-control" id="store_license_number" name="store_license_number" placeholder="사업자 등록번호 10자리 입력" />
                <input type="button" class="btn btn-primary btn-md mt-3" id="storeLicenseNumberCk" name="storeLicenseNumberCk" value="조회하기"/>
              </div>
              
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="company-website-tw d-block">사업자등록 파일첨부</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  	파일올리기<input type="file" name="file">
                </label>
              </div>
              
              <table class="table table-hover">
				<tr>
					<td><span class="req">* </span>이용약관</td>
					<td>이용약관에 동의하시겠습니까? <input name="user_agreement" value="Y"
						type="checkbox" required="required" />
						<button type="button" class="btn modal_Btn">이용약관</button>
					</td>
				</tr>
			  </table>
             </div>
				
			  <br/>
              <div class="col-lg-4 ml-auto">
                <div>
                    <input type="submit" class="btn btn-block btn-primary btn-md" value="가입하기"/>
                </div>
              </div>
            </form>
          </div>

        </div>
        
<script>
    $("#user_pass").keyup(function(){
        var pwd=$(this).val();
        // 비밀번호 검증할 정규 표현식
        var reg=/^.{8,}$/;
        if(reg.test(pwd)){//정규표현식을 통과 한다면
                    $("#pwdRegErr").hide();
                    successState("#user_pass");
        }else{//정규표현식을 통과하지 못하면
                    $("#pwdRegErr").show();
                    errorState("#user_pass");
        }
    });
    $("#rePwd").keyup(function(){
        var rePwd=$(this).val();
        var pwd=$("#user_pass").val();
        // 비밀번호 같은지 확인
        if(rePwd==pwd){//비밀번호 같다면
            $("#rePwdErr").hide();
            successState("#rePwd");
        }else{//비밀번호 다르다면
            $("#rePwdErr").show();
            errorState("#rePwd");
        }
    });
    
    $("#user_email").keyup(function(){
        var email=$(this).val();
        // 이메일 검증할 정규 표현식
        var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(reg.test(email)){//정규표현식을 통과 한다면
                    $("#emailErr").hide();
                    successState("#user_email");
        }else{//정규표현식을 통과하지 못하면
                    $("#emailErr").show();
                    errorState("#user_email");
        }
    });
    // 성공 상태로 바꾸는 함수
    function successState(sel){
        $(sel)
        .parent()
        .removeClass("has-error")
        .addClass("has-success")
        .find(".glyphicon")
        .removeClass("glyphicon-remove")
        .addClass("glyphicon-ok")
        .show();
 
        $("#frm button[type=submit]")
                    .removeAttr("disabled");
    };
    // 에러 상태로 바꾸는 함수
    function errorState(sel){
        $(sel)
        .parent()
        .removeClass("has-success")
        .addClass("has-error")
        .find(".glyphicon")
        .removeClass("glyphicon-ok")
        .addClass("glyphicon-remove")
        .show();
 
        $("#frm button[type=submit]")
                    .attr("disabled","disabled");
    };
</script>    
<script type="text/javascript">
   $(function(){
		$(".modal_Btn").click(function(){
			$("div.modal").modal();
		});
	});
</script>
</body>
</html>
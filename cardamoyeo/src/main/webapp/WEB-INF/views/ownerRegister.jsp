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
						alert("���̵� �Է��ϼ���.");
						return false;
					}
					
					/*
					if($("idx").val() == false) {
						alert("���̵� �ߺ�üũ�� �Ͻʽÿ�.");
						return false;
					}
					*/
					if ($("#user_pass").val() == "") {
						$("#user_pass").focus();
						alert("��й�ȣ�� �Է��ϼ���.");
						return false;
					}
					else {
						if ($("#user_pass").val() != $("#rePwd").val()) {
							$("#user_pass").val("");
							$("#rePwd").val("");
							$("#user_pass").focus();
							alert("��й�ȣ�� �ٸ��ϴ�.");
							return false;
						}	
					}
					
					if ($("#user_name").val() == "") {
						$("#user_name").focus();
						alert("����� �̸��� �Է��ϼ���.");
						return false;
					}

					if ($("#user_email").val() == "") {
						$("#user_email").focus();
						alert("����� �̸����� �Է��ϼ���.");
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
						var html="<tr><td colspan='3' style='color: green'>��밡���� ���̵� �Դϴ�.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>���Ұ����� ���̵� �Դϴ�.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("��������");
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
						var html="<tr><td colspan='3' style='color: green'>��밡���� �̸��� �Դϴ�.</td></tr>";
						$('#emailCheck').empty();
						$('#emailCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>�̹� ������� �̸��� �Դϴ�.</td></tr>";
						$('#emailCheck').empty();
						$('#emailCheck').append(html);
					}
				},
				error: function(){
					alert("��������");
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
              	�Ϲ� <input type="radio" value="U" name="user_role" id="user_role" onclick="userChange()"/> &nbsp; &nbsp;
			  	���޾�ü <input type="radio" value="O" name="user_role" id="user_role" checked/></h3>
              <input type="hidden" name = "user_num" id = "user_num" value="1">
              <input type="hidden" name = "owner_ok" id = "owner_ok" value="Y">
              <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" /> <br/>
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="userId">���̵�</label>
                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="Id"/>
                <input type="button" id="check" name="check" class="btn btn-primary btn-md mt-3" value="�ߺ�Ȯ��"/>
              	<div id="idCheck"></div>
              </div>

              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="userPass">��й�ȣ</label>
                <input type="password" class="form-control" id="user_pass" name="user_pass" placeholder="Password"/>
              	<span id="pwdRegErr" class="help-block">8���� �̻� �Է��ϼ���.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="rePwd">��й�ȣ ��Ȯ��</label>
                <input type="password" class="form-control" id="rePwd" name="rePwd" placeholder="Password Check"/>
              	<span id="rePwdErr" class="help-block">��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��� �ּ���.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="user_name">�̸�</label>
                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name"/>
              </div>
              
              <div class="form-group">
                <label for="userNic">�г���</label>
                <input type="text" class="form-control" id="user_nic" name="user_nic" placeholder="Nickname"/>
              </div>
              
              <div class="form-group">
                <label for="userPhone">����ó</label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Phone"/>
              </div>
              
              <div class="form-group">
              	<label for="userGender">����</label><br/>
              	��  <input type="radio" value="M" name="user_gender" id="user_gender" checked/> &nbsp; &nbsp;
				��  <input type="radio" value="F" name="user_gender" id="user_gender" />
              </div>              
              
              <div class="form-group has-feedback">
                <span class="star">*</span>&nbsp;
                <label for="email">�̸���</label>
                <input type="text" class="form-control" id="user_email" name="user_email" placeholder="you@yourdomain.com"/>
                <input type="button" class="btn btn-primary btn-md mt-3" id="emailCk" name="emailCk" value="�ߺ�Ȯ��"/>
                <div id="emailCheck"></div>
              	<span id="emailErr" class="help-block">�ùٸ� �̸��� ������ �ƴմϴ�. �ٽ� �Է��� �ּ���.</span>
            	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              
              <div class="form-group">
                <label for="userAddress">�ּ�</label>
                <input type="text" class="form-control" id="user_address" name="user_address" placeholder="���ּҸ� �Է����ּ���."/>
              </div>
              
              <div class="form-group">
              <span class="star">*</span>&nbsp;
              <div class="form-group">
                <label for="storeLicenseNumber">����ڵ�Ϲ�ȣ</label>
                <input type="text" class="form-control" id="store_license_number" name="store_license_number" placeholder="����� ��Ϲ�ȣ 10�ڸ� �Է�" />
                <input type="button" class="btn btn-primary btn-md mt-3" id="storeLicenseNumberCk" name="storeLicenseNumberCk" value="��ȸ�ϱ�"/>
              </div>
              
              <div class="form-group">
                <span class="star">*</span>&nbsp;
                <label for="company-website-tw d-block">����ڵ�� ����÷��</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  	���Ͽø���<input type="file" name="file">
                </label>
              </div>
              
              <table class="table table-hover">
				<tr>
					<td><span class="req">* </span>�̿���</td>
					<td>�̿����� �����Ͻðڽ��ϱ�? <input name="user_agreement" value="Y"
						type="checkbox" required="required" />
						<button type="button" class="btn modal_Btn">�̿���</button>
					</td>
				</tr>
			  </table>
             </div>
				
			  <br/>
              <div class="col-lg-4 ml-auto">
                <div>
                    <input type="submit" class="btn btn-block btn-primary btn-md" value="�����ϱ�"/>
                </div>
              </div>
            </form>
          </div>

        </div>
        
<script>
    $("#user_pass").keyup(function(){
        var pwd=$(this).val();
        // ��й�ȣ ������ ���� ǥ����
        var reg=/^.{8,}$/;
        if(reg.test(pwd)){//����ǥ������ ��� �Ѵٸ�
                    $("#pwdRegErr").hide();
                    successState("#user_pass");
        }else{//����ǥ������ ������� ���ϸ�
                    $("#pwdRegErr").show();
                    errorState("#user_pass");
        }
    });
    $("#rePwd").keyup(function(){
        var rePwd=$(this).val();
        var pwd=$("#user_pass").val();
        // ��й�ȣ ������ Ȯ��
        if(rePwd==pwd){//��й�ȣ ���ٸ�
            $("#rePwdErr").hide();
            successState("#rePwd");
        }else{//��й�ȣ �ٸ��ٸ�
            $("#rePwdErr").show();
            errorState("#rePwd");
        }
    });
    
    $("#user_email").keyup(function(){
        var email=$(this).val();
        // �̸��� ������ ���� ǥ����
        var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(reg.test(email)){//����ǥ������ ��� �Ѵٸ�
                    $("#emailErr").hide();
                    successState("#user_email");
        }else{//����ǥ������ ������� ���ϸ�
                    $("#emailErr").show();
                    errorState("#user_email");
        }
    });
    // ���� ���·� �ٲٴ� �Լ�
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
    // ���� ���·� �ٲٴ� �Լ�
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--시큐리티 태그 라이브러리 선언-->
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cardamoyeo</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
  $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp58670701'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid :'${res[0].pdto.res_seq}',
            name :'주차권 종류: ${res[0].pdto.menu_type}',
            amount :'${res[0].pdto.res_pay}',
            buyer_email : '${res[0].pdto.res_success}',
            buyer_name :'${res[0].pdto.pay_date}',
            buyer_addr : 'mm',
            buyer_postcode : '123-456',

            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "payments_complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        merchant_uid: rsp.merchant_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                        
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                      
                        
                        alert(msg);
                    } else {
                    	alert("ㅜㅜ");
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                alert("결제에 성공하였습니다.");
                location.href="<%=request.getContextPath()%>/payOk?res_seq=${res[0].pdto.res_seq}";
                $("#res_success").val('Y');
               
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/resPay?res_seq=${res[0].pdto.res_seq}";
                alert(msg);
                $("#res_success").val('N');
            }
        });
        
  });
    </script>
 

</head>

<body>


</body>
</html>


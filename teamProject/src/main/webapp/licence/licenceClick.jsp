<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
IMP.init('imp99700423');

IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${p_name}',//오른쪽에 상품명
    amount :'${pay}', //판매 가격
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    /* 결제 후 결제완료한 정보를 다시 확인하게  */
    
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        location.href="${pageContext.request.contextPath}/licenceList.do"
		/* 로그인된 사용자의 pay에 정보 추가.(ticket_code, member_no, pay_date(sysdate)) */
        $.post("afterLicenceBuyServ.do", {ticket_code: '${ticket_code}'
	    	},function(data){
	            window.close();
		});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        window.close();

    }
    alert(msg);
});
</script>
</head>
<body>

</body>
</html>
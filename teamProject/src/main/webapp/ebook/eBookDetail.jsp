<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		if("${checkCode}" != ""){
			$("#check").hide();
			$("#read").show();
		}else if("${checkCode}" == ""){
			$("#read").hide();
			$("#check").show();
		}
	});
	
	
	function goRead(){
		location.href="${pageContext.request.contextPath}/eBookReading.do";
	}
		
	

</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

function licence(){
IMP.init('imp99700423');

IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '뀨',//오른쪽에 상품명
    amount : 14000, //판매 가격
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
}
</script>


</head>
<body>
<h3>ebook 상세</h3>

${book[0].book_no}
${book[0].title}
${book[0].writer}


<button id="read" onclick="goRead()">
읽기
</button>

<br>
<button id="check" onclick="licence()">
결제
</button>

</body>
</html>
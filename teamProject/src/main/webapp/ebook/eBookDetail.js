
	

	
	
		
	/* // 게시글 추천수
	function recCount() {
		$.ajax({
			url: "${pageContext.request.contextPath}/Ajax/eBookRecommendation.do",
               type: "POST",
               data: {
                   no: ${book[0].book_no}
               },
               success: function (count) {
               	$(".rec_count").html(count);
               },
		})
	}; */
	




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



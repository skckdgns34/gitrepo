<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		btnHideNShow();
		btnScore();
	});
	
	
	function btnHideNShow(){
		if("${checkCode}" != ""){ //이용자가 티켓코드가 없을시 결재버튼 보여주기 & 있으면 읽기버튼보여주기
			$("#check").hide(); 
			$("#read").show();
		}else if("${checkCode}" == ""){
			$("#read").hide();
			$("#check").show();
		}
	}
	
	function goRead(){ //읽기버튼이 생성되면 읽는페이지로 이동
		location.href="${pageContext.request.contextPath}/eBookReading.do";
	}
	
	var check = "${check}"
	
	function btnScore(){ // 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/Ajax/eBookRecommendation.do",
                type: "POST",
                dataType: "JSON",
                data: {
                    book_no:  "${book[0].book_no}",
                    member_no:  "${member_no}",
                    check: check
                },
                success: function (result) {
                	check = result.check;
			        if(result.check == 0){
			        	$(".fa fa-heart").css("color", 'white')
			        }else{
			        	$(".fa fa-heart").css("backgroundcolor", 'red')
			        }
                	$(".rec_count").html(result.count); 
                }
			})
		})
	}
		
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


책제목: ${book[0].title}<br>
책 저자 :${book[0].writer}<br>

<fmt:parseDate value="${book[0].publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="publication_date"/>
							<fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/> 
<br>
줄거리 : ${book[0].summary}<br>
조회수 : ${book[0].views}<br>
장르 : ${book[0].genre}<br>
베스트셀러인지? : ${book[0].best_book}<br>


	<div>
		<div class="w3-border w3-center w3-padding">
			<c:if test="${ member_no == null }">
				추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
				<i class="fa fa-heart" style="font-size:16px;color:red"></i>
				<span class="rec_count"></span>					
			</c:if>
			${check}=============
			<c:if test="${ member_no != null }">
				<c:if test="${check > 0}">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count">좋아요 수</span>
					</button> 
				</c:if>
				<c:if test="${check == 0}">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:white"></i>
						&nbsp;<span class="rec_count"></span><!-- 좋아요수 -->
					</button> 
				</c:if>
			</c:if>
		</div>
	</div>

	<button id="read" onclick="goRead()">읽기</button>
	<button id="check" onclick="licence()">결제</button>
	
<c:if test="${not empty book[0].book_img}">
	<td>
		<img  src="filenameDownload.do?filename=${book[0].book_img}" style="width:500px">
	</td>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>licenceList</title>
<script>
	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};
	
	$(function(){
		$(".button").on("click",function(){
			//$(".member_ticket").closest('tr').find('checkbox').attr("disabled",true);

			var login_no = '${sessionScope.member_no}';
			var checked = $("input[name='user_CheckBox']:checked");
			var boxVal = checked.val();
			var p_name = checked.parent().parent().children().eq(1).html();
			var ticket_code = checked.closest('tr').find('input[type=hidden]').val();
			 
			if(login_no == ''){
				alert("로그인필요")
				//$(location).attr('href', '${pageContext.request.contextPath }/member/memberLogin.jsp')

			}
			else{
				window.open('${pageContext.request.contextPath }/licenceAmount.do?account='
							+boxVal+'&p_name='+p_name
							+'&ticket_code='+ticket_code, '결제', 'width=850px,height=700px,scrollbars=yes');
			}
		})
	})
</script>
</head>

<body>
	   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Menu</h4>
                        <div class="breadcrumb__links">
                            <a href="${pageContext.request.contextPath}/main.do">Home</a>
                            <span>이용권</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>선택</th>
								<th scope="col">이름</th>
								<th scope="col">금액</th>
								<th scope="col">보유</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${commonList}" var="list">
								<tr>
									<td><input type="checkbox" name="user_CheckBox" <c:if test="${list.ticketyn==1}">disabled</c:if>
										onclick="check(this)" value="${list.price }"></td>
									<td>${list.ticket_name }</td><input type="hidden" value="${list.ticket_code}"/>
									<td>${list.price}</td>
									<td class="member_ticket">
									<c:if test="${list.ticketyn==1 }">보유중</c:if>								
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>

					<div class="cupon_text d-flex align-items-center"
						style="margin-left: 43%;">
					<c:if test="${empty sessionScope.member_no }">
						<a class="button"
							href="${pageContext.request.contextPath }/member/memberLogin.jsp">로그인
						</a>
					</c:if>
					<c:if test="${not empty sessionScope.member_no }">
						<button class="button">결제하기</button>
					</c:if>
					</div>
				</div>
				<!--===============유의사항 =================-->
				<section class="product_description_area">
					<div class="container">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="home-tab"
								data-toggle="tab" href="#home" role="tab" aria-controls="home"
								aria-selected="true">유의사항</a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<ul class="list">
									<li><i class="fas fa-check"></i><a>Basic 이용권으로 오디오북 시청
											시도 시, 미리보기만 가능합니다.</a></li>
									<li><i class="fas fa-check"></i><a>Premium 이용권 구매 시 시범
											서비스 기간동안 전자책, 오디오북 콘텐츠를 최상위 음질과 화질로 이용하실 수 있습니다.</a></li>
									<li><i class="fas fa-check"></i><a>삼성스마트TV, CJ헬로 뷰잉 등
											일부 스마트TV, OTT 기기에서는오디오북 서비스가 제공되지 않을 수 있습니다. (콘텐츠 제공사 정책)</a></li>
									<li><i class="fas fa-check"></i><a>오디오북은 PC : windows
											7, html5 지원 브라우저 이상에서만 지원 합니다.</a></li>
									<li><i class="fas fa-check"></i><a>국내에서 결제완료된 콘텐츠에 한해
											해외 서비스 대상국가 여행 시 모바일 앱(ios/Android)으로 7일간 스트리밍(재생) 서비스를 이용하실
											수 있습니다.</a></li>
									<li><i class="fas fa-check"></i><a>해외 서비스 대상국가 : 싱가폴,
											인도네시아, 말레이시아, 필리핀, 베트남, 라오스, 태국.</a></li>
								</ul>
							</div>
						</div>
					</div>
				</section>


			</div>
		</div>
	</section>
</body>
</html>
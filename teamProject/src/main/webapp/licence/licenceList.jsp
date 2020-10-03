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
</script>
</head>

<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>이용권 목록</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->
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
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="1" end="${commonList.size() }" var="i">
								<tr>
									<td><input type="checkbox" name="user_CheckBox"
										onclick="check(this)" value="${member.getMember_no()}"></td>
									<td>${commonList[i-1].code_value }</td>
									<td>5000원</td>

								</tr>
							</c:forEach>
			</tbody>
					</table>
					<hr>

					<div class="cupon_text d-flex align-items-center"
						style="margin-left: 40%;">
						<a class="button"
							href="${pageContext.request.contextPath }/licence/licenceClick.jsp">결제하기</a>
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
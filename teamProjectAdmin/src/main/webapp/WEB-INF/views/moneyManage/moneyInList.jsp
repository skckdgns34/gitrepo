<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="page-top">

	<div class="container-fluid">
		
	<h3 class="page_title">매입 전체 조회</h3>
	<hr>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>매입번호</th>
						<th>제목</th>
						<th>가격</th>
						<th>매입일</th>
						<th>작성자</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="purchase">
						<tr>
							<td><a href="purchaseSelect.ad?purchase_no=${purchase.purchase_no}">${purchase.purchase_no}</a></td>
							<td>${purchase.title}</td>
							<td>${purchase.purchase_price}</td>
							<td>${fn:substring(purchase.purchase_date,0,10) }</td>
							<td>${purchase.emp_name}</td>
							<td>${purchase.purchase_content}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>
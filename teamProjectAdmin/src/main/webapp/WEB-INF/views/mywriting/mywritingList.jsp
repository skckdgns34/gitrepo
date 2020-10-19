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
		
	<h3 class="page_title">내가 쓴 글 등록 신청</h3>
	<hr>
	<div class="card-body">
		<div class="table-responsive">
			 <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>장르</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mywriting">
						<tr>
							<td>${mywriting.member_no}</td>
							<td>${mywriting.my_title}</td>
							<td>${fn:substring(mywriting.my_write_date,0,10)}</td>
							<td>${mywriting.code_value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>
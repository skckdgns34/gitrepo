<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">

	<div class="container-fluid">
		
	<h3 class="page_title">문의사항 전체 조회</h3>
	<hr>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>번호</th>
						<th>문의사항제목</th>
						<th>문의사항내용</th>
						<th>등록일자</th>
						<th>문의사항카테고리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="questions">
						<tr>
							<td><a href="questionSelect.ad?question_no=${questions.question_no}">${questions.question_no}</a></td>
							<td>${questions.question_title}</td>
							<td>${questions.question_contents}</td>
							<td>${fn:substring(questions.question_date,0,10) }</td>
							<td>${questions.code_value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>